local g = vim.g
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

-- bootstrap packer
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

-- disable some builtin vim plugins
local disabled_built_ins = {
   ---2html_plugin---,
   ---getscript---,
   ---getscriptPlugin---,
   ---gzip---,
   ---logipat---,
   ---netrw---,
   ---netrwPlugin---,
   ---netrwSettings---,
   ---netrwFileHandlers---,
   ---matchit---,
   ---tar---,
   ---tarPlugin---,
   ---rrhelper---,
   ---spellfile_plugin---,
   ---vimball---,
   ---vimballPlugin---,
   ---zip---,
   ---zipPlugin---,
}

for _, plugin in pairs(disabled_built_ins) do
   g["loaded_" .. plugin] = 1
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  -- Treesitter for better syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
         require "plugins.config.treesitter"
    end,
  }

  -- Colorscheme (with treesitter support)
  use 'bluz71/vim-nightfly-guicolors'

  -- Color highlighter
  use 'norcalli/nvim-colorizer.lua'

  -- Statusline
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()
         require "plugins.config.lualine"
    end,
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
