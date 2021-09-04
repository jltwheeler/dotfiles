require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  -- Treesitter for better syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
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

  -- Git plugins
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
