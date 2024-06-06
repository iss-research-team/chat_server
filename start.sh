  docker run \
    -it \
    --rm \
    --network=host \
    --name chat_server \
    --gpus all \
    --shm-size 64G \
    -v /home/mozinode4p/PycharmProjects/KG_peft:/Kg_peft \
    -w /Kg_peft/chat_server \
    llm:v1.4.1 \
    python3 main.py --port 9010