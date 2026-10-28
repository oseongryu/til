#!/usr/bin/env python3
"""Codex 작업 완료 알림."""

import argparse
import json
from pathlib import Path
import subprocess
import sys


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("summary", nargs="?")
    parser.add_argument("--telegram", action="store_true")
    parser.add_argument("--slack", action="store_true")
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    channels = [name for name in ("telegram", "slack") if getattr(args, name)]
    if not channels or (not args.check and not args.summary):
        parser.error("서비스와 작업 요약을 지정하세요. 설정 확인은 --check를 사용하세요.")
    path = Path(__file__).resolve().with_name("notifications.json")
    try:
        config = json.loads(path.read_text())
    except (OSError, ValueError):
        print("Codex 알림 설정 파일을 읽을 수 없습니다.", file=sys.stderr)
        return 1
    failed = False
    for name in channels:
        entry = config.get(name, {}) if isinstance(config, dict) else {}
        target_key = "chat_id" if name == "telegram" else "channel"
        if not isinstance(entry, dict) or not all(
            isinstance(entry.get(key), str) and entry[key].strip()
            and not any(char in entry[key] for char in "\r\n")
            for key in ("token", target_key)
        ):
            print(f"{name}: 설정 누락 또는 형식 오류")
            failed = True
            continue
        if args.check:
            print(f"{name}: 로컬 설정 확인 완료 (전송하지 않음)")
            continue
        message = "mac-m1: " + args.summary
        if name == "telegram":
            url = f"https://api.telegram.org/bot{entry['token']}/sendMessage"
            headers = ["Content-Type: application/json; charset=utf-8"]
        else:
            url = "https://slack.com/api/chat.postMessage"
            headers = ["Content-Type: application/json; charset=utf-8",
                       f"Authorization: Bearer {entry['token']}"]
        payload = json.dumps({target_key: entry[target_key], "text": message}, ensure_ascii=False)
        settings = [("url", url), ("request", "POST")]
        settings.extend(("header", header) for header in headers)
        settings.append(("data-binary", payload))
        curl_config = "\n".join(f"{key} = {json.dumps(value, ensure_ascii=False)}" for key, value in settings)
        try:
            result = subprocess.run(
                ["curl", "--silent", "--show-error", "--max-time", "20", "--config", "-"],
                input=curl_config, text=True, encoding="utf-8", capture_output=True, timeout=25,
            )
            if result.returncode:
                print(f"{name}: 전송 실패 (curl 종료 코드 {result.returncode})")
                failed = True
                continue
            response = json.loads(result.stdout)
            if isinstance(response, dict) and response.get("ok") is True:
                print(f"{name}: 전송 완료")
            else:
                print(f"{name}: API가 전송을 승인하지 않음")
                failed = True
        except (OSError, subprocess.TimeoutExpired, ValueError):
            print(f"{name}: 전송 또는 응답 확인 실패")
            failed = True
    return int(failed)


if __name__ == "__main__":
    sys.exit(main())
