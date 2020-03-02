call plug#begin('~/.vim/plugged')
Plug 'justinmk/vim-sneak'
Plug 'joshdick/onedark.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-repeat'
Plug 'svermeulen/vim-easyclip'
Plug 'editorconfig/editorconfig-vim'
Plug 'mbbill/undotree'
Plug 'machakann/vim-highlightedyank'
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
Plug 'elixir-editors/vim-elixir'
Plug 'pangloss/vim-javascript'
Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-startify'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-fugitive'
Plug 'tommcdo/vim-exchange'
Plug 'ElmCast/elm-vim'
Plug 'JamshedVesuna/vim-markdown-preview'
" Initialize plugin system
call plug#end()

let mapleader="\<Space>"
let maplocalleader = ","

let vim_markdown_preview_github=1

nnoremap <Leader><tab> :b# <CR>

inoremap jk <ESC>
inoremap <ESC> <nop>
inoremap <C-v> <ESC>pa
inoremap <C-z> <ESC>ui


let g:NERDTreeIgnore = ['^node_modules$']

set relativenumber

set smarttab
set cindent
set tabstop=2
set shiftwidth=2
" always uses spaces instead of tab characters
set expandtab
set clipboard+=unnamedplus

colorscheme onedark

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-elixir'
  \ ]
" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
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
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gf <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>mf :<C-u>Format<cr>

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)


" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <C-d> <Plug>(coc-range-select)
" xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

nnoremap <silent><A-Up> :m .-2<CR>
nnoremap <silent><A-Down> :m .+1<CR>
inoremap <silent><A-Down> <Esc>:m .+1<CR>gi
inoremap <silent><A-Up> <Esc>:m .-2<CR>gi
vnoremap <silent><A-Down> :m '>+1<CR>gv=gv
vnoremap <silent><A-Up> :m '<-2<CR>gv=gv

nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

nnoremap <Leader>fs :wa<CR>
nnoremap <Leader>wd :q<CR>
nnoremap <Leader>qq :qa!<CR>

nnoremap <Leader>wv :vsplit<CR>
nnoremap <Leader>ws :ssplit<CR>

nnoremap <Leader>ot :NERDTreeToggle<CR>

let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
nnoremap <Leader>wf :Windows<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader><Leader> :Files<CR>
nnoremap <Leader>fa :FZF -x ~<CR>
nnoremap <Leader>fc :Ag <CR>
nnoremap <Leader>b :History<CR>
nnoremap <Leader>c :Commands<CR>
nnoremap <Leader>/ :BLines<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>


" let g:EasyClipUseSubstituteDefaults = 1
let g:EasyClipUseCutDefaults = 0

" nmap <silent> gs <plug>SubstituteOverMotionMap 
" map gss <plug>SubstituteLine
" xmap gs <plug>XEasyClipPaste

nnoremap d "_d
xnoremap d "_d
nnoremap dd "_dd
nnoremap D "_D
nmap gd <Plug>MoveMotionPlug
xmap gd <Plug>MoveMotionXPlug
nmap gdd <Plug>MoveMotionLinePlug
map gD <Plug>MoveMotionEndOfLinePlug

let g:highlightedyank_highlight_duration = 100

fu! FzfTagsCurrWord()
  let currWord = expand('<cword>')
  if len(currWord) > 0
    execute ':Ag ' . currWord
  else
    execute ':Ag'
  endif
endfu

nnoremap <Leader>* :call FzfTagsCurrWord()<CR>

let g:sneak#label = 1

let g:prettier#config#single_quote = 'true'
let g:prettier#config#semi = 'false'

