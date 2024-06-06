# Description: Start chat server
# chat_server
for port in 9010 9011 9012 9013
do
  docker run \
    -d \
    --rm \
    --network=host \
    --name chat_server_$port \
    --gpus "device=0" \
    --shm-size 32G \
    -v /home/mozinode4p/PycharmProjects/KG_peft:/KG_peft \
    -w /KG_peft/chat_server \
    llm:v1.4.1 \
    python3 main.py --port $port
done

for port in 9014 9015 9016 9017
do
  docker run \
    -d \
    --rm \
    --network=host \
    --name chat_server_$port \
    --gpus "device=1" \
    --shm-size 32G \
    -v /home/mozinode4p/PycharmProjects/KG_peft:/KG_peft \
    -w /KG_peft/chat_server \
    llm:v1.4.1 \
    python3 main.py --port $port
done
