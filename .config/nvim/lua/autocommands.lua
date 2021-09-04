local utils = require('.utils')

utils.define_augroups({
    _general_settings = {
        -- Disable continuation of comments on next line
        {'BufWinEnter', '*', 'lua vim.opt.formatoptions:remove({\'c\', \'o\'})'},
        {'BufRead', '*', 'lua vim.opt.formatoptions:remove({\'c\', \'o\'})'},
        {'BufNewFile', '*', 'lua vim.opt.formatoptions:remove({\'c\', \'o\'})'},
    },
    --_markdown = {{'FileType', 'markdown', 'setlocal wrap'}, {'FileType', 'markdown', 'setlocal spell'}},
    --_buffer_bindings = {
    --    {'FileType', 'dashboard', 'nnoremap <silent> <buffer> q :q<CR>'},
    --    {'FileType', 'lspinfo', 'nnoremap <silent> <buffer> q :q<CR>'},
    --    {'FileType', 'floaterm', 'nnoremap <silent> <buffer> q :q<CR>'},
    --},
    --_auto_formatters = auto_formatters
})

-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)

-- Change tabs to be 4 spaces for python files only
vim.api.nvim_exec(
  [[
    autocmd FileType python setl shiftwidth=4 sts=4 ts=2 et
  ]],
  false
)

-- Auto-resize splits when Vim gets resized.
vim.api.nvim_exec(
  [[
    autocmd VimResized * wincmd =
  ]],
  false
)

-- Update a buffer's contents on focus if it changed outside of Vim.
vim.api.nvim_exec(
  [[
    au FocusGained,BufEnter * :checktime
  ]],
  false
)
