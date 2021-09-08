require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  -- Treesitter for better syntax highlighting via tree parsing
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  -- Additional textobjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  -- Use treesitter to auto close and auto rename html tag
  use 'windwp/nvim-ts-autotag'

  -- Collection of configurations for built-in LSP client
  use 'neovim/nvim-lspconfig' -- Configure the built-in LSP client
  -- Autocompletion plugin
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-buffer",
    }
  }
  use 'onsails/lspkind-nvim'  -- Custom icons on completion menu

  use 'nvim-lua/plenary.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup{}
    end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Colorscheme (with treesitter support)
  use 'bluz71/vim-nightfly-guicolors'

  -- Color highlighter
  use 'norcalli/nvim-colorizer.lua'

  -- Statusline
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
  }

  -- Tabline
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

  -- File explorer
  use {
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons'
  }

  -- Add indentation guides even on blank lines
  use 'lukas-reineke/indent-blankline.nvim'

  -- Easy navigation between tmux panes and vim
  use 'christoomey/vim-tmux-navigator'

  -- Git plugins
  use 'tpope/vim-fugitive' -- Git commands in nvim
  -- Git gutter signs
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  -- Git in-line blames
  use {
    'APZelos/blamer.nvim',  -- inline git blame
    config = function()
      vim.g['blamer_enabled'] = 1
    end
  }

  -- Commenting library
  use 'b3nj5m1n/kommentary'
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Vim-like operations for surrounding characters
  use 'tpope/vim-surround'

end)
