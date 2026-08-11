local function has_cmake_root()
    return vim.fs.find("CMakeLists.txt", { upward = true, path = vim.fn.expand("%:p:h") })[1] ~= nil
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp", "cmake" },
    callback = function()
        if not has_cmake_root() then return end
        vim.opt_local.makeprg = "cmake --build build -j"
    end,
})

vim.api.nvim_create_user_command("CMakeConfigure", function()
    vim.cmd([[!cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-O2 -g" -DCMAKE_EXPORT_COMPILE_COMMANDS=ON]])
end, { desc = "Configure the CMake build dir (Release, -O2 -g, compile_commands.json)" })

vim.keymap.set("n", "<leader>cc", "<cmd>CMakeConfigure<CR>", { desc = "Configure CMake build dir" })
