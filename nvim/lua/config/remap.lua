vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>mk", "<cmd>make<CR>")

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

vim.keymap.set('n', '<leader>yiw', 'viw"*y')

vim.keymap.set('n', '<leader>fix', '<C-w>t<c-w>H')

vim.keymap.set("n", "<leader>tcwd", function()
    vim.cmd("lcd %:p:h")
    vim.cmd("terminal")
    vim.cmd("startinsert")
end, { desc = "Open terminal in current file directory" })

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', {silent = true})

vim.keymap.set('n', '<Leader>nn', function()
    vim.ui.input({ prompt = "Note title: " }, function(title)
        if title and title ~= "" then
            local vault_path = vim.fn.expand("~/notes/vault")
            local note_path = vault_path .. "/" .. title .. ".md"

            vim.cmd("edit " .. vim.fn.fnameescape(note_path))

            vim.defer_fn(function()
                vim.cmd("ObsidianTemplate")
            end, 100)
        end
    end)
end)

vim.keymap.set('n', '<Leader>st', function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 15)
end)

vim.keymap.set('n', '<Leader>st', function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 15)
end)

vim.keymap.set('n', '<Leader>td', function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("L")
end)
