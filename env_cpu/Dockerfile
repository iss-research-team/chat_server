FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    python3.10-dev \
    vim \
    git \
    cmake \
    wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Llama Factory requirements
RUN pip3 install torch \
    --no-cache-dir -i https://download.pytorch.org/whl/cpu/

RUN pip3 install ninja \
    --no-cache-dir

# install other requirements
RUN pip3 install fastapi  \
    uvicorn[standard]  \
    jinja2  \
    aiofiles  \
    numpy  \
    pandas  \
    requests  \
    python-multipart  \
    openpyxl  \
    python-docx  \
    pymysql  \
    aiomysql  \
    apscheduler  \
    cryptography  \
    redis  \
    py2neo \
    -U --no-cache-dir -i https://pypi.tuna.tsinghua.edu.cn/simple

# Install llama-cpp-python
RUN pip install llama-cpp-python

