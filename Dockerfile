FROM ubuntu:18.04

LABEL maintainer="Felix Gündling <felixguendling@gmail.com>"

ADD blob/cmake-3.17.1-Linux-x86_64.tar.gz/ /opt/
ADD blob/boost_1_72_0.tar.bz2/ /opt/
ENV PATH="/opt/cmake-3.16.0-rc3-Linux-x86_64/bin:${PATH}"
ENV ASAN_SYMBOLIZER_PATH="/usr/bin/llvm-symbolizer"

RUN export DEBIAN_FRONTEND=noninteractive \
    && sed -i 's!archive\.ubuntu!de.archive.ubuntu!' /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends apt-utils software-properties-common wget gnupg \
    && wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - \
    && add-apt-repository -y ppa:ubuntu-toolchain-r/test \
    && add-apt-repository -y ppa:git-core/ppa \
    && echo "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-9 main" > /etc/apt/sources.list.d/llvm.list \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
        ssh-client git p7zip npm \
        ninja-build \
        g++ g++-9 \
        clang-9 clang-format-9 clang-tidy-9 llvm-9 \
        libc++-9-dev libc++abi-9-dev clang-tools-9 \
        valgrind \
        ccache \
    && rm -rf /var/cache/apk/* \
    && cp -r /opt/boost_1_72_0 /opt/boost_1_72_0-libc++ \
    && cd /opt/boost_1_72_0 \
    && ./bootstrap.sh \
    && ./b2 -j6 link=static threading=multi variant=release \
          --with-system \
          --with-filesystem \
          --with-iostreams \
          --with-program_options \
          --with-thread \
          --with-date_time \
          --with-regex \
          --with-serialization \
          -s NO_BZIP2=1 \
    && echo "using clang : 9 : /usr/bin/clang++-9 ;" > $HOME/user-config.jam \
    && cd /opt/boost_1_72_0-libc++ \
    && ./bootstrap.sh \
    && ./b2 -j6 link=static threading=multi variant=release \
                toolset=clang-9 cxxflags="-stdlib=libc++" \
          --with-system \
          --with-filesystem \
          --with-iostreams \
          --with-program_options \
          --with-thread \
          --with-date_time \
          --with-regex \
          --with-serialization \
          -s NO_BZIP2=1

RUN mkdir -p ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts
RUN ln -s /usr/bin/llvm-symbolizer-9 /usr/bin/llvm-symbolizer
RUN ln -s /opt/cmake-3.17.1-Linux-x86_64/bin/cmake /usr/bin/cmake

COPY toolchain /toolchain/
COPY bin/ /usr/bin/
COPY blob/pkg /usr/bin

WORKDIR /root
