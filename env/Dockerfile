FROM nvidia/cuda:12.1.0-cudnn8-devel-ubuntu22.04
# requirements
ADD source.list /etc/apt/sources.list
RUN apt-get update && apt-get install -y python3.10 python3-pip python3.10-dev vim git cmake wget
# torch
COPY torch-2.2.0+cu121-cp310-cp310-linux_x86_64.whl torch-2.2.0+cu121-cp310-cp310-linux_x86_64.whl
RUN pip3 install torch-2.2.0+cu121-cp310-cp310-linux_x86_64.whl
# llama factory requirements
RUN pip3 install transformers==4.40.2 datasets==2.16.1 accelerate==0.27.2 peft==0.10.0 trl==0.8.1 gradio==3.50.2 \
    deepspeed==0.13.1 modelscope ipython scipy einops sentencepiece protobuf jieba rouge-chinese nltk sse-starlette  \
    matplotlib pandas numpy tqdm tensor_parallel scikit-learn ninja packaging \
    --no-cache-dir -i https://pypi.tuna.tsinghua.edu.cn/simple
# FlashAttention
RUN pip install flash-attn --no-build-isolation -i https://pypi.tuna.tsinghua.edu.cn/simple
# gptq
RUN pip install auto-gptq --no-build-isolation -i https://pypi.tuna.tsinghua.edu.cn/simple
# awq
RUN pip install autoawq -i https://pypi.tuna.tsinghua.edu.cn/simple
# llama.cpp
RUN git clone https://github.com/ggerganov/llama.cpp
RUN pip install gguf -i https://pypi.tuna.tsinghua.edu.cn/simple
WORKDIR /llama.cpp
# add path for cuda /usr/lib/x86_64-linux-gnu/
RUN apt-get install -y nvidia-cuda-toolkit
RUN cmake -B build -DGGML_CUDA=ON
RUN cmake --build build --config Release -j 8
# python build
RUN CMAKE_ARGS="-DLLAMA_CUDA=on" pip install llama-cpp-python