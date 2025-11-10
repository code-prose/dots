return {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {
        transparent = true,
        styles = {
            comments = { italic = true },
            keywords = { italic = false },
            sidebars = "transparent",
            floats = "transparent",
        },
    },
    as = 'tokyonight'
}
