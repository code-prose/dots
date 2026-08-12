return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
        -- Jac is a Python superset; reuse the Python parser for .jac files
        vim.treesitter.language.register("python", "jac")

        require('nvim-treesitter.install').prefer_git = true
        require('nvim-treesitter.configs').setup({
            ensure_installed = { "cpp", "c", "cmake", "lua", "python", "rust" },
            sync_install = false,
            auto_install = true,
            indent = {
                enable = true,
                disable = { "cpp" },
            },
            highlight = {
                enable = true,
                disable = function(lang, buf)
                    local max_filesize = 100 * 1024
                    local ok, stats = pcall(vim.loop.fs_state, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        vim.notify(
                            "File larger than 100KB treesitter disabled for performance",
                            vim.log.levels.WARN,
                            {title = "Treesitter"}
                        )
                        return true
                    end
                end,
                additional_vim_regex_highlighting = { "markdown" },
            }
        })
    end
}
