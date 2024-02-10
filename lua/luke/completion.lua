local cmp = require('cmp')
local ls = require('luasnip')
ls.config.set_config({
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
  ext_opts = {
   [require("luasnip.util.types").choiceNode] = {
     active = {
       virt_text = { { "*", "GruvboxOrange" } },
    },
    },
    },
})
require("luasnip.loaders.from_lua").load({paths = "C:/Users/User/AppData/Local/nvim/lua/luke/snippets"})
require'luasnip/loaders/from_vscode'.load() -- If you want to use friendly-snippets

local function has_words_before()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
  sources = {
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'nvim_lsp' }, -- if you have lsp setup
  -- add other sources here
},
    -- you can add other sources here, e.g.
    -- { name = 'buffer' },
  mapping = {
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif ls.expand_or_jumpable() then
        ls.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif ls.jumpable(-1) then
        ls.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  snippet = {
    expand = function(args)
      ls.lsp_expand(args.body)
    end,
  },
  window = {
    documentation = cmp.config.window.bordered(),
    completion = cmp.config.window.bordered({
        max_height = 40,
        max_width = 80,
        winhighlight = 'Normal:CmpPmenu,CursorLine:PmenuSel,Search:None'
    }),
}
})

vim.cmd [[
autocmd VimEnter * Copilot disable
]]

