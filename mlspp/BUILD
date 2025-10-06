
cc_library(
  name = "mlspp_internal_headers",
  hdrs = glob(["src/*.h"]),
)

cc_library(
  name = "mlspp",
  srcs = glob([
    "src/*.cpp"
  ]),
  hdrs = glob([
    "include/mls/*.h",
  ]),
  implementation_deps = [
    ":mlspp_internal_headers",
    "//mlspp/lib/hpke",
  ],
  strip_include_prefix = "include",
  copts = ["-std=c++17"],
  visibility = ["//visibility:public"],
)

