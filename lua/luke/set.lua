vim.cmd[[colorscheme tokyonight-night]]

vim.opt.tags="./tags,tags;$HOME"

vim.g.python3_host_prog = 'C:\\Users\\User\\.pyenv\\pyenv-win\\versions\\neovim3\\Scripts\\python.exe'
vim.g.netrw_liststyle = 3

vim.opt.nu = true
vim.opt.relativenumber = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
local home = os.getenv("HOME") or os.getenv("USERPROFILE")
vim.opt.undodir = home .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.api.nvim_set_keymap('i', '<C-J>', 'copilot#Accept("\\<CR>")', {silent = true, script = true, expr = true})
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap('n', '<C-H>', ':Copilot panel<CR>', {noremap = true, silent = true})

function _G.ExplainVisualSelection()
    local chat = require("CopilotChat")
    chat.ask("Explain how it works.", {
      selection = require("CopilotChat.select").visual,
    })
end

vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>i", function() harpoon:list():prev() end)
vim.keymap.set("n", "<leader>o", function() harpoon:list():next() end)

vim.o.foldmethod = "indent"
vim.o.foldlevel = 1
vim.o.foldclose = "all"

if vim.fn.executable('ag') == 1 then
  vim.o.grepprg = "ag --vimgrep $*"
  vim.o.grepformat = "%f:%l:%c:%m"
end

vim.o.shada = "!,'999,<50,s10,h"
vim.opt.laststatus = 3 
vim.cmd([[highlight WinSeparator guibg=none]])
