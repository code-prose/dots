return {
    "mason-org/mason.nvim",
    lazy = false,
    opts = {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        },
        pip = {
            executable = "uv",
            args = { "pip" }
        },
    },
}
