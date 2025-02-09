#include <napi.h>
#include <grpc_server.h>

Napi::Value StartServer(const Napi::CallbackInfo& info) {
    Napi::Env env = info.Env();
    RunServer();
    return Napi::Boolean::New(env, true);
}

static Napi::Object Init(Napi::Env env, Napi::Object exports) {
    exports.Set(Napi::String::new(env, "startServer"), Napi::Function::New(env, StartServer));
    return exports;
}

NODE_API_MODULE(ingestion, Init)