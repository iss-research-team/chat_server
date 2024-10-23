#!/bin/bash
# Description: Start chat server
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
# chat_server
for port in 9010 9011
do
  docker run \
    -d \
    --restart=always \
    --network=host \
    --name chat_server_$port \
    --gpus "device=0" \
    --shm-size 32G \
    -v "$SCRIPT_DIR:/chat_server" \
    -w /chat_server \
    chat_server:v1.0 \
    python3 main.py --port $port --model_path model/qwen2-7b-instrust-awq-q4_K_M.gguf
done

for port in 9012 9013
do
  docker run \
    -d \
    --restart=always \
    --network=host \
    --name chat_server_$port \
    --gpus "device=1" \
    --shm-size 32G \
    -v "$SCRIPT_DIR:/chat_server" \
    -w /chat_server \
    chat_server:v1.0 \
    python3 main.py --port $port --model_path model/qwen2-7b-instrust-awq-q4_K_M.gguf
done
