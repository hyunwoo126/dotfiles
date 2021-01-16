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
set splitright
set tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd BufRead,BufNewFile *.vue setlocal shiftwidth=2 tabstop=2

set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set nowritebackup
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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'git@github.com:Valloric/YouCompleteMe.git'
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
Plug 'preservim/nerdtree'
 
call plug#end()

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'
colorscheme gruvbox
set background=dark
" colorscheme github
" let g:airline_theme = 'github'
" set background=light

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

" -------- airline ---------
let g:airline#extensions#virtualenv#enabled = 0
let g:airline#extensions#default#section_truncate_width = { 'x': 60, 'y': 88, 'z': 88, 'warning': 88, 'error': 88 }

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
map <C-n> :NERDTreeToggle<CR>

" stay in visual mode when indenting
vnoremap < <gv
vnoremap > >gv

nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gf :YcmCompleter FixIt<CR>

command! Reload :so $MYVIMRC
command! Light :colorscheme github | :set background=light
command! Dark :colorscheme gruvbox | :set background=dark

command! B :b#
command! Fork :! fork .

" nmap <Leader>ha <Plug>GitGutterStageHunk
" nmap <Leader>hu <Plug>GitGutterRevertHunk


:autocmd InsertEnter,InsertLeave * set cul!


" ----- FZF --------
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

" let g:fzf_colors = {
    " \ 'fg':      ['fg', 'GruvboxGray'],
    " \ 'bg':      ['bg', 'Normal'],
    " \ 'hl':      ['fg', 'GruvboxRed'],
    " \ 'fg+':     ['fg', 'GruvboxGreen'],
    " \ 'bg+':     ['bg', 'GruvboxBg1'],
    " \ 'hl+':     ['fg', 'GruvboxRed'],
    " \ 'info':    ['fg', 'GruvboxOrange'],
    " \ 'prompt':  ['fg', 'GruvboxBlue'],
    " \ 'header':  ['fg', 'GruvboxBlue'],
    " \ 'pointer': ['fg', 'Error'],
    " \ 'marker':  ['fg', 'Error'],
    " \ 'spinner': ['fg', 'Statement'],
    " \}

noremap <C-p> :Files<CR>
noremap <C-F> :Ag<CR>
"----- FZF END -----
"
" ---- Coc -------
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

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
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

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

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
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
" ----- Coc END --------
