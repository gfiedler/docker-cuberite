FROM ubuntu
MAINTAINER Gerald Fiedler <gfiedler@sftech.de>

RUN apt-get update \
    && apt-get install -y \
      cmake \
      gcc \
      g++ \
      git \
      lua5.2 \
      make \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN git clone --recursive https://github.com/cuberite/cuberite.git
RUN mkdir build && cd build && cmake ../cuberite && make && rm -rf /build

WORKDIR /cuberite/Server
CMD ["./Cuberite"]
