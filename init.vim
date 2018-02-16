call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'sonph/onehalf'
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
" Plug 'neomake/neomake'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'shougo/echodoc'
Plug 'sirver/ultisnips'
Plug 'posva/vim-vue'
Plug 'digitaltoad/vim-jade'
Plug 'jceb/vim-orgmode'
Plug 'mhinz/vim-startify'
Plug 'eagletmt/neco-ghc'
Plug 'tpope/vim-repeat'
Plug 'svermeulen/vim-easyclip'
Plug 'easymotion/vim-easymotion'
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'thinca/vim-ref'
Plug 'zchee/deoplete-jedi'
Plug 'lervag/vimtex'
Plug 'Shougo/vimshell.vim'
Plug 'tpope/vim-endwise'
Plug 'ElmCast/elm-vim'
Plug 'davidhalter/jedi-vim'
" Plug 'w0rp/ale'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }
Plug 'trotzig/import-js'
Plug 'editorconfig/editorconfig-vim'
Plug 'freitass/todo.txt-vim'
Plug 'mbbill/undotree'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

let g:deoplete#enable_at_startup=1
let g:deoplete#auto_complete_delay = 200
let g:nvim_typescript#type_info_on_hold=1
" let g:nvim_typescript#vue_support=1
set shortmess+=c
set updatetime=100
set completeopt-=preview
set completeopt+=noinsert
set noswapfile

autocmd FileType typescript nnoremap <M-CR> :TSImport<CR>
autocmd FileType typescript nnoremap <C-b> :TSDef<CR>
autocmd FileType typescript nnoremap <C-S-b> :TSTypeDef<CR>


autocmd FileType python nnoremap <C-b> :call jedi#goto()<CR>

let g:alchemist_tag_disable = 1
let g:alchemist_tag_map = '<C-b>'


" completion tab behaviour
inoremap <expr> <tab> pumvisible() ? deoplete#close_popup() : "\<tab>"
let g:UltiSnipsExpandTrigger=""
" completion enter behaviour
inoremap <silent> <cr> <C-r>=<SID>my_cr_function()<cr>
function! s:my_cr_function() abort
    return deoplete#mappings#smart_close_popup() . "\<CR>"
endfunction
" manual complete
" inoremap <expr> <tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()

let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:echodoc_enable_at_startup = 1

set clipboard+=unnamedplus
set noshowmode
set cmdheight=2
set nocompatible
set hidden
" set background =dark
syntax on
set termguicolors
set expandtab
set softtabstop=4
set shiftwidth=4
set number relativenumber
colorscheme onedark

" NERD Tree
map <M-1> :NERDTreeToggle<CR>

let mapleader="\<Space>"
let maplocalleader=","

nnoremap <Leader>fs :wa<CR>
nnoremap <Leader>wd :q<CR>
nnoremap <Leader>qq :qa!<CR>

nnoremap <Leader>wv :vsplit<CR>
nnoremap <Leader>ws :ssplit<CR>

" fzf bindings
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
nnoremap <Leader>wf :Windows<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fa :FZF -x ~<CR>
nnoremap <Leader>fc :Ag <CR>
nnoremap <Leader>b :History<CR>
nnoremap <Leader>s :Snippets<CR>
nnoremap <Leader>c :Commands<CR>

nnoremap <silent><A-Up> :m .-2<CR>
nnoremap <silent><A-Down> :m .+1<CR>
inoremap <silent><A-Down> <Esc>:m .+1<CR>gi
inoremap <silent><A-Up> <Esc>:m .-2<CR>gi
vnoremap <silent><A-Down> :m '>+1<CR>gv=gv
vnoremap <silent><A-Up> :m '<-2<CR>gv=gv


" previous buffer
nnoremap <Leader><tab> :b# <CR>

" window switching
nmap <silent> <A-l> :wincmd k<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>
" nmap <silent> <A-Up> :wincmd k<CR>
" nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

nmap <silent> <Leader>1 :1wincmd W<CR>
nmap <silent> <Leader>2 :2wincmd W<CR>
nmap <silent> <Leader>3 :3wincmd W<CR>
nmap <silent> <Leader>4 :4wincmd W<CR>
nmap <silent> <Leader>5 :5wincmd W<CR>
nmap <silent> <Leader>6 :6wincmd W<CR>

nnoremap Z ^
nnoremap X $

" let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#win_nr_show = 1
let g:airline_section_z = '%{strftime("%H:%M")}'
let g:airline_section_c = airline#section#create(['%{getcwd()}', '/', 'file'])

let g:startify_bookmarks = [ '~/.config/nvim/init.vim', '~/Projects/' ]
let g:startify_session_autoload = 1

noremap <silent><F11> :call GuiWindowFullScreen(1)<CR>

let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql Prettier

nnoremap <Leader>jf :PrettierAsync<CR>

" number of spaces per indentation level
let g:prettier#config#tab_width = 2

let g:prettier#config#semi = 'true'
let g:prettier#config#arrow_parens = 'always'

" single quotes over double quotes
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'true'

" easy clip
let g:EasyClipUseSubstituteDefaults = 1
let g:EasyClipUseCutDefaults = 0
" cut is on <leader>d now
nnoremap d "_d
xnoremap d "_d
nnoremap dd "_dd
nnoremap D "_D
nmap gd <Plug>MoveMotionPlug
xmap gd <Plug>MoveMotionXPlug
nmap gdd <Plug>MoveMotionLinePlug
map gD <Plug>MoveMotionEndOfLinePlug

tnoremap <C-a> <C-\><C-n>

" elm
let g:elm_format_autosave = 1

autocmd BufNewFile,BufRead * set conceallevel=0
autocmd BufWritePost,BufNewFile,BufRead *.elm set conceallevel=1
autocmd BufWritePost,BufNewFile,BufRead *.elm set concealcursor=nvi
autocmd BufWritePost,BufNewFile,BufRead *.elm syntax match spaces /  / conceal cchar= 

" Replace every 2 spaces with one
" autocmd BufNewFile,BufRead *.elm syntax match spaces /  / conceal cchar=  
" autocmd BufWritePre *.elm syntax match spaces /  / conceal cchar= 
" autocmd BufNewFile,BufRead *.elm set concealcursor=nvi
" autocmd BufWritePre *.elm set concealcursor=nvi
" autocmd BufNewFile,BufRead *.elm set conceallevel=1
