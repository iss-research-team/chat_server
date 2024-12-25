#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

docker run \
  -it \
  --rm \
  --network=host \
  --name chat_server_9017 \
  --gpus "device=1" \
  --shm-size 32G \
  -w /chat_server \
  chat_server:v1.3.1