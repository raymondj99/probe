#!/bin/bash

OUT_DIR="src"
PROTO_FILES_DIR="$OUT_DIR/protos"

# Generate the C++ source files
protoc -I=$PROTO_FILES_DIR --cpp_out=$OUT_DIR $PROTO_FILES_DIR/*.proto

# Generate the gRPC source files
protoc -I=$PROTO_FILES_DIR --grpc_out=$OUT_DIR --plugin=protoc-gen-grpc=$(which grpc_cpp_plugin) $PROTO_FILES_DIR/*.proto