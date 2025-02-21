#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

docker run \
  -it \
  --rm \
  --network=host \
  --name chat_server_9010 \
  --gpus all \
  --shm-size 32G \
  -v "$SCRIPT_DIR:/chat_server" \
  -w /chat_server \
  ft_tools:v1_20250210 \
  python3 main.py --port 9010 --model_path model/deepseek_r1-distill-qwen-7b-q4_K_M.gguf
  