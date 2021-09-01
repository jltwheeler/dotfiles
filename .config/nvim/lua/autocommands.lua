local utils = require('.utils')

utils.define_augroups({
    _general_settings = {
        -- Disable continuation of comments on next line
        {'BufWinEnter', '*', 'lua vim.opt.formatoptions:remove({\'c\', \'o\'})'},
        {'BufRead', '*', 'lua vim.opt.formatoptions:remove({\'c\', \'o\'})'},
        {'BufNewFile', '*', 'lua vim.opt.formatoptions:remove({\'c\', \'o\'})'},
        {'BufWritePost', 'plugins/init.lua source <afile> | PackerCompile'},
    },
    --_markdown = {{'FileType', 'markdown', 'setlocal wrap'}, {'FileType', 'markdown', 'setlocal spell'}},
    --_buffer_bindings = {
    --    {'FileType', 'dashboard', 'nnoremap <silent> <buffer> q :q<CR>'},
    --    {'FileType', 'lspinfo', 'nnoremap <silent> <buffer> q :q<CR>'},
    --    {'FileType', 'floaterm', 'nnoremap <silent> <buffer> q :q<CR>'},
    --},
    --_auto_formatters = auto_formatters
})
