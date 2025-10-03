load("@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl", "feature", "flag_set", "flag_group", "tool_path", "cc_toolchain_config")

def _impl(ctx):
    return cc_toolchain_config(
        features = [
            feature(
                name = "c++17_mode",
                enabled = True,
                flag_sets = [
                    flag_set(
                        actions = ["c++-compile"],
                        flag_groups = [
                            flag_group(
                                flags = ["-std=c++17"],
                            ),
                        ],
                    ),
                ],
            ),
        ],
        # tool_paths = [
        #     tool_path(name = "gcc", path = "/usr/bin/gcc"),
        #     tool_path(name = "ld", path = "/usr/bin/ld"),
        # ],
    )

cpp_toolchain = rule(
    implementation = _impl,
    attrs = {},
)
