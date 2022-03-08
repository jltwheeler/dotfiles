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

-- Easier indenting
keymap('v', '<', '<gv', opts)  -- reselect after indent left
keymap('v', '>', '>gv', opts)  -- reselect after indent right

-- Git diff split view
keymap('n', '<leader>gs', ':Gdiffsplit<CR>', { noremap = true, silent = false })

-- Toggle checker
keymap('n', '<leader>sc', 'spell!<CR>', { noremap = true, silent = true })

-- Yanking to behave like other Vim commands.
keymap('n', 'Y', 'y$', { noremap = true, silent = false })

-- Keep searches and joins centered 
keymap('n', 'n', 'nzzzv', { noremap = true, silent = true })
keymap('n', 'N', 'Nzzzv', { noremap = true, silent = true })
keymap('n', 'J', 'mzJ`z', { noremap = true, silent = true })

-- Add undo break points for special characters
keymap('i', ',', ',<c-g>u', { noremap = true, silent = true })
keymap('i', '.', '.<c-g>u', { noremap = true, silent = true })
keymap('i', '!', '!<c-g>u', { noremap = true, silent = true })
keymap('i', '?', '?<c-g>u', { noremap = true, silent = true })

-- File explorer
keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = false })
keymap('n', '<leader>r', ':NvimTreeRefresh<CR>', { noremap = true, silent = false })

-- nvim-git-link
keymap('n', '<leader>gl', [[<cmd>lua require('nvim-git-link').get_remote_link()<cr>]], { noremap = true, silent = true })

-- Add Telescope leader shortcuts
keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>]], { noremap = true, silent = true })
keymap('n', '<leader>ff', ':Telescope find_files find_command=rg,--ignore,--hidden,--files,--iglob=!.git prompt_prefix=🔍 <cr>', { noremap = true, silent = true })
keymap('n', '<leader>fg', '<cmd>lua require(\'telescope.builtin\').git_files()<cr>', { noremap = true, silent = true })
keymap('n', '<leader>fs', '<cmd>lua require(\'telescope.builtin\').git_status()<cr>', { noremap = true, silent = true })
keymap('n', '<leader>fw', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>', { noremap = true, silent = true })
keymap('n', '<leader>fb', '<cmd>lua require(\'telescope.builtin\').buffers()<cr>', { noremap = true, silent = true })
keymap('n', '<leader>fh', '<cmd>lua require(\'telescope.builtin\').help_tags()<cr>', { noremap = true, silent = true })
keymap('n', '<leader>fd', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], { noremap = true, silent = true })
keymap('n', '<leader>fo', [[<cmd>lua require('telescope.builtin').oldfiles()<cr>]], { noremap = true, silent = true })
keymap('n', '<leader>fv', [[<cmd>lua require('jw.telescope').search_config_nvim()<cr>]], { noremap = true, silent = true })

-- Gitsigns hunk navigation
keymap('n', '<leader>gk', ':Gitsigns prev_hunk<CR>', { noremap = false, silent = false })
keymap('n', '<leader>gj', ':Gitsigns next_hunk<CR>', { noremap = false, silent = false })

-- Actions
keymap('n', '<leader>hr', ':Gitsigns reset_hunk<CR>', { noremap = false, silent = false })
keymap('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>', { noremap = false, silent = false })
keymap('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>', { noremap = false, silent = false })
keymap('n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>', { noremap = false, silent = false })
keymap('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>', { noremap = false, silent = false })
keymap('n', '<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>', { noremap = false, silent = false })
keymap('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>', { noremap = false, silent = false })

-- Bufferline
keymap('n', '<leader>1', '<cmd>BufferLineGoToBuffer 1<CR>', { noremap = true, silent = false})
keymap('n', '<leader>2', '<cmd>BufferLineGoToBuffer 2<CR>', { noremap = true, silent = false})
keymap('n', '<leader>3', '<cmd>BufferLineGoToBuffer 3<CR>', { noremap = true, silent = false})
keymap('n', '<leader>4', '<cmd>BufferLineGoToBuffer 4<CR>', { noremap = true, silent = false})
keymap('n', '<leader>5', '<cmd>BufferLineGoToBuffer 5<CR>', { noremap = true, silent = false})
keymap('n', '<leader>6', '<cmd>BufferLineGoToBuffer 6<CR>', { noremap = true, silent = false})
keymap('n', '<leader>7', '<cmd>BufferLineGoToBuffer 7<CR>', { noremap = true, silent = false})
keymap('n', '<leader>8', '<cmd>BufferLineGoToBuffer 8<CR>', { noremap = true, silent = false})
keymap('n', '<leader>9', '<cmd>BufferLineGoToBuffer 9<CR>', { noremap = true, silent = false})

-- Dashboard
keymap('n', '<leader>fn', '<cmd>DashboardNewFile<CR>', { noremap = true, silent = false})
