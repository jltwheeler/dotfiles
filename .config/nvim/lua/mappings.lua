local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

-- set leader key to spacebar
keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = ' '

-- Split window
keymap('n', 'ss', ':split<Return><C-w>w', { noremap = false, silent = false })
keymap('n', 'sv', ':vsplit<Return><C-w>w', { noremap = false, silent = false })

-- Buffer switching
keymap('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = false })
keymap('n', '<S-Tab>', ':bprevious<CR>', { noremap = true, silent = false })

-- Git diff split view
keymap('n', '<leader>gs', ':Gdiffsplit<CR>', { noremap = true, silent = false })

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

-- File explorer
keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = false })
keymap('n', '<leader>r', ':NvimTreeRefresh<CR>', { noremap = true, silent = false })

-- Add Telescope leader shortcuts
keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })
keymap('n', '<leader>ff', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>', { noremap = true, silent = false })
keymap('n', '<leader>fg', '<cmd>lua require(\'telescope.builtin\').git_files()<cr>', { noremap = true, silent = false })
keymap('n', '<leader>fs', '<cmd>lua require(\'telescope.builtin\').git_status()<cr>', { noremap = true, silent = false })
keymap('n', '<leader>fw', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>', { noremap = true, silent = false })
keymap('n', '<leader>fb', '<cmd>lua require(\'telescope.builtin\').buffers()<cr>', { noremap = true, silent = false })
keymap('n', '<leader>fh', '<cmd>lua require(\'telescope.builtin\').help_tags()<cr>', { noremap = true, silent = false })
keymap('n', '<leader>fd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true })
keymap('n', '<leader>fv', [[<cmd>lua require('jw.telescope').search_config_nvim()<CR>]], { noremap = true, silent = true })

-- Gitsigns hunk navigation
keymap('n', '<leader>gj', ':Gitsigns prev_hunk<CR>', { noremap = false, silent = false })
keymap('n', '<leader>gk', ':Gitsigns next_hunk<CR>', { noremap = false, silent = false })
