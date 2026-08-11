return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "theHamsta/nvim-dap-virtual-text",
        "jay-babu/mason-nvim-dap.nvim",
    },
    lazy = false,
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        require("mason-nvim-dap").setup({
            ensure_installed = { "codelldb" },
            automatic_installation = true,
            handlers = {},
        })

        dapui.setup()
        require("nvim-dap-virtual-text").setup()

        dap.listeners.before.attach.dapui_config = function() dapui.open() end
        dap.listeners.before.launch.dapui_config = function() dapui.open() end
        dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
        dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

        vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError" })
        vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DiagnosticWarn" })

        local opts = { noremap = true, silent = true }
        vim.keymap.set("n", "<F5>", function() dap.continue() end, opts)
        vim.keymap.set("n", "<F9>", function() dap.toggle_breakpoint() end, opts)
        vim.keymap.set("n", "<F10>", function() dap.step_over() end, opts)
        vim.keymap.set("n", "<F11>", function() dap.step_into() end, opts)
        vim.keymap.set("n", "<S-F11>", function() dap.step_out() end, opts)

        vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end, opts)
        vim.keymap.set("n", "<leader>dB", function()
            vim.ui.input({ prompt = "Breakpoint condition: " }, function(cond)
                if cond then dap.set_breakpoint(cond) end
            end)
        end, opts)
        vim.keymap.set("n", "<leader>dc", function() dap.continue() end, opts)
        vim.keymap.set("n", "<leader>di", function() dap.step_into() end, opts)
        vim.keymap.set("n", "<leader>do", function() dap.step_over() end, opts)
        vim.keymap.set("n", "<leader>dO", function() dap.step_out() end, opts)
        vim.keymap.set("n", "<leader>dr", function() dap.repl.toggle() end, opts)
        vim.keymap.set("n", "<leader>dt", function() dap.terminate() end, opts)
        vim.keymap.set("n", "<leader>du", function() dapui.toggle() end, opts)
        vim.keymap.set("n", "<leader>dh", function() require("dap.ui.widgets").hover() end, opts)
    end,
}
