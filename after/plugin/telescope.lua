local telescope = require('telescope')
local builtin = require('telescope.builtin')

vim.api.nvim_create_autocmd("FileType", {
	pattern = "TelescopeResults",
	callback = function(ctx)
		vim.api.nvim_buf_call(ctx.buf, function()
			vim.fn.matchadd("TelescopeParent", "\t\t.*$")
			vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
		end)
	end,
})

local function filenameFirst(_, path)
	local tail = vim.fs.basename(path)
	local parent = vim.fs.dirname(path)
	if parent == "." then return tail end
	return string.format("%s\t\t%s", tail, parent)
end

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = require('telescope.actions').close,
      },
    },
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      prompt_position = "top",
      preview_cutoff = 200,
      horizontal = {
        mirror = false,
        preview_width = 0.6,
      },
      vertical = {
        mirror = false,
      },
    },
    file_ignore_patterns = {"node_modules", ".git/"},
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      path_display = filenameFirst
    },
    git_files = {
      theme = "dropdown",
      path_display = filenameFirst
    },
    grep_string = {
      theme = "dropdown",
      path_display = filenameFirst
    },
  },
}

-- Keybindings
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
