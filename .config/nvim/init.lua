-- core neovim config
require("core.options")
require("core.mappings")
require("core.autocmds")
require("core.plugins")
require("core.colorscheme")

-- Speed up loading Lua modules in Neovim to improve startup time.
-- impatient needs to be setup before any other lua plugin is loaded
local status_ok, gitsigns = pcall(require, "impatient")
if not status_ok then
  return
end

-- plugin configs
require("configs.autopairs")
require("configs.bufferline")
require("configs.cmp")
require("configs.gitsigns")
require("configs.lsp")
require("configs.lualine")
require("configs.telescope")
require("configs.treesitter")
require("configs.nvim-tree")
