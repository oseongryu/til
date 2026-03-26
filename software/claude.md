
## claude memory vs resume

```
  /memory (메모리 시스템)
  - 내가 의도적으로 저장하는 요약 노트
  - 위치: ~/.claude/projects/<현재프로젝트>/memory/*.md
  - 내용: 사용자 선호, 프로젝트 컨텍스트, 피드백 등 핵심 정보만
  - 용도: 새 대화를 시작해도 이전 맥락을 기억하게 하는 것
  - 크기: 작고 구조화됨  
   
  JSONL 히스토리 (스크립트가 관리하는 것)
  - 대화의 원본 로그 전체
  - 위치: ~/.claude/projects/<프로젝트>/xxxx.jsonl 
  - 내용: 모든 메시지, 툴 호출, 결과 — 날것 그대로
  - 용도: /resume으로 이전 대화를 그대로 이어가는 것
  - 크기: 대화할수록 수천 줄   

  ~/.claude/projects/-Users-oseongryu-git-git-worktree-web/
  ├── *.jsonl← /resume 히스토리 (대화 원본)   
  ├── <uuid>/← subagents, tool-results 
  │   ├── subagents/
  │   └── tool-results/  
  └── memory/← /memory 메모 (아직 없음)
      ├── MEMORY.md
      └── *.md
```
