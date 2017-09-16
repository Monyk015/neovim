call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'joshdick/onedark.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'kassio/neoterm'
Plug 'mhartington/nvim-typescript'
Plug 'neomake/neomake'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'shougo/echodoc'
Plug 'sirver/ultisnips'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

let g:deoplete#enable_at_startup=1
let g:nvim_typescript#type_info_on_hold=1
set updatetime=100
set shortmess+=c
set completeopt-=preview
set completeopt+=noinsert

nnoremap <M-CR> :TSImport<CR>
nnoremap <C-b> :TSDef<CR>
nnoremap <C-S-b> :TSTypeDef<CR>


inoremap <expr> <tab> pumvisible() ? deoplete#close_popup() : "\<tab>"
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
 return "\<CR>"
endfunction


let g:UltiSnipsExpandTrigger="nil"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:echodoc_enable_at_startup = 1

set clipboard+=unnamedplus
set noshowmode
set cmdheight=2
set nocompatible
set hidden
set background = "dark"
syntax on
colorscheme onedark
set termguicolors
set tabstop=4
set shiftwidth=4
set number relativenumber

" NERD Tree
map <M-1> :NERDTreeToggle<CR>

let mapleader="\<Space>"
let maplocalleader=","

nnoremap <Leader>fs :wa<CR>
nnoremap <Leader>d :q<CR>
nnoremap <Leader>qq :qa!<CR>

nnoremap <Leader>v :vsplit<CR>

" fzf bindings
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
nnoremap <Leader>w :Windows<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fa :FZF -x ~<CR>
nnoremap <Leader>fc :Ag <CR>
nnoremap <Leader>b :History<CR>
nnoremap <Leader>s :Snippets<CR>
nnoremap <Leader><Leader> :Commands<CR>



" previous buffer
nnoremap <Leader><tab> :b# <CR>

" window switching
nmap <silent> <A-l> :wincmd k<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

nmap <silent> <Leader>1 :1wincmd W<CR>
nmap <silent> <Leader>2 :2wincmd W<CR>
nmap <silent> <Leader>3 :3wincmd W<CR>
nmap <silent> <Leader>4 :4wincmd W<CR>
nmap <silent> <Leader>5 :5wincmd W<CR>
nmap <silent> <Leader>6 :6wincmd W<CR>

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#win_nr_show = 1
