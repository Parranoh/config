set nu
syntax enable
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set textwidth=80
set background=dark
set showmatch
set foldmethod=marker
let g:solarized_termtrans=1
colorscheme solarized
:highlight ExtraWhitespace ctermbg=green guibg=darkgreen
:match ExtraWhitespace /\s\+$/
set backupdir=.backup,~/.backup,/tmp//
set directory=.swp/,~/.swp/,/tmp//
set undodir=.undo/,~/.undo/,/tmp//

set nocp
filetype plugin on
set tags+=~/.vim/tags/cpp
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
:highlight PmenuSel ctermbg=DarkGreen cterm=bold ctermfg=White
