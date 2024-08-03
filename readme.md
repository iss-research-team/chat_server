# Chat_server

中文：本地的量化大模型chat服务，基于llama.cpp，llama-cpp-python
基于Dockers部署，支持多个模型同时部署。

en: A local quantization large model chat service based on llama.cpp, llama-cpp-python
Deployed based on Dockers, supporting the deployment of multiple models at the same time.

## Dockerfile

[Dockerfile](env%2FDockerfile)

```Bash
# path: env
docker build -t chat_server:v1.0 .
```

## 部署

```Bash
./start.sh
```

### 细节

```Bash
# start.sh 文件 可以根据自己的需求修改
# 将模型（.gguf）文件放入model文件夹
docker run \
    -it \
    --rm \
    --network=host \
    --name chat_server \
    --gpus all \
    --shm-size 64G \
    -v /[file_path]/chat_server:/chat_server \
    -w /chat_server \
    chat_server:v1.0 \
    python3 main.py --port 9010 --model_path model/qwen1_5-7b-chat-q4_0.gguf
```
```Bash
    --port  # 端口
    --model_path  # 模型路径
    --n_ctx  # 上下文长度
```

## 服务

```python
import requests

inputs = '你好'
history = [
    {"role": "system", "content": "你是一个数控机床领域故障诊断助手"}
]

url = "http://[ip]:[port]/chat"
res = requests.post(url,
                    json={"inputs": inputs, "history": history},
                    timeout=60)

print(res.json()['date'])

```