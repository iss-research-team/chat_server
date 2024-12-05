#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

docker run \
  -d \
  --rm \
  --network=host \
  --name chat_server_9017 \
  --gpus "device=1" \
  --shm-size 32G \
  -v "$SCRIPT_DIR:/chat_server" \
  -w /chat_server \
  chat_server:v1.2 \
  python3 main.py --port 9017 --model_path model/qwen2.5-14b-instruct-q8_0.gguf