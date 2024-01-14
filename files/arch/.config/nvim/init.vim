" f8 / F8 - switch themes
" colorscheme evening

let g:main_color_scheme = "evening"
let g:terminal_color_scheme = "slate"

"-------------------------------------------------------------------
set encoding=UTF-8

set noerrorbells
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set smartcase
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=2               " number of columns occupied by a tab 
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set nu rnu                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set noswapfile              " disable creating swap file
set splitright
set splitbelow
set nowrap
set updatetime=100

" set spell spelllang=en_us
"-------------------------------------------------------------------
" fold start imports
"set foldmethod=expr
"set foldmethod=syntax
"set foldexpr=v:lnum==1?'>1':getline(v:lnum)=~'import'?1:nvim_treesitter#foldexpr()
"-------------------------------------------------------------------

" copies filepath to clipboard by pressing yf
:nnoremap <silent> yf :let @+=expand('%:p')<CR>
" copies pwd to clipboard: command yd
:nnoremap <silent> yd :let @+=expand('%:p:h')<CR>

nnoremap q :wq<cr>
nnoremap Q :<C-u>tabclose<CR>
nnoremap gt :<C-u>tabedit<CR>

" comment/uncomment
map ;c <Leader>c<Space>j

" copy till the end of the line
nnoremap Y y$

" save
nnoremap <space><space> <Esc>:<C-u>w<CR>

" makes undo more friendly - puts anchors
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ? ?<c-g>u
inoremap ! !<c-g>u

" tabs
nnoremap , :tabprevious<CR>
nnoremap . :tabnext<CR>
nnoremap <C-W>t :tabedit<CR>

" resize split
nnoremap _ :<C-u>resize +5<CR>
nnoremap + :<C-u>resize -5<CR>
nnoremap - :<C-u>vertical resize +5<CR>
nnoremap = :<C-u>vertical resize -5<CR>

" split windows
nnoremap ;v :vsp<CR>
nnoremap ;b :sp<CR>

" split navigation
nnoremap gh <C-W><C-H>
nnoremap gj <C-W><C-J>
nnoremap gk <C-W><C-K>
nnoremap gl <C-W><C-L>

" jumps navigation
nnoremap gi <C-I>
nnoremap go <C-O>

" scroll
nnoremap ;u <C-u>zz
nnoremap ;d <C-d>zz

inoremap <M-f> <ESC>
vnoremap <M-f> <ESC>

" Nerd tree
nnoremap <silent> ;n :<C-u>NERDTreeToggle<CR>
nnoremap <silent> ;t :<C-u>NERDTreeFocus<CR>
nnoremap <silent> 't :<C-u>NERDTreeFind<CR>

" remap fast bookmarks
noremap ma mA
noremap <space>a `Azz<C-e>
noremap ms mS
noremap <space>s `Szz<C-e>
noremap md mD
noremap <space>d `Dzz<C-e>
noremap mf :delmarks A<CR>:delmarks S<CR>:delmarks D<CR>

" fast react component search
noremap <space>y G0?}<CR>%<CR>:<C-u>?(<CR>0f(<CR>ztkj
noremap <space>u G0/export<CR>?)<CR>%0f(<CR>ztkj
noremap <space>i fs G0?\Cinterface<CR>j0wztkj

" Search among files
" fzf --preview 'bat {-1} --color=always'
nnoremap <silent> ;f :<C-u>GFiles<CR>
nnoremap <silent> 'f :<C-u>Files<CR>
vnoremap <silent> ;f "py:execute ":FZF -q " . getreg("p")<CR>

" CoC Jumps between errors
nmap <silent> <space>j <Plug>(coc-diagnostic-next-error)
nmap <silent> <space>k <Plug>(coc-diagnostic-prev-error)

" Search inside files
nnoremap <silent> ;s :<C-u>Rg<CR>
vnoremap <silent> ;s "py:execute ":Rg " . getreg("p")<CR>
" Search among files - full screen
let g:fzf_layout = { 'down': '100%' }

function! s:GoToDefinition()
  if CocAction('jumpDefinition')
    return v:true
  endif
endfunction
nnoremap <silent> ;a :<C-u>vsp<CR>:call <SID>GoToDefinition()<CR>
nnoremap <silent> gd :call <SID>GoToDefinition()<CR>zz14<C-e>
nnoremap <silent> gb :<C-u>sp<CR>:call <SID>GoToDefinition()<CR>ztkj<C-e>


" Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

"-------------------------------------------------------------------
let NERDTreeWinSize = 56
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber

"setup vim-plug {{{
  "Note: install vim-plug if not present
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
  endif

  "Note: Skip initialization for vim-tiny or vim-small.
  if !1 | finish | endif
  if has('vim_starting')
    set nocompatible               " Be iMproved
    " Required:
    call plug#begin()
  endif
"}}}

" :PlugInstall
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'ayu-theme/ayu-vim'

Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
" search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" npm install -g typescript typescript-language-server eslint prettier
" :LspInstall tsserver
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
" themes - f8/F8, random - ctrl+f8
Plug 'xolox/vim-colorscheme-switcher'
Plug 'xolox/vim-misc'
Plug 'Taverius/vim-colorscheme-manager'
call plug#end()

"-------------------------------------------------------------------
" Snippets
" on <Tab>
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'

" Edit snippets - :CocCommand snippets.editSnippets
" if this command executed from the .js file - it will create a new file with
" snippets
"-------------------------------------------------------------------

"colorscheme gruvbox
"set background=dark

"syntax on
"set t_Co=256
"set cursorline
"colorscheme onehalflight
"let g:airline_theme='onehalfdark'

"set termguicolors     " enable true colors support
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
"colorscheme ayu

"-------------------------------------------------------------------
autocmd FileType scss setl iskeyword+=@-@

" Emmet
imap <S-tab> <plug>(emmet-expand-abbr)
 "let g:user_emmet_leader_key='hh'
"let g:user_emmet_install_global = 0
"autocmd FileType tsx EmmetInstall

" :CocConfig
" https://gitee.com/yyancyer/coc.nvim/blob/master/doc/coc.txt
" https://github.com/prabirshrestha/vim-lsp
" COC autocomplete
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" COC show all usages
nmap gr <Plug>(coc-references)
nmap gR <Plug>(coc-rename)
nmap <A-CR> :CocFix<CR>
"-------------------------------------------------------------------
" git

let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
nmap <space>h <Plug>(GitGutterNextHunk)<Plug>(GitGutterPreviewHunk)
nmap <space>l <Plug>(GitGutterPrevHunk)<Plug>(GitGutterPreviewHunk)
nmap <space>H :<C-u>GitGutterFold<CR>
"-------------------------------------------------------------------
" terminal
"   insert mode - to command line
"   ;i - to visual mode
"   f12 - toggle

let g:term_buf = 0
let g:term_win = 0

function! Term_toggle(height)
    if win_gotoid(g:term_win)
            exec "colorscheme " . g:main_color_scheme
        hide
    else
            exec "colorscheme " . g:terminal_color_scheme
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen("tmux", {"detach": 0})
            let g:term_buf = bufnr("")
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction


nnoremap <f12> :call Term_toggle(40)<cr>
tnoremap <f12> <C-\><C-n>:call Term_toggle(40)<cr>
" Terminal go back to normal mode
tnoremap ;i <C-\><C-n>
"-------------------------------------------------------------------
":CocInstall coc-css
":CocInstall coc-html

let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-css',
  \ 'coc-html'
  \ ]
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" show preview doc
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

"-------------------------------------------------------------------
