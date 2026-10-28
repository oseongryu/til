# Codex 전역 설정

확인일: 2026-10-28 / 로컬 CLI: `codex-cli 0.165.0`

## 먼저 알아둘 파일

Claude Code의 `~/.claude/CLAUDE.md`처럼 모든 프로젝트에 적용할 작업 지침은 **`~/.codex/AGENTS.md`**에 작성한다. 모델과 실행 권한 같은 프로그램 설정은 **`~/.codex/config.toml`**로 분리한다.

| 파일 | 용도 | 넣을 내용 |
| --- | --- | --- |
| `~/.codex/AGENTS.md` | 개인 전역 지침 | 응답 언어, 코드 스타일, 작업 과정 |
| `<프로젝트>/AGENTS.md` | 프로젝트 지침 | 실행·검증 명령, 구조, 프로젝트 규칙 |
| `<하위 디렉터리>/AGENTS.md` | 세부 작업 지침 | 해당 디렉터리의 규칙 |
| `~/.codex/config.toml` | 개인 실행 설정 | 모델, 추론 강도, 승인 정책, 샌드박스 |
| `<프로젝트>/.codex/config.toml` | 프로젝트 실행 설정 | 신뢰한 프로젝트의 설정 재정의 |

`CODEX_HOME`을 별도로 지정하면 전역 파일의 기준 경로가 달라진다. 현재 환경에는 별도 값이 없었다. [공식 지침 파일 문서](https://learn.chatgpt.com/docs/agent-configuration/agents-md), [공식 설정 문서](https://learn.chatgpt.com/docs/config-file/config-basic)

## 준비한 전역 지침

[codex-global-instructions.md](./codex-global-instructions.md)를 `~/.codex/AGENTS.md`로 복사해서 사용한다. TIL의 원본은 설명용 템플릿이며, 해당 이름으로 저장된 것만으로 전역 적용되지는 않는다.

전역 지침은 기존 **`~/.claude/CLAUDE.md`를 직접 읽고 전체 규칙을 따르는 연결 파일**이다. 사용자 요청에 따라 Git 자동화와 앱 알림까지 동일하게 적용하도록 변경했다. 별도 복사본으로 규칙을 관리하지 않으므로 이후 Claude 원본의 변경도 Codex가 다음 작업에서 읽을 때 반영된다.

현재 원본의 동작은 다음과 같다. 이 표는 확인 시점의 기록이며 실제 실행 시에는 원본의 현재 값이 기준이다.

| 항목 | 공통 동작 |
| --- | --- |
| 응답·코드 스타일 | 한국어, 이모지 생략, 최소 주석, 짧은 로그 |
| 테스트 파일 | 명시적 요청 시에만 생성 |
| 작업 기록 | 모든 요청을 KST 타임스탬프의 개별 파일로 먼저 등록 |
| 기록 위치 | `~/git` 하위는 프로젝트 루트 `tasks/`, 그 외는 `~/tasks/` |
| 완료 순서 | 작업 파일 완료·요약 → 앱 알림 → Git |
| Slack | OFF |
| Telegram | ON, 원본에 지정된 수신 대상 사용 |
| 알림 형식 | `mac-m1: [명사요약]` |
| 기본 Git 모드 | `PUSH`: add + commit + push |
| `~/git/fredit` | `COMMIT`: 커밋까지 |
| `~/git/plan_prototype` | `NONE`: Git 자동화 제외 |
| 커밋 메시지 | 알림과 동일한 명사요약, 트레일러 없음 |

Codex에 없는 `TodoWrite`는 사용 가능한 계획 도구 또는 작업 파일 기록으로 대체한다. `@CLAUDE.PJT.md`는 명시적으로 해당 로컬 파일을 읽도록 연결했다. 코드 스타일과 자동화 설정 자체는 기존 원본을 따른다.

알림 인증값은 TIL에 저장하지 않는다. 실행할 때 로컬 원본에서 읽어 사용한다. 원본을 읽을 수 없거나 실행 권한이 제한되면 그 사실을 보고하며 자동화 성공으로 처리하지 않는다.

### 적용

이번 작업 세션은 `~/.codex`가 읽기 전용이므로 전역 파일은 아직 생성하지 않았다. 아래 명령은 **사용자 터미널**에서 실행한다. 기존 파일이 생긴 경우 덮어쓰기 전에 확인하도록 `cp -i`를 사용했다.

```bash
mkdir -p ~/.codex
cp -i ~/git/til/tools/codex-global-instructions.md ~/.codex/AGENTS.md
```

TIL의 연결 파일 자체를 수정하면 다시 복사해야 한다. 한국어 응답, 알림 ON/OFF, Git 모드 등 공통 규칙은 `~/.claude/CLAUDE.md`에서 수정하면 된다. 연결 파일은 이 로컬 원본을 읽으므로 인증값을 다른 파일에 복사할 필요가 없다.

새 Codex 세션을 열어 다음처럼 확인한다.

```text
현재 적용된 전역 지침과 프로젝트 지침의 파일 경로를 알려주고,
응답 언어, 작업 기록, 앱 알림, Git 모드와 경로 예외를 요약해 줘.
인증값은 출력하지 마. 이번 확인 요청에 한해 파일 변경·알림·Git은 실행하지 마.
```

## 지침 적용 순서

전역 지침을 읽고, 프로젝트 루트부터 현재 작업 디렉터리까지의 지침을 이어서 읽는다. 충돌하는 내용은 더 가까운 디렉터리의 지침이 우선한다.

같은 디렉터리에서는 다음 순서로 첫 번째 비어 있지 않은 파일 하나를 사용한다.

1. `AGENTS.override.md`
2. `AGENTS.md`
3. 설정한 대체 파일명

전역 `AGENTS.override.md`가 있으면 전역 `AGENTS.md` 대신 사용한다. 프로젝트 지침의 기본 크기 한도는 32 KiB이므로 반복되는 긴 설명보다 실제로 지켜야 할 규칙을 짧게 적는다. 변경 후에는 새 세션에서 확인한다. [공식 적용 순서](https://learn.chatgpt.com/docs/agent-configuration/agents-md)

## config.toml 초기 설정

현재 로컬 파일은 다음과 같으며, 이번 작업에서 변경하지 않았다. 모델명은 현재 설정을 기록한 것이고 특정 모델을 새로 추천하는 의미는 아니다.

```toml
model = "gpt-6-astra"
model_reasoning_effort = "high"

[tui]
screen_reader_detection_done = true
```

처음에는 모델을 그대로 사용하고 전역 지침부터 적용하면 된다. 실행 권한을 직접 설정할 필요가 있을 때 다음 항목을 검토한다.

```toml
# 선택 예시: 기존 config.toml의 첫 번째 [섹션] 위에 추가
approval_policy = "on-request"
sandbox_mode = "workspace-write"
```

| 항목 | 의미 |
| --- | --- |
| `model` | 기본 모델 |
| `model_reasoning_effort` | 추론 강도. 지원 값은 모델에 따라 다름 |
| `approval_policy = "on-request"` | 에이전트가 필요할 때 실행 승인을 요청 |
| `sandbox_mode = "workspace-write"` | 작업 영역 중심의 파일 쓰기를 허용하는 실행 모드 |

TOML에서 `[tui]` 아래에 키를 덧붙이면 전역 키가 아니라 `tui` 항목이 된다. 위 예시의 전역 키는 반드시 첫 번째 섹션 앞에 넣고 기존 키와 중복되지 않게 편집한다.

지침 파일에 “허용한다”고 적는 것으로 실행 권한이 바뀌지는 않는다. 관리 정책이나 세션에서 정한 제한은 개인 설정으로 해제할 수 없다. 실행 시 옵션이나 신뢰한 프로젝트 설정이 개인 기본값보다 우선할 수 있다. [설정 기본 안내](https://learn.chatgpt.com/docs/config-file/config-basic), [설정 키 참고](https://learn.chatgpt.com/docs/config-file/config-reference)

## 기존 프로젝트의 CLAUDE.md 재사용

프로젝트에 `CLAUDE.md`만 있는 경우에는 아래 설정으로 대체 파일명을 지정할 수 있다. 전역 키이므로 첫 번째 TOML 섹션 앞에 넣는다.

```toml
project_doc_fallback_filenames = ["CLAUDE.md"]
```

이 설정은 프로젝트에서 `AGENTS.override.md`나 `AGENTS.md`가 없을 때 사용할 대체 이름이다. 두 파일의 내용을 항상 합치는 기능도, `~/.claude/CLAUDE.md`를 전역으로 불러오는 기능도 아니다.

기존 파일에 Claude 전용 도구나 자동 푸시·외부 알림 지시가 있을 수 있으므로 내용을 검토한 뒤 선택한다. 이번에는 이 옵션을 적용하지 않았다. [대체 파일명 설정](https://learn.chatgpt.com/docs/agent-configuration/agents-md)

## 프로젝트 지침 예시

전역에는 개인 취향을 두고 프로젝트에는 실제 명령과 구조를 적는다. 아래는 작성 틀이며, 대괄호 부분을 확인한 값으로 바꿔서 사용한다.

```markdown
# 프로젝트 지침

## 환경
- 패키지 매니저: [저장소에서 사용하는 도구]
- 개발 실행: [실제 명령]
- 검증: [실제 lint, typecheck, test 명령]

## 구조
- [소스 경로]: [역할]
- [문서 경로]: [역할]

## 작업 규칙
- 기존 구조와 명명 규칙을 따른다.
- 변경 범위에 해당하는 검증을 실행하고 결과를 설명한다.
- [프로젝트 설계 문서]는 관련 기능을 수정하기 전에 읽는다.
```

반복 작업이 생기면 스킬, 외부 서비스 연결이 필요해지면 MCP나 플러그인을 검토한다. 초기 설정 단계에서는 전역 지침과 프로젝트 지침만으로 시작해도 된다.

## Reference

- [Custom instructions with AGENTS.md](https://learn.chatgpt.com/docs/agent-configuration/agents-md)
- [Config basics](https://learn.chatgpt.com/docs/config-file/config-basic)
- [Configuration Reference](https://learn.chatgpt.com/docs/config-file/config-reference)
