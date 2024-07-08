-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.2',
      -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      opts = {},
  }
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {'williamboman/mason.nvim'},           -- Optional
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'saadparwaiz1/cmp_luasnip'},
    {'rafamadriz/friendly-snippets'},
  }
}
use('eandrju/cellular-automaton.nvim')
use('nvim-tree/nvim-web-devicons')
use('folke/lsp-colors.nvim')
use { "nvim-neotest/nvim-nio" }
use('ryanoasis/vim-devicons')
use('mfussenegger/nvim-dap')
use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
use('github/copilot.vim')
use {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'canary',
    requires = { 
      'github/copilot.vim', 
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require("CopilotChat").setup({
        debug = true, -- Enable debugging
        -- Include other configuration settings here
      })
    end
}
use { 'otavioschwanck/arrow.nvim', config = function()
  require('arrow').setup({
    show_icons = true,
    always_show_path = false,
    leader_key = ';' -- Recommended to be a single key
    buffer_leader_key = 'm', -- Per Buffer Mappings
    global_bookmarks = true
  })
end }
use({
  "epwalsh/obsidian.nvim",
  tag = "*",  -- recommended, use latest release instead of latest commit
  requires = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  config = function()
    require("obsidian").setup({
      workspaces = {
        {
          name = "personal",
          path = "C:\\my-obsidian-vault",
        }
      },

      -- see below for full list of options 👇
    })
  end,
})
use('tpope/vim-fugitive')

end)
