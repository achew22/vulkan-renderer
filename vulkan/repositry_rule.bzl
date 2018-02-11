def _impl(ctx):
  #ctx.download("https://sdk.lunarg.com/sdk/download/1.0.68.0/linux/vulkansdk-linux-x86_64-1.0.68.0.run?u=", output='vulkansdk-linux-x86_64-1.0.68.0.run')
  ctx.download(
      "file:///tmp/vulkan-renderer/tmp/vulkansdk-linux-x86_64-1.0.68.0.run",
      output='vulkansdk-linux-x86_64-1.0.68.0.run',
      executable=True)

  ctx.execute(["bash", "vulkansdk-linux-x86_64-1.0.68.0.run"])#, "--target", ctx.path("./VulkanSDK")])

  ctx.file("WORKSPACE", content="""
workspace(name = "vulkan")
""")
  ctx.file("BUILD.bazel", content="""
cc_library(
    name = "vulkan",
    hdrs = glob([
        #"VulkanSDK/*/x86_64/include/**/*.h",
        "VulkanSDK/1.0.68.0/x86_64/include/**/*.h",
    ]),
    visibility = ["//visibility:public"],
    strip_include_prefix = "VulkanSDK/1.0.68.0/x86_64/include",
)
""")

vulkan = repository_rule(
    implementation = _impl,
)
