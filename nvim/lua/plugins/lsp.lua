return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "mason-org/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "VonHeikemen/lsp-zero.nvim",
    },
    lazy = false,
    config = function()
        vim.filetype.add({ extension = { jac = "jac" } })

        require("mason-lspconfig").setup({
            ensure_installed = { "clangd", "pyright", "ruff", "rust_analyzer" },
        })

    vim.lsp.config("ruff", {
            init_options = {
                settings = {
                    showSyntaxErrors = true,
                    loglevel = "info",
                    args = {},
                    lint = {
                        enable = true,
                        preview = true
                    },
                    format = {
                        preview = true,
                    }
                }     
            }       
        })
        vim.lsp.config("pyright", {})

        vim.lsp.config("rust_analyzer", {})

        vim.lsp.config("clangd", {})

        vim.lsp.enable({ "ruff", "pyright", "gopls", "rust_analyzer", "jaclang", "clangd" })

        local cmp = require('cmp')
        local lsp_zero = require('lsp-zero')
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<Tab>'] = cmp.mapping.confirm({ select = true }),
                ['<C-Space>'] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
            }, {
                { name = 'buffer' },
            })
        })

        lsp_zero.on_attach(function(client, bufnr)
            local opts = {buffer = bufnr, remap = false}

            vim.keymap.set("n", "gd", function() vim.lsp.buf.declaration() end, opts)
            vim.keymap.set("n", "gD", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
            vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
            vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
            vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

            if client:supports_method("textDocument/inlayHint") then
                vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                vim.keymap.set("n", "<leader>ih", function()
                    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
                end, opts)
            end

            if client.name == "clangd" then
                vim.keymap.set("n", "gh", "<cmd>ClangdSwitchSourceHeader<CR>", opts)
                vim.keymap.set("n", "<leader>ci", "<cmd>ClangdSymbolInfo<CR>", opts)
                vim.keymap.set("n", "<leader>ca", "<cmd>ClangdAST<CR>", opts)
                vim.keymap.set("n", "<leader>cm", "<cmd>ClangdMemoryUsage<CR>", opts)
                vim.keymap.set("n", "<leader>cth", "<cmd>ClangdTypeHierarchy<CR>", opts)
            end

        end)
        
        lsp_zero.setup({})
        
        vim.diagnostic.config({
            virtual_text = true,
            sign = true,
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = '✘',
                    [vim.diagnostic.severity.WARN] = '▲',
                    [vim.diagnostic.severity.HINT] = '⚑',
                    [vim.diagnostic.severity.INFO] = '●',
                },
            },
        })
    end
}
