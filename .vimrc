
" Disable Background Color Erase (BCE) so that color schemes
" work properly when Vim is used inside tmux and GNU screen.
if &term =~ '256color'
    set t_ut=
endif
" ---------------------------------------------------------------
"Vim-Plug

call plug#begin('~/.vim/plugged')
Plug 'jacoborus/tender.vim'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'pangloss/vim-javascript'
Plug 'chun-yang/auto-pairs'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'junegunn/goyo.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'flazz/vim-colorschemes'
call plug#end()

" ---------------------------------------------------------------
" set leader key
let g:mapleader = ","

" ---------------------------------------------------------------
" Basic Settings 
syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			            " Show the cursor position all the time
set cmdheight=1                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=4                           " Insert 2 spaces for a tab
set softtabstop=4
set shiftwidth=4                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set number                              " Line numbers
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
set autochdir                           " Your working directory will always be the same as your working directory
set laststatus=2                        " Set statusline
set mouse=                              " disable mouse contrl
set hlsearch                            " highlight searches

" ---------------------------------------------------------------
" Colorscheme 
if (has("termguicolors"))
    set termguicolors
endif
colorscheme nord

let g:lightline = { 'colorscheme': 'nord' }
" ---------------------------------------------------------------
" Integrated Terminal 

set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" open terminal on ctrl+n
nnoremap <c-n> :term<CR>

" ---------------------------------------------------------------
" ---------------------------------------------------------------
" ---------------------------------------------------------------
"PlugIns setting 
" Buffer Explorer 
" ---------------------------------------------------------------
map <leader>o <leader>be
" Goyo 
" ---------------------------------------------------------------
" toggle
map <leader>g :Goyo<cr>

"
" NerdTree 
" ---------------------------------------------------------------
" toggle
map <silent> <leader>n :NERDTreeToggle<cr> 
" automatically start nerdtree when no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close vim if nerdtree is the only window opened
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" open nerdtree on the right side
let g:NERDTreeWinPos = "right"
" NerdCommenter 
" ---------------------------------------------------------------
" toggle comment (overriden by default setting?)
map <leader>cc <leader>c<space>
" Ctrl p
" ---------------------------------------------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = 'c'
" ---------------------------------------------------------------
" KeyMapping 

"editing files
map <silent> <leader>q :q<cr>
map <silent> <leader>w :w<cr>
map <silent> <leader>qq :q!<cr>
map <silent> <leader>wq :wq<cr>
map <silent> <leader>wa :wa<cr>

map <leader>e :edit 

" yank the whole line
map <silent> yy Vy

" tabedit a file
map <leader>t :tabe 
" move to next tab
map <tab> gt 

" split window 
map <leader>s :split 
map <leader>v :vsplit 
" move between windows
noremap <space><space> <C-w>w 
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h

" erase search highlights
map <silent> <space> :noh<cr>

" correct indentation
map <silent> <leader>co gg=G<C-o><C-o>
