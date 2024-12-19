-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  --use 'neovim/nvim-lspconfig'
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use{
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  }
  use { 'iamcco/markdown-preview.nvim', run = 'cd app && npm install' }

 -- use {'neoclide/coc.nvim', branch = 'release'}
 -- use {"xero/miasma.nvim"}
--vim.cmd("colorscheme miasma")
  use({
	  'rose-pine/nvim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end})
     --use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	 --use('nvim-treesitter/playground')
     use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
     use('m4xshen/autoclose.nvim')
     use('github/copilot.vim')
	 use('thePrimeagen/harpoon')
	 use('mbbill/undotree')
 	 use('tpope/vim-fugitive')
	 use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  requires = {
    --- Uncomment these if you want to manage the language servers from neovim
     {'williamboman/mason.nvim'},
     {'williamboman/mason-lspconfig.nvim'},
     {'numToStr/Comment.nvim'},
     {'boganworld/crackboard.nvim'},

    -- LSP Support
    {'neovim/nvim-lspconfig'},
    {'jay-babu/mason-null-ls.nvim'},
    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'L3MON4D3/LuaSnip'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7dh/cmp-cmdline'},
    {'onsails/lspkind-nvim'},
    {'jose-elias-alvarez/nvim-lsp-ts-utils'},
    {'saadparwaiz1/cmp_luasnip'},
    {'rafamadriz/friendly-snippets'},
    {'NvChad/nvim-colorizer.lua'}
  }
}
	  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "nvim-lualine/lualine.nvim",
    requires = {'nvim-tree/nvim-web-devicons', opt = ture},
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "christoomey/vim-tmux-navigator",
    "windwp/nvim-ts-autotag"
}
    use({
        "nvimtools/none-ls.nvim",
        config = function()
            require("null-ls").setup()
        end,
        requires = { "nvim-lua/plenary.nvim" },
    })
    use({
  "roobert/tailwindcss-colorizer-cmp.nvim",
  -- optionally, override the default options:
  config = function()
    require("tailwindcss-colorizer-cmp").setup({
      color_square_width = 2,
    })
  end
})
    require("mason-null-ls").setup({
    automatic_installation = true,
    ensure_installed = { "black", "flake8" },
})

 end)

