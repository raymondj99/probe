#!/bin/bash

set -e 

GRPC_VERSION=v1.48.0
MY_INSTALL_DIR=$PWD

mkdir -p $MY_INSTALL_DIR
export PATH="$MY_INSTALL_DIR/bin:$PATH"

# Clone gRPC if it's not already downloaded
if [ ! -d "deps/grpc" ]; then
    mkdir -p deps
    pushd deps
    git clone --recurse-submodules -b ${GRPC_VERSION} https://github.com/grpc/grpc.git
    popd
fi

# Build gRPC and Protobuf
cd deps/grpc
mkdir -p cmake/build
pushd cmake/build
cmake -DgRPC_INSTALL=ON \
      -DgRPC_BUILD_TESTS=OFF \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_CXX_STANDARD=17 \
      -DCMAKE_INSTALL_PREFIX=$MY_INSTALL_DIR \
      ../..
make -j 4
make install
popd