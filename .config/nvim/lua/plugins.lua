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

  -- Collection of configurations for built-in LSP client
  use 'neovim/nvim-lspconfig' -- Configure the built-in LSP client
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'

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

  -- Utility plugins
  use 'b3nj5m1n/kommentary'
  use 'tpope/vim-surround'

end)
