cc_library(
    name = "nlohmann_json",
    hdrs = [
        "include/dpp/nlohmann/json_fwd.hpp",
        "include/dpp/nlohmann/json.hpp",
    ],
    strip_include_prefix = "include",
    visibility = ["//visibility:public"],
)

cc_library(
  name = "json",
  hdrs = ["include/dpp/json.h"],
  strip_include_prefix = "include",
  deps = [":nlohmann_json"],  # We always build with the provided one
  visibility = ["//visibility:public"],
)

config_setting(
    name = "no_coro",
    values = {
      "define": "DPP_NO_CORO=1"
    },
)

config_setting(
    name = "dpp_formatters",
    values = {"define": "DPP_FORMATTERS=1"},
)

# Precompiled headers???

config_setting(
    name = "avx_type",
    values = {"define": "AVX_TYPE=1"}
)

cc_library(
  name = "dave_includes",
  hdrs = glob([
    "src/dpp/dave/*.h",
  ]),
  strip_include_prefix = "src/dpp/dave",
)

# ./coro_loop/coro_loop.cpp:int main() {
# ./davetest/dave.cpp:int main() {
# ./httpservertest/httpservertest.cpp:int main() {
# ./soaktest/soak.cpp:int main() {
# ./sockettest/socket.cpp:int main() {
# ./unittest/test.cpp:int main(int argc, char *argv[])
# ./unittest/test.cpp:int main() {\n\
# ./unittest/test.cpp:int main() {\n\
# ./userapptest/userapp.cpp:int main() {

cc_library(
    name = "dpp",
    hdrs = glob([
        "include/dpp/*.h",
        "include/dpp/coro/*.h",
        "include/dpp/isa/*.h",
    ], ["include/dpp/json.h"]),
    srcs = glob([
        "src/**/*.cpp",
        "src/dpp/voice/enabled/enabled.h",
        "src/dpp/socketengines/kqueue-facade.h",
    ], ["src/unittest/*.cpp", "src/dpp/voice/stub/stubs.cpp",
        "src/dpp/socketengines/kqueue.cpp", # TODO: Add support for bsd here
        "src/coro_loop/coro_loop.cpp",
        "src/davetest/**",
        "src/httpservertest/**",
        "src/unittest/**",
        "src/userapptest/**",
        "src/soaktest/**",
        "src/sockettest/**",
        "src/dpp/socketengines/poll.cpp", # TODO: Make this configurable? (may remove epoll.cpp instead)
    ]),
    strip_include_prefix = "include",
    deps = [
        ":dave_includes",
        ":json",
        "//mlspp",
        "//mlspp/lib/bytes",
        "@openssl//:openssl",
    ],
    copts = [
      "-std=c++20",
    ],
    defines = {
      "HAVE_VOICE": "1",
    },
)


toolchain(
    name = "cpp_toolchain",
    exec_compatible_with = [
        "@platforms//os:windows",
        "@platforms//cpu:x86_64",
    ],
    target_compatible_with = [
        "@platforms//os:windows",
        "@platforms//cpu:x86_64",
    ],
    toolchain = ":barc_windows",
    toolchain_type = ":toolchain_type",
)
