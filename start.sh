#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

docker run \
  -d \
  --rm \
  --network=host \
  --name chat_server_9010 \
  --gpus "device=0" \
  --shm-size 32G \
  -v "$SCRIPT_DIR:/chat_server" \
  -w /chat_server \
  chat_server:v1.0 \
  python3 main.py --port 9010 --model_path model/qwen1_5-7b-chat-q4_0.gguf