local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

-- set leader key to spacebar
keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = ' '

-- Split window
keymap('n', 'ss', ':split<Return><C-w>w', { noremap = false, silent = false })
keymap('n', 'sv', ':vsplit<Return><C-w>w', { noremap = false, silent = false })

-- Switch tab
keymap('n', '<S-Tab>', ':tabprev<Return>', { noremap = false, silent = false })
keymap('n', '<Tab>', ':tabnext<Return>', { noremap = false, silent = false })

-- Remap comment toggle in tpope/vim-commentary to 'ctrl + /'
keymap('n', '<C-_>', 'gcc', { noremap = false, silent = false })
keymap('v', '<C-_>', 'gcc', { noremap = false, silent = false })

-- Buffer switching
keymap('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = false })
keymap('n', '<S-Tab>', ':bprevious<CR>', { noremap = true, silent = false })

-- Git diff split view
-- nnoremap <leader>gs :Gdiffsplit<CR>

-- Toggle checker
keymap('n', '<leader>sc', 'spell!<CR>', { noremap = true, silent = true })

-- Yanking to behave like other Vim commands.
keymap('n', 'Y', 'y$', { noremap = true, silent = false })

-- Keep searches and joins centered 
keymap('n', 'n', 'nzzzv', { noremap = true, silent = false })
keymap('n', 'N', 'Nzzzv', { noremap = true, silent = false })
keymap('n', 'J', 'mzJ`z', { noremap = true, silent = false })

-- Add undo break points for special characters
keymap('i', ',', ',<c-g>u', { noremap = true, silent = false })
keymap('i', '.', '.<c-g>u', { noremap = true, silent = false })
keymap('i', '!', '!<c-g>u', { noremap = true, silent = false })
keymap('i', '?', '?<c-g>u', { noremap = true, silent = false })

