# 1. mac 다운로드

## 설치
brew install git-lfs

# 설치여부 확인 (Git LFS initialized. 나오면 성공)
git lfs install



# 2. 모델 다운로드

git clone https://huggingface.co/openai/gpt-oss-120b

# If you want to clone without large files - just their pointers
GIT_LFS_SKIP_SMUDGE=1 git clone https://huggingface.co/openai/gpt-oss-120b




# 2. ollama 사용 (Mac M1)

## 2.1. ollama 다운로드

https://ollama.com/download


## 2.2 ollama 실행

```bash
ollama pull gpt-oss:120b
ollama run gpt-oss:120b


ollama pull gpt-oss:20b
ollama run gpt-oss:20b
```

# 3. using (python)

```python
from openai import OpenAI

client = OpenAI(
    base_url="http://localhost:11434/v1",  # Local Ollama API
    api_key="ollama"                       # Dummy key
)

response = client.chat.completions.create(
    model="gpt-oss:20b",
    messages=[
        {"role": "system", "content": "You are a helpful assistant."},
        {"role": "user", "content": "Explain what MXFP4 quantization is."}
    ]
)

print(response.choices[0].message.content)
```

# 4. use (open-webui)

```bash
# 파이썬 버전은 3.11 이어야함
pip install open-webui
open-webui serve
```