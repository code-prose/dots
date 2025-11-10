return {
    'MeanderingProgrammer/render-markdown.nvim',
    after = { 'nvim-treesitter' },
    requires = { 'nvim-mini/mini.icons', opt = true },        -- if you use standalone mini plugins
    config = function()
        require('render-markdown').setup({})
    end,
}
