

cc_library(
  name = "internal_headers",
  hdrs = glob(["src/*.h"]),
)

cc_library(
  name = "hpke",
  srcs = glob(["src/*.cpp"]),
  hdrs = glob(["include/hpke/*.h"]),
  deps = [
    "//mlspp/lib/bytes",
    "//:json",
  ],
  strip_include_prefix = "include",
  implementation_deps = [
    ":internal_headers",
    "@openssl//:crypto",
  ],
  copts = [
    "-std=gnu++17",
    "-DWITH_OPENSSL3",
  ],
  visibility = ["//visibility:public"],
)

