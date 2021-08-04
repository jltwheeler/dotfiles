"                        _                              __ _
"  _ __   ___  _____   _(_)_ __ ___     ___ ___  _ __  / _(_) __ _
" | '_ \ / _ \/ _ \ \ / / | '_ ` _ \   / __/ _ \| '_ \| |_| |/ _` |
" | | | |  __/ (_) \ V /| | | | | | | | (_| (_) | | | |  _| | (_| |
" |_| |_|\___|\___/ \_/ |_|_| |_| |_|  \___\___/|_| |_|_| |_|\__, |
"                                                            |___/
"
" Author: @jltwheeler
" Requires vim-plug to be installed. Head to https://github.com/junegunn/vim-plug#installation
" for further instructions/

" -----------------------------------------------------------------------------
"                                Basic Settings
" -----------------------------------------------------------------------------

" set leader key to spacebar
let mapleader=" "

" For spell checking
set spelllang=en

" Indentation and tabbing
set tabstop=2
set shiftwidth=2
set smartindent
set smarttab
set expandtab
set cindent

" Turn off word wrapping
set nowrap

" Let language syntax take care of folding blocks
set foldmethod=syntax
set foldlevelstart=20 " opens folds by default on buffer load

" Start vertical scroll when 8 characters away
set scrolloff=8

" Natural window splitting feeling
set splitbelow
set splitright

" Searching
set incsearch
set nohlsearch

" Turn off case sensitive searching
set ignorecase
set smartcase

" Show all whitepsaces as characters
set list
set listchars=space:·,tab:>-,trail:~,extends:>,precedes:<

" Revlative numbers
set number relativenumber

" Ruler at 80 characters
set colorcolumn=80
set signcolumn=yes
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Get rid of swap files and backups - generally never use these features.
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

set hidden
set noerrorbells

" Give more space for displaying messages
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" -----------------------------------------------------------------------------
"                                   Plugins
" -----------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

" Color theme heavily inspired by Sarah Drasner's Night Owl VSC Theme
Plug 'bluz71/vim-nightfly-guicolors'

" Language server
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Emmet for html / jsx completion
Plug 'mattn/emmet-vim'

" Syntax highlight
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'rust-lang/rust.vim'  " Rust support
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'hashivim/vim-terraform'
Plug 'styled-components/vim-styled-components'
Plug 'vim-ruby/vim-ruby'

" Node templating
Plug 'mustache/vim-mustache-handlebars'

" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" NB: ensure both ripgrep and fzf are installed on the machine first.
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" File directory tree
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'

" Easy navigation between tmux panes and vim
Plug 'christoomey/vim-tmux-navigator'

" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git stuff
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'APZelos/blamer.nvim'

" Test coverage gutters
Plug 'ruanyl/coverage.vim'

" Utility
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" File management utility commands e.g. moving, renaming etc.
Plug 'tpope/vim-eunuch'

call plug#end()

" -----------------------------------------------------------------------------
"                                 Color Theme
" -----------------------------------------------------------------------------

if (has("termguicolors"))
 set termguicolors
endif
colorscheme nightfly

" -----------------------------------------------------------------------------
"                                Vim Airline
" -----------------------------------------------------------------------------

" enable tabline
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ''
" let g:airline#extensions#tabline#left_alt_sep = ''
" let g:airline#extensions#tabline#right_sep = ''
" let g:airline#extensions#tabline#right_alt_sep = ''

" enable powerline fonts
" let g:airline_powerline_fonts = 1
" let g:airline_left_sep = ''
" let g:airline_right_sep = ''

" Always show tabs
" set showtabline=2

" We don't need to see things like -- INSERT -- anymore
" set noshowmode


" -----------------------------------------------------------------------------
"                                  Remappings
" -----------------------------------------------------------------------------

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

" Switch tab
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>

" Remap comment toggle in tpope/vim-commentary to 'ctrl + /'
nmap <C-_> gcc
vmap <C-_> gcc

" Buffer switching
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>

" Toggle checker
nnoremap <silent> <leader>sc :set spell!<CR>

" Yanking to behave like other Vim commands.
nnoremap Y y$

" Keep searches and joins centered 
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Add undo break points for special characters
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" -----------------------------------------------------------------------------
"                                Auto Commands
" -----------------------------------------------------------------------------

" Change tabs to be 4 spaces for python files only
autocmd FileType python setl shiftwidth=4 sts=4 ts=2 et

" Auto-resize splits when Vim gets resized.
autocmd VimResized * wincmd =

" Update a buffer's contents on focus if it changed outside of Vim.
au FocusGained,BufEnter * :checktime

" forces nvim to rescan the entire buffer when highlighting
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" -----------------------------------------------------------------------------
"                               FZF Settings
" -----------------------------------------------------------------------------

let g:fzf_preview_window = ['right:50%', 'ctrl-/']
nnoremap <C-p> :Files<CR>
nnoremap <C-g> :GFiles<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>gg :GFiles?<CR>
nnoremap <silent> <leader>f :Rg<CR>
nnoremap <s-h> :History<CR>

" To tell fzf to search for hidden dot files, ensure the command below is
" added to your bashrc or zshrc. This assumes fzf is using the default find.
" export FZF_DEFAULT_COMMAND='find .* -type f'

" Allow ripgrep to also search through hidden dot files.
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --hidden --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)


" -----------------------------------------------------------------------------
"                                  Blamer
" -----------------------------------------------------------------------------

let g:blamer_enabled = 1
let g:blamer_delay = 750

" -----------------------------------------------------------------------------
"                                Fern Settings
" -----------------------------------------------------------------------------

" Disable netrw.
let g:loaded_netrw  = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

" Fern buffer settings
let g:fern#drawer_width = 30
let g:fern#default_hidden = 1
let g:fern#disable_drawer_auto_quit = 1

noremap <C-n> :Fern . -reveal=% -drawer -toggle <CR>

function! s:init_fern() abort
  nmap <buffer> s <Plug>(fern-action-open:split)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer> r <Plug>(fern-action-rename)
  nmap <buffer> m <Plug>(fern-action-move)
  nmap <buffer> c <Plug>(fern-action-copy)
  nmap <buffer> t <Plug>(fern-action-new-path)
  nmap <buffer> n <Plug>(fern-action-new-file)
  nmap <buffer> d <Plug>(fern-action-new-dir)
  nmap <buffer> s <Plug>(fern-action-hidden-toggle)
  nmap <buffer> dd <Plug>(fern-action-trash)
  nmap <buffer> <leader> <Plug>(fern-action-mark)
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

let g:fern#renderer = "nerdfont"


" -----------------------------------------------------------------------------
"                               Signify
" -----------------------------------------------------------------------------

let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

" Turn off numbers, bit distracting
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1

" Jump though hunks
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nmap <leader>gJ 9999<leader>gJ
nmap <leader>gK 9999<leader>gk

" -----------------------------------------------------------------------------
"                               Coverage.vim
" -----------------------------------------------------------------------------

let g:coverage_json_report_path = 'coverage/coverage-final.json'
let g:coverage_sign_covered = '⦿'
let g:coverage_interval = 750
let g:coverage_show_covered = 0
let g:coverage_show_uncovered = 1

" -----------------------------------------------------------------------------
"                               Syntax 
" -----------------------------------------------------------------------------

let g:rustfmt_autosave = 1  " automatic running of rustfmt on save
let g:terraform_align=1  " automatic tf align
let g:terraform_fmt_on_save=1  " automatic tf formatting.

" -----------------------------------------------------------------------------
"                               Coc
" -----------------------------------------------------------------------------

" CoC Config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-rust-analyzer',
  \ 'coc-pyright',
  \ ]

" Close suggestion windows when they get stuck using double escape
nnoremap <silent> <ESC><ESC> :nohlsearch \| match none \| 2match none \| call coc#float#close_all()<CR>

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr><TAB> pumvisible() ? "\<C-y>" : "\<C-g>u\<TAB>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-a> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-a>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-a> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-a> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-a>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
