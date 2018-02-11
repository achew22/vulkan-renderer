workspace(name = "com_github_wmmiii_vulkan_renderer")

new_http_archive(
    name = "glfw",
    build_file = "glfw.BUILD",
    strip_prefix = "glfw-master",
    url = "https://github.com/glfw/glfw/archive/master.zip",
)

new_http_archive(
    name = "glm",
    build_file = "glm.BUILD",
    strip_prefix = "glm-master",
    url = "https://github.com/g-truc/glm/archive/master.zip",
)

load("@com_github_wmmiii_vulkan_renderer//vulkan:repositry_rule.bzl", "vulkan")

vulkan(
    name = "vulkan",
)
