-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

local leet_arg = "leetcode.nvim"
local plugins = {
       {
          'nvim-telescope/telescope.nvim', version = '0.1.5',
          -- or                            , branch = '0.1.x',
          dependencies = { {'nvim-lua/plenary.nvim'} }
      },
      {
          "metalelf0/base16-black-metal-scheme"
      },
      {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    }
      ,
       { 'iamcco/markdown-preview.nvim', build = 'cd app && npm install' },
       {
        'chentoast/marks.nvim',
        config = function()
            require('marks')
        end
    },

     --  {'neoclide/coc.nvim', branch = 'release'}
     --  {"xero/miasma.nvim"}
    --vim.cmd("colorscheme miasma")
    {
        'rebelot/kanagawa.nvim',
        name = 'kanagawa',
        config = function()
            vim.cmd('colorscheme kanagawa')
        end
    },
         --('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
         --('nvim-treesitter/playground')
          {
            'nvim-treesitter/nvim-treesitter',
            run = function()
                local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
                ts_update()
            end,
        },
         {'m4xshen/autoclose.nvim'},
         {'thePrimeagen/harpoon'},
         {'mbbill/undotree'},
         {'lambdalisue/vim-fern'},
         {'f-person/git-blame.nvim'},
         {'tpope/vim-fugitive'},
         {'emmanueltouzery/code-compass.nvim'},
         {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v3.x',
      dependencies = {
        --- Uncomment these if you want to manage the language servers from neovim
         {'williamboman/mason.nvim'},
         {'williamboman/mason-lspconfig.nvim'},
         {'numToStr/Comment.nvim'},

        -- LSP Support
        {'neovim/nvim-lspconfig'},
        {'jay-babu/mason-null-ls.nvim'},
        -- Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'L3MON4D3/LuaSnip'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'onsails/lspkind-nvim'},
        {'jose-elias-alvarez/nvim-lsp-ts-utils'},
        {'saadparwaiz1/cmp_luasnip'},
        {'rafamadriz/friendly-snippets'},
        {'NvChad/nvim-colorizer.lua'}
      }
    },
           {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "nvim-lualine/lualine.nvim",
        dependencies = {'nvim-tree/nvim-web-devicons', lazy = true},
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "christoomey/vim-tmux-navigator",
        "windwp/nvim-ts-autotag"
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    },
    {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
    dependencies = {
        -- include a picker of your choice, see picker section for more details
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
    },
    opts = {
        -- configuration goes here
        },
    },
        ({
            "nvimtools/none-ls.nvim",
            config = function()
                require("null-ls")
            end,
            dependencies = { "nvim-lua/plenary.nvim" },
        }),
        {
            "roobert/tailwindcss-colorizer-cmp.nvim",
            -- optionally, override the default options:
            config = function()
                require("tailwindcss-colorizer-cmp").setup({
                    color_square_width = 2,
                })
            end
        },
}

local spec = {
    dependencies = { "nvim-lua/plenary.nvim" } -- optional, used for testing
}


require("lazy").setup(plugins, {})
