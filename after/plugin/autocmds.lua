vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "help",
    "startuptime",
    "qf",
    "lspinfo",
    "vim",
    "OverseerList",
    "OverseerForm",
    "fugitive",
    "toggleterm",
    "floggraph",
    "git",
    "cheat",
  },
  command = [[nnoremap <buffer><silent> q :bdelete!<CR>]],
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "cheat",
  command = "nnoremap <buffer> q :q<CR>",
})

