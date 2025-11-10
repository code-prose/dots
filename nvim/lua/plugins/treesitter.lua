return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
        require('nvim-treesitter.install').prefer_git = true
        require('nvim-treesitter.configs').setup({
            esnure_installed = {},
            sync_install = false,
            auto_install = false,
            indent = {
                enable = true
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
