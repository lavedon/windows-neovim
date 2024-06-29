vim.g.mapleader = ","
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
--
-- Dealing eith error messages
vim.keymap.set("n", "<leader>i", ":lua vim.diagnostic.open_float()<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>ij", ":lua vim.diagnostic.goto_prev()<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>n", ":lua vim.diagnostic.goto_next()<CR>", {noremap = true, silent = true})


-- Misc Navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)


--  My CopyBufferPlugin
vim.keymap.set('n', '<leader>cb', ':CopyBufferToClipboard<CR>', {noremap = true, silent = true})

-- Dap 
vim.api.nvim_set_keymap('n', '<Leader>c', "<Cmd>lua require'dap'.continue()<CR>", {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>o', "<Cmd>lua require'dap'.step_over()<CR>", {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>si', "<Cmd>lua require'dap'.step_into()<CR>", {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>so', "<Cmd>lua require'dap'.step_out()<CR>", {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>b', "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>B', "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>lp', "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>dr', "<Cmd>lua require'dap'.repl.open()<CR>", {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>dl', "<Cmd>lua require'dap'.run_last()<CR>", {silent = true})

-- Chat
vim.api.nvim_set_keymap('n', '<Leader>ae', "<cmd>CopilotChatExplain<cr>", {silent = true})
vim.api.nvim_set_keymap('v', '<Leader>ae', "<cmd>lua ExplainVisualSelection()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>ai', "<cmd>CopilotChatToggle<cr>", {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>aic', "<cmd>CopilotChatToggle<cr>", {silent = true})

-- Diagnostics 
vim.api.nvim_set_keymap('n', '<Leader>xd', "<cmd>lua vim.diagnostic.setloclist(); vim.cmd('lopen')<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>xf', "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('[d', "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(']d', "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })

