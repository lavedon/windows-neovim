vim.cmd[[colorscheme tokyonight-night]]
vim.opt.tags="./tags,tags;$HOME"

vim.g.python3_host_prog = 'C:\\Users\\Owner\\.pyenv\\pyenv-win\\versions\\neovim3\\Scripts\\python.exe'

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

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

vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

if vim.fn.executable('ag') == 1 then
  vim.o.grepprg = "ag --vimgrep $*"
  vim.o.grepformat = "%f:%l:%c:%m"
end
