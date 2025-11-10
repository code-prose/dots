return {
    'stevearc/oil.nvim',
    --@module 'oil'
    --@type oil.SetupOpts
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    lazy = false,
    config = function()
        require("oil").setup({
            columns = {
                "icon"
            },
            view_options = {
                show_hidden = true,
                is_hidden_file = function(name, bufnr)
                    return vim.startswith(name, ".")
                end,
                is_always_hidden = function(name, bufnr)
                    return false
                end,
                natural_order = true,
                case_insensitive = true,
                sort = {
                    { "type", "asc" },
                    { "name", "asc" },
                },
            },
        })
    end
}
