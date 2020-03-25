set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'sjl/badwolf'
Plugin 'airblade/vim-gitgutter'
Plugin 'VundleVim/Vundle.vim'
Plugin 'wincent/command-t'
Plugin 'Valloric/YouCompleteMe'
Plugin 'reedes/vim-colors-pencil'
Plugin 'reedes/vim-pencil'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-syntastic/syntastic'
Plugin 'bling/vim-bufferline'
Plugin 'vivien/vim-linux-coding-style'
Plugin 'majutsushi/tagbar'
Plugin 'matze/vim-tex-fold'
Plugin 'lervag/vimtex'
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

colorscheme badwolf
set number " enable line numbers
syntax enable
set tabstop=4 " 1 tab = 4 spaces
set softtabstop=4 " 1 tab = 4 spaces whe editin
set expandtab " tab gets replaced by 4 spaces
set cursorline " creates a highlight on current line
set incsearch " begin search with first keystroke
set hlsearch " highlight search results
hi Folded ctermfg=248

set sw=4 et
let g:ycm_server_python_interpreter = '/usr/bin/python'
let g:ycm_semantic_triggers = {'haskell' : ['.']}
let g:ycm_filetype_blacklist= {'tex' : 1 }
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 5
let g:indent_guides_enable_on_vim_startup = 1
" airline{{{
let g:airline#extensions#bufferline#enabled = 1
let g:airline_theme='deus'
let g:airline_powerline_fonts = 1
"}}}
"Mappings{{{
map <C-n> :NERDTreeToggle<CR>
let maplocalleader = "\\"
let mapleader ="-"
"}}}
"syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"}}}
"linux-sty {{{
let g:linuxsty_patterns = [ '/home/marcus/git/linux' ]
"}}}
nnoremap <silent> <leader>a :LinuxCodingStyle<cr>
nmap <leader>t :TagbarToggle<cr>
"latex-options{{{
let g:tex_flavor='latex'
let g:vimtex_view_general_viewer = 'qpdfview'
let g:vimtex_view_general_options
\ = '--unique @pdf\#src:@tex:@line:@col'
let g:vimtex_view_general_options_latexmk = '--unique'
"}}}
"goyo{{{
let g:goyo_width=160
"}}}
" disable ro mode in vimdiff
set noro

"==============================================================
"   FUNCTIONS 
"==============================================================

function! WritingMode()
    :Pencil
    :SoftPencil
    let g:airline_theme= 'pencil'
    colorscheme pencil
    :Goyo
    :Limelight
endfunction

function! CodingMode()
    :NoPencil
    :Goyo!
    :Limelight!
    let g:airline_theme='deus'
    colorscheme badwolf
endfunction
