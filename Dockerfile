FROM python:3

RUN apt-get update && apt-get install -y \
    build-essential \
    gfortran \
    libblas-dev \
    liblapack-dev \
    libxft-dev \
    && rm -rf /var/lib/apt/lists/*

RUN echo 'export LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"' >> ~/.bash_profile && \
    . ~/.bash_profile && \
    git clone https://github.com/taku910/mecab.git && \
    cd mecab/mecab && \
    ./configure  --enable-utf8-only && \
    make && \
    make check && \
    make install && \
    cd ../mecab-ipadic && \
    ./configure --with-charset=utf8 && \
    make && \
    make install

RUN pip3 install --upgrade pyzmq --install-option="--zmq=bundled" && \
    pip3 install --upgrade jupyter && \
    pip3 install --upgrade \
    numpy \
    scipy \
    scikit-learn \
    matplotlib \
    pandas \
    mecab-python3 \
    neologdn

VOLUME .:/notebook
WORKDIR /notebook

EXPOSE 8888

ENTRYPOINT jupyter notebook --ip=0.0.0.0 --allow-root --no-browser
