local opt = vim.opt
local wo = vim.wo
local bo = vim.bo
local g = vim.g

-- For spell checking
opt.spelllang = "en"

-- Indentation and tabbing
opt.tabstop = 2
opt.shiftwidth = 2
opt.smartindent = true
opt.smarttab = true
opt.expandtab = true
opt.cindent = true

-- Turn off word wrapping
wo.wrap = false

-- Disable continuation of comments on next line
bo.formatoptions = bo.formatoptions:gsub('cro', '')

-- Let language syntax take care of folding blocks
wo.foldmethod = "syntax"
opt.foldlevelstart = 20 -- opens folds by default on buffer load

-- Start vertical scroll when 8 characters away
wo.scrolloff = 8

-- Natural window splitting feeling
opt.splitbelow = true
opt.splitright = true

-- Searching
opt.incsearch = true
opt.hlsearch = false

-- Turn off case sensitive searching
opt.ignorecase = true
opt.smartcase = true

-- Relative numbers
wo.relativenumber = true
wo.number = true

-- Ruler at 80 characters
opt.colorcolumn = "80"
opt.signcolumn = "yes"
vim.highlight.create('ColorColumn', {ctermbg=0, guibg=lightgrey}, false)

-- Get rid of swap files and backups - generally never use these features.
opt.swapfile = false
opt.backup = false
opt.undodir = "~/.vim/undodir"
opt.undofile = true

opt.hidden = true
opt.errorbells = false

-- Give more space for displaying messages
opt.cmdheight = 2

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
opt.updatetime = 100

-- Don't pass messages to |ins-completion-menu|.
vim.o.shortmess = vim.o.shortmess .. "c"

