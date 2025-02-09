#ifndef SERVER_H
#define SERVER_H

#include <grpcpp/grpcpp.h>
#include "hello.grpc.pb.h"

// Function to start the gRPC Server
void RunServer();

#endif // SERVER_H