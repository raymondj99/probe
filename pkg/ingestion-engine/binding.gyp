{
    "targets": [
        {
            "target_name": "ingestion",
            "sources": [
                "src/ingestion.cpp",
                "src/grpc_server.cpp",
                "src/hello.grpc.pb.cc",
                "src/hello.pb.cc"
            ],
            "include_dirs": [
                "<!(node -e \"require('node-addon-api').include\")",
                "<(module_root_dir)/include>",
            ],
            "libraries": [
                "<(module_root_dir)/lib/libgrpc++.a",
                "<(module_root_dir)/lib/libgrpc.a",
                "<(module_root_dir)/lib/libprotobuf.a",
                "<(module_root_dir)/lib/libabsl_strings.a",
                "<(module_root_dir)/lib/libabsl_base.a"
            ],
            "defines": ["NAPI_DISABLE_CPP_EXCEPTIONS"],
            "cflags": ["-std=c++17"],
            "cflags_cc": ["-std=c++17"]
        }
    ]
}