" make vim external command :! work with .bashrc
set shellcmdflag=-ic

syntax on
filetype plugin indent on

set guicursor=
set noshowmatch
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set expandtab
set smartindent
set tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd BufRead,BufNewFile *.vue setlocal shiftwidth=2 tabstop=2

set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set ignorecase
set smartcase

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey


call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-utils/vim-man'
Plug 'git@github.com:Valloric/YouCompleteMe.git'
" Plug 'jremmen/vim-ripgrep'
Plug 'mbbill/undotree'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdcommenter'
" Plug 'leafoftree/vim-vue-plugin'
Plug 'posva/vim-vue'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', {'do': { -> fzf#install()  }}
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

" Plug 'sheerun/vim-polyglot'
" Plug 'vim-python/python-syntax'
Plug 'ap/vim-css-color'
Plug 'vim-syntastic/syntastic'
" Plug 'dense-analysis/ale'
Plug 'nightsense/simplifysimplify'
Plug 'cormacrelf/vim-colors-github'
Plug 'tpope/vim-surround'
 
call plug#end()

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'
" colorscheme gruvbox
colorscheme github
let g:airline_theme = 'github'
set background=light

if executable('rg')
    let g:rg_derive_root='true'
endif

let mapleader = " "

let g:netrw_browse_split = 2
let g:netrw_winsize = 25
let g:netrw_banner = 0

let g:ctrlp_use_caching = 0
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

"Ripgrep
let g:rg_command = 'rg --vimgrep -S'

"NERDCommentter
let g:NERDSpaceDelims = 1
" vim 8 / neovim HEAD runtime: when ft==python, cms:=#\ %s
"   -- when g:NERDSpaceDelims==1, then NERDComment results in double space
let g:NERDCustomDelimiters = {'python': { 'left': '#', 'right': '' }}
let g:NERDCreateDefaultMappings = 0
nnoremap <leader>/ :call NERDComment(0,"toggle")<CR>
vnoremap <leader>/ :call NERDComment(0,"toggle")<CR>

" vim-vue-plugin
let g:vim_vue_plugin_use_sass = 1
let g:vim_vue_plugin_highlight_vue_attr = 1

let g:vue_pre_processors = ['scss']

let g:indentLine_setColors = 0

let g:python_highlight_all = 1
 " let g:python_highlight_indent_errors = 0
" let g:python_highlight_space_errors = 0
" let g:python_highlight_builtins = 1
" let g:python_highlight_exceptions = 1
" let g:python_highlight_string_formatting = 1
" let g:python_highlight_string_format = 1
" let g:python_highlight_string_templates = 1
" let g:python_highlight_space_errors = 1
" let g:python_highlight_doctests = 1
" let g:python_highlight_func_calls = 1
" let g:python_highlight_class_vars = 1

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

noremap <C-s> :w<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>p :Lex<CR>

nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>= <C-w>=

" stay in visual mode when indenting
vnoremap < <gv
vnoremap > >gv

nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gf :YcmCompleter FixIt<CR>

command! Reload :so $MYVIMRC
command! Light :colorscheme github | :set background=light
command! Dark :colorscheme gruvbox | :set background=dark

" nmap <Leader>ha <Plug>GitGutterStageHunk
" nmap <Leader>hu <Plug>GitGutterRevertHunk


:autocmd InsertEnter,InsertLeave * set cul!


" ----- FZF --------
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

let g:fzf_colors = {
    \ 'fg':      ['fg', 'GruvboxGray'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'GruvboxRed'],
    \ 'fg+':     ['fg', 'GruvboxGreen'],
    \ 'bg+':     ['bg', 'GruvboxBg1'],
    \ 'hl+':     ['fg', 'GruvboxRed'],
    \ 'info':    ['fg', 'GruvboxOrange'],
    \ 'prompt':  ['fg', 'GruvboxBlue'],
    \ 'header':  ['fg', 'GruvboxBlue'],
    \ 'pointer': ['fg', 'Error'],
    \ 'marker':  ['fg', 'Error'],
    \ 'spinner': ['fg', 'Statement'],
    \}

noremap <C-p> :Files<CR>
noremap <C-F> :Ag<CR>
"----- FZF END -----
