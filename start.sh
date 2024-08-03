docker run \
  -it \
  --rm \
  --network=host \
  --name chat_server \
  --gpus all \
  --shm-size 64G \
  -v /home/mozinode4p/PycharmProjects/chat_server:/chat_server \
  -w /chat_server \
  chat_server:v1.0 \
  python3 main.py --port 9010 --model_path model/qwen1_5-7b-chat-q4_0.gguf