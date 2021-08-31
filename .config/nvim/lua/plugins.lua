-- bootstrap packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
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
end)
