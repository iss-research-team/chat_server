FROM nvidia/cuda:12.4.1-cudnn-devel-ubuntu22.04

# Add sources list and install dependencies
ADD source.list /etc/apt/sources.list
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
    --no-cache-dir -i https://download.pytorch.org/whl/cu124/

RUN pip3 install ninja \
    --no-cache-dir

# Install llama-cpp-python
RUN CMAKE_ARGS="-DGGML_CUDA=on -DCMAKE_BUILD_RPATH=/usr/lib/x86_64-linux-gnu:/usr/local/cuda-12.4/compat" \
    pip install llama-cpp-python