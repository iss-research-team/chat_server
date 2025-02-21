#!/bin/bash
# Description: Start chat server
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
# chat_server
for port in 9010 9011 9012
do
  docker run \
    -d \
    --rm \
    --network=host \
    --name chat_server_$port \
    --gpus "device=0" \
    --shm-size 32G \
    -v "$SCRIPT_DIR:/chat_server" \
    -w /chat_server \
    chat_server:v1.3 \
    python3 main.py --port $port --model_path model/Meta-Llama-3.1-8B-Instruct-Q4_K_M.gguf
done

for port in 9013 9014 9015
do
  docker run \
    -d \
    --rm \
    --network=host \
    --name chat_server_$port \
    --gpus "device=1" \
    --shm-size 32G \
    -v "$SCRIPT_DIR:/chat_server" \
    -w /chat_server \
    chat_server:v1.3 \
    python3 main.py --port $port --model_path model/Meta-Llama-3.1-8B-Instruct-Q4_K_M.gguf
done
