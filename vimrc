set nocompatible              " be iMproved, required
filetype off                  " required

"" plugins
let g:airline_section_z  = '%p%%'                                                             " percent
let g:airline_section_z .= '%#__accent_bold#%{g:airline_symbols.linenr}%l%#__restore__#'      " current line
let g:airline_section_z .= '%#__accent_bold#/%L%{g:airline_symbols.maxlinenr}%#__restore__#'  " last line
let g:airline_section_z .= '%#__accent_bold#%{g:airline_symbols.colnr}%v%#__restore__#'       " current column
let g:airline_section_z .= ' U+%04B'                                                          " character under cursor

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'gosukiwi/vim-atom-dark'
Plugin 'preservim/nerdtree'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/ReplaceWithRegister'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let fortran_free_source=1
let fortran_more_precise=1

"" tab handling
" Retab spaced file, but only indentation
func! RetabIndents()
    if &ma
        let saved_view = winsaveview()
        execute '%s@^\( \{'.&ts.'}\)\+@\=repeat("\t", len(submatch(0))/'.&ts.')@'
        call winrestview(saved_view)
    endif
endfunc
" use 4 spaces for tabs
set tabstop=4 softtabstop=0 shiftwidth=0
" display indentation guides
set list listchars=tab:│\ ,trail:·,extends:»,precedes:«,nbsp:×
" convert spaces to tabs when reading file
autocmd bufreadpost * set noexpandtab | silent! call RetabIndents()
" convert tabs to spaces before writing file
autocmd bufwritepre * if &filetype != 'make' | set expandtab | retab 4
" convert spaces to tabs after writing file (to show guides again)
autocmd bufwritepost * set noexpandtab | silent! call RetabIndents()

"" options
set number relativenumber
autocmd TerminalOpen * if &buftype == 'terminal' | setlocal nobuflisted nonumber norelativenumber | endif
syntax enable
set cindent
set incsearch hlsearch
set ignorecase smartcase
set foldmethod=marker
set textwidth=80
set background=dark
set showmatch
set showcmd
set mouse=a
if $TERM == 'alacritty'
    set ttymouse=sgr
endif
set hidden
set display=truncate scrolloff=5
set backupdir=.backup,~/.backup,/tmp//
set directory=.swp/,~/.swp/,/tmp//
set undodir=.undo/,~/.undo/,/tmp//
set timeout timeoutlen=1000 ttimeoutlen=100

"" custom mapping
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprevious<CR>
nnoremap <Space> :
nnoremap <Leader>a :NERDTreeToggle<CR>
nnoremap Y y$
vnoremap il <Esc>^vg_
onoremap il :normal vil<CR>
" automagically close brackets
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {;<CR> {<CR>};<Esc>O
autocmd FileType html,xml inoremap <buffer> < <><left>
" automagically close quotes, brackets
inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "'" ? "\<Right>" : "''<Left>"
inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == '"' ? "\<Right>" : '""<Left>'
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
autocmd FileType haskell,lhaskell inoremap <buffer> ' '
autocmd FileType html,xml inoremap <buffer> <expr> > strpart(getline('.'), col('.')-1, 1) == ">" ? "\<Right>" : ">"
autocmd FileType haskell,lhaskell inoremap <buffer> <expr> ` strpart(getline('.'), col('.')-1, 1) == "`" ? "\<Right>" : "``<Left>"
" automagically delete closing quote, brackets if empty
autocmd FileType * let b:brackets = ["''", '""', "()", "[]", "{}"]
autocmd FileType html,xml let b:brackets = ["''", '""', "()", "[]", "{}", "<>"]
autocmd FileType haskell,lhaskell let b:brackets = ['""', "()", "[]", "{}", "``"]
autocmd FileType * inoremap <buffer> <expr> <BS> index(b:brackets, strpart(getline('.'), col('.')-2, 2)) != -1 ? "<BS><Del>" : "<BS>"

" aliases
command -nargs=* -complete=help H vert bo h <args>

"" plugin options
filetype plugin on
set omnifunc=syntaxcomplete#Complete

autocmd FileType cpp set tags+=~/.vim/tags/cpp
let Omni_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
highlight PmenuSel ctermbg=DarkGreen cterm=bold ctermfg=White

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'simple'
