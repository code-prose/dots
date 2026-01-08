return {
    "epwalsh/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit
    event = "VeryLazy",
    ft = "markdown",
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
        "nvim-telescope/telescope.nvim",
    },
    opts = {
        workspaces = {
            {
                name = "personal",
                path = "~/notes/vault",
            },
        },
        templates = {
            folder = "templates",
            date_format = "%Y-%m-%d",
            time_format = "%H:%M",
        },
        daily_notes = {
            date_format = "%Y-%m-%d",
            default_tags = { "daily-notes" },
            template = "Note Template",
        },
        completion = {
            nvim_cmp = true,
            min_chars = 2,
        },
        mappings = {
            ["gf"] = {
                action = function()
                    return require("obsidian").util.gf_passthrough()
                end,
                opts = { noremap = false, expr = true, buffer = true },
            },
        },
    },
    config = function(_, opts)
        require("obsidian").setup(opts)

        -- Set conceallevel for markdown files (required for obsidian.nvim features)
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "markdown",
            callback = function()
                vim.opt_local.conceallevel = 2
            end,
        })
    end,
}
