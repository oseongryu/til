# Codex 전역 설정과 프로젝트 지침

Codex의 작업 지침은 `AGENTS.md`, 모델과 실행 환경 설정은 `config.toml`로 관리한다. 두 파일의 역할을 구분하면 개인 기본값과 프로젝트 규칙을 따로 유지할 수 있다.

## 설정 파일의 역할

| 파일 | 적용 범위 | 작성할 내용 |
| --- | --- | --- |
| `~/.codex/AGENTS.md` | 사용자 전역 | 응답 방식, 공통 작업 원칙 |
| `<프로젝트>/AGENTS.md` | 프로젝트 | 구조, 개발·검증 명령, 팀 규칙 |
| `<하위 디렉터리>/AGENTS.md` | 해당 범위 | 언어·모듈별 추가 규칙 |
| `~/.codex/config.toml` | 사용자 기본 설정 | 모델, 추론 강도, 실행 권한 |
| `<프로젝트>/.codex/config.toml` | 신뢰한 프로젝트 | 프로젝트별 실행 설정 |

`~`는 사용자의 홈 디렉터리다. `CODEX_HOME`을 설정하면 전역 파일의 기준 디렉터리가 바뀐다. [공식 지침 문서](https://learn.chatgpt.com/docs/agent-configuration/agents-md), [공식 설정 문서](https://learn.chatgpt.com/docs/config-file/config-basic)

## 전역 지침 작성

먼저 설정 디렉터리를 만들고 편집기로 `~/.codex/AGENTS.md`를 작성한다. 기존 파일이 있다면 필요한 규칙을 추가하거나 수정한다.

```bash
mkdir -p ~/.codex
```

다음은 작업 원칙 예시다. 응답 언어와 검증 정책 등은 사용자와 팀의 요구에 맞게 조정한다.

```markdown
# 작업 원칙

- 기존 프로젝트의 코드 스타일과 명명 규칙을 따른다.
- 요청한 범위를 중심으로 변경하고 관계없는 사용자 변경을 보존한다.
- 변경에 적합한 검증을 수행하고 결과를 설명한다.
- 확인하지 못한 사항과 가정을 구분해서 설명한다.
```

전역 지침에는 여러 프로젝트에서 반복해서 사용하는 원칙을 적는다. 특정 저장소의 경로나 실행 명령은 프로젝트 지침에 두면 관리하기 쉽다.

## 프로젝트 지침 작성

프로젝트 루트의 `AGENTS.md`에는 개발에 필요한 정보를 적는다. 아래 대괄호 부분은 실제 저장소에서 확인한 내용으로 바꾼다.

```markdown
# 프로젝트 안내

## 개발 환경
- 패키지 매니저: [사용 도구]
- 개발 실행: [실제 실행 명령]
- 검증: [lint, typecheck, test 등 실제 명령]

## 구조
- [소스 경로]: [역할]
- [문서 경로]: [역할]

## 작업 규칙
- 기존 구조와 명명 규칙을 따른다.
- 관련 기능을 수정하기 전에 [설계 문서]를 읽는다.
```

## 지침 적용 순서

Codex는 전역 지침을 읽고 프로젝트 루트에서 현재 작업 디렉터리까지의 지침을 결합한다. 충돌하는 내용은 현재 디렉터리에 더 가까운 지침이 우선한다.

각 디렉터리에서는 다음 우선순위로 지침 파일을 선택한다.

1. `AGENTS.override.md`
2. `AGENTS.md`
3. `project_doc_fallback_filenames`로 지정한 대체 파일명

같은 디렉터리에서 여러 지침 파일을 모두 합치는 방식은 아니다. 전역 `AGENTS.override.md`도 전역 `AGENTS.md` 대신 사용된다. 기본 지침 크기 한도는 32 KiB이며, 변경 후에는 새 세션에서 확인한다. [공식 적용 순서](https://learn.chatgpt.com/docs/agent-configuration/agents-md)

## 실행 설정 작성

`~/.codex/config.toml`은 TOML 형식이다. 다음은 승인 정책과 작업 영역 접근 모드를 명시하는 예시다. 실제 사용 가능 여부는 클라이언트와 관리 정책에 따라 달라진다.

```toml
approval_policy = "on-request"
sandbox_mode = "workspace-write"
```

| 키 | 역할 |
| --- | --- |
| `model` | 기본 모델 선택 |
| `model_reasoning_effort` | 추론 강도 지정; 지원 값은 모델별로 다름 |
| `approval_policy` | 실행 승인 요청 방식 |
| `sandbox_mode` | 명령 실행 시 접근 범위 |
| `project_doc_fallback_filenames` | 프로젝트 지침의 대체 파일명 목록 |

모델명은 사용 환경에서 지원되는 값을 확인해 지정한다. 별도로 설정할 필요가 없는 항목은 기본값을 사용할 수 있다. [설정 키 참고](https://learn.chatgpt.com/docs/config-file/config-reference)

TOML에서 `[섹션]` 아래의 키는 해당 섹션에 속한다. 전역 키는 첫 번째 섹션 앞에 넣고, 이미 있는 키를 중복해서 작성하지 않는다.

실행 시 옵션과 신뢰한 프로젝트의 설정은 사용자 기본값을 재정의할 수 있다. 조직에서 강제하는 제한은 개인 설정으로 해제할 수 없으며, `AGENTS.md`에 허용 문구를 넣어도 실행 권한 자체가 바뀌지는 않는다. [설정 우선순위](https://learn.chatgpt.com/docs/config-file/config-basic)

## 적용 확인

설정을 수정한 뒤 대상 프로젝트에서 새 Codex 세션을 열고 다음처럼 요청한다.

```text
현재 적용된 전역 지침과 프로젝트 지침의 경로를 알려주고,
주요 작업 규칙을 요약해 줘. 이번 확인에서는 파일 변경이나 외부 작업을 실행하지 마.
```

예상한 규칙이 적용되지 않으면 작업 디렉터리, `CODEX_HOME`, `AGENTS.override.md` 유무를 확인한다. 실행 설정 문제라면 프로젝트 신뢰 여부와 관리 정책도 확인한다.

## 설정 공유 시 구분할 내용

공유 문서에는 설정 원리와 재사용 가능한 예시를 적는다. 개인의 장비명, 저장소별 예외, 알림 수신 대상, 자동화 정책은 개인 설정 저장소에서 관리한다.

API 키와 토큰 같은 인증값은 공유 문서와 Git에 넣지 않는다. 전역 설정 디렉터리에는 인증·세션 데이터도 있을 수 있으므로 공유할 파일을 명시적으로 선택한다.

## Reference

- [Custom instructions with AGENTS.md](https://learn.chatgpt.com/docs/agent-configuration/agents-md)
- [Config basics](https://learn.chatgpt.com/docs/config-file/config-basic)
- [Configuration Reference](https://learn.chatgpt.com/docs/config-file/config-reference)
