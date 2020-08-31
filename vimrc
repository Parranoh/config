set nocompatible              " be iMproved, required
filetype off                  " required

"" plugins
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'eagletmt/neco-ghc'

Plugin 'gosukiwi/vim-atom-dark'

Plugin 'LucHermitte/lh-vim-lib'
Plugin 'LucHermitte/lh-brackets'

Plugin 'tpope/vim-fugitive'

Plugin 'preservim/nerdtree'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

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
autocmd bufwritepre * set expandtab | retab 4
" convert spaces to tabs after writing file (to show guides again)
autocmd bufwritepost * set noexpandtab | silent! call RetabIndents()

"" options
set nu
set rnu
syntax enable
set cindent
set incsearch
set ignorecase
set smartcase
set hlsearch
set foldmethod=marker
set textwidth=80
set background=dark
set showmatch
set showcmd
set mouse=a
set hidden
set backupdir=.backup,~/.backup,/tmp//
set directory=.swp/,~/.swp/,/tmp//
set undodir=.undo/,~/.undo/,/tmp//

"" custom mapping
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprevious<CR>
nnoremap <Leader>a :NERDTreeToggle<CR>

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

let g:haskellmode_completion_ghc = 0
let g:necoghc_enable_detailed_browse = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
highlight PmenuSel ctermbg=DarkGreen cterm=bold ctermfg=White

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'simple'
