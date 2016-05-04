" Info: 
" - M mark is reserved for anything. So, don't use it if you don't want to lose its value.
" 

" Set nocompatible with Vi {{{
set nocompatible
" }}}

" NeoBundle initialization {{{

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" }}}

" NeoBundle plugins definition {{{

" Start plugin definition
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" File explorer (needed where ranger is not available) 
NeoBundleLazy 'Shougo/vimfiler', {'autoload' : { 'commands' : ['VimFiler']}}

" Junk files 
NeoBundleLazy 'Shougo/junkfile.vim', {'autoload':{'commands':'JunkfileOpen',
            \ 'unite_sources':['junkfile','junkfile/new']}}

" Color schemes
NeoBundle 'thomd/vim-wasabi-colorscheme'

" NERDTree
NeoBundle 'scrooloose/nerdtree'

" Allow to better searching
NeoBundle 'easymotion/vim-easymotion'

" Surrounding facilities
NeoBundle 'tpope/vim-surround'

NeoBundle 'godlygeek/tabular'

"End plugin definition
call neobundle#end()

" }}}

" NeoBundle end configuration {{{
"
" Required:
filetype plugin indent on
filetype plugin on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
" }}}

" Basic {{{

set autoread                            " update a open file edited outside of Vim
set ttimeoutlen=0                       " toggle between modes almost instantly
set backspace=indent,eol,start          " defines the backspace key behavior
set virtualedit=                        " no virtual edit
set foldenable                          " allow folding
set mouse=                              " disable mouse

set exrc                                " allow to load vim files
set secure                              " secure loading

scriptencoding utf-8

" set russian locale work
set keymap=russian-jcukenwin 
set iminsert=0
" }}}

" Searching {{{

set incsearch                           " incremental searching
set showmatch                           " show pairs match
set hlsearch                            " highlight search results
set ignorecase                          " ignore case letters
set gdefault                            " set g flag in substitution by default

" }}}

" History {{{

set history=1000
set undofile
set undolevels=1000

" }}}

" Backups {{{

set nobackup
set noswapfile

" }}}

" Wildmenu {{{

set wildmenu                        " Command line autocompletion
set wildmode=list:longest,full      " Shows all the options

set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.bak,*.?~,*.??~,*.???~,*.~      " Backup files
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.jar                            " java archives
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.stats                          " Pylint stats
set wildignore+=*.class                          " Pylint stats
set wildignore+=*~                          " Pylint stats
set wildignore+=*.class                          " Pylint stats

" }}}

" Tabs, space and wrapping {{{

set expandtab                  " spaces instead of tabs
set tabstop=4                  " a tab = four spaces
set shiftwidth=4               " number of spaces for auto-indent
set softtabstop=4              " a soft-tab of four spaces
set smartindent                " set on the smartindent

" }}}

" Interface {{{

" GUI settings {{{

" Tab settings {{{

" }}}

" Status line {{{

if has('statusline')
    set ls=2                        " status line always visible

    set statusline=
    set statusline+=%7*\[%n]                                  "buffernr
    set statusline+=%1*\ %<%F\                                "File+path
    set statusline+=%2*\ %y\                                  "FileType
    set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
    set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
    set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
    set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
    set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
    set statusline+=%9*\ col:%03c\                            "Colnr
    set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.

    hi User1 guifg=#ffdad8  guibg=#880c0e
    hi User2 guifg=#000000  guibg=#F4905C
    hi User3 guifg=#292b00  guibg=#f4f597
    hi User4 guifg=#112605  guibg=#aefe7B
    hi User5 guifg=#051d00  guibg=#7dcc7d
    hi User7 guifg=#ffffff  guibg=#880c0e gui=bold
    hi User8 guifg=#ffffff  guibg=#5b7fbb
    hi User9 guifg=#ffffff  guibg=#810085
    hi User0 guifg=#ffffff  guibg=#094afe
endif

" }}}

" Ruler {{{

if has('cmdline_info')
    set ruler
    set showcmd                     		" shows partial commands
endif

" }}}

set go-=T                               " hide the toolbar
set go-=m                               " hide the menu

" The next two lines are quite tricky, but in Gvim, if you don't do this, if you
" only hide all the scrollbars, the vertical scrollbar is showed anyway
set go+=rRlLbh                          " show all the scrollbars
set go-=rRlLbh                  		" hide all the scrollbars
set novisualbell				" no visual bell
set nocursorline				" set no cursor highlighting
set ttyfast                     		" better screen redraw
set title                       		" set the terminal title to the current file
set showmode                            " show modes
set hidden                      		" hide the inactive buffers
set lazyredraw                  		" only redraws if it is needed

" }}}

" Style settings {{{

syntax enable					" set syntax on
set background=dark
colorscheme wasabi256				" set colorscheme

" }}}

" Font {{{

set guifont=Inconsolata\ 11

" }}}

" set formatoptions=qrn1ct
set textwidth=100
set colorcolumn=0

set number                      " allow number of lines
set relativenumber
set winminheight=0              " allow zero-length windows

"set colors to color column
hi ColorColumn ctermbg=lightgrey guibg=lightgrey 

set list
set listchars=tab:>.,trail:.,extends:\#,nbsp:. " Highlight problematic whitespace

set shortmess+=filmnrxoOtT      " abbrev. of messages
set scrolljump=5                " lines to scroll when cursor leaves screen
set scrolloff=3                 " minimum lines to keep above and below cursor

" }}}

" Autocommands {{{

" Base Group {{{
augroup BaseGroup
    autocmd!
    autocmd BufWinLeave \* silent! mkview  "make vim save view (state) (folds, cursor, etc)
    autocmd BufWinEnter \* silent! loadview "make vim load view (state) (folds, cursor, etc
    autocmd VimResized * exe "normal! \<c-w>="   " when vim is resized, then resize all windows
    autocmd BufWritePost vimrc source %
augroup END
" }}}

" }}}

" General Functions {{{

" Makes directory if no exists{{{
function! MakeDirIfNoExists(path) " 
    if !isdirectory(expand(a:path))
        call mkdir(expand(a:path), "p")
    endif
endfunction
" }}}

" Returns H if hls set{{{
function! HighlightSearch() 
  if &hls
    return 'H'
  else
    return ''
  endif
endfunction
" }}}

" }}}

" Vim Mappings {{{

"" leader key
let mapleader=","

" set paste toggle
set pastetoggle=<F2>

" yank to the end of the lines
nnoremap Y y$

" Disable unnecessary shift
nnoremap ; :
vnoremap ; :

" Close buffer
nnoremap <Leader>bc :bd<CR>

" More useful info
map <C-g> g<C-g>

" Disable Escape
inoremap <Leader>j <Esc>
inoremap <Esc> <nop>
vnoremap <Leader>j <Esc>
vnoremap <Esc> <nop>
cnoremap <Leader>j <Esc>
cnoremap <Esc> <nop>

" k and j for visual lines 
nnoremap k gk
nnoremap j gj

" Disable arrows {{{
nnoremap <Up> <nop>
nnoremap <Right> <nop>
nnoremap <Left> <nop>
nnoremap <Down> <nop>

vnoremap <Up> <nop>
vnoremap <Right> <nop>
vnoremap <Left> <nop>
vnoremap <Down> <nop>

inoremap <Up> <nop>
inoremap <Right> <nop>
inoremap <Left> <nop>
inoremap <Down> <nop>
" }}}

" Saves {{{
nnoremap <Leader>w :w<CR>
nnoremap <Leader>ww :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>wq :wq<CR>

" No save exit
map <Leader>qq :q!<CR>

" Root save
cmap w!! w !sudo tee % >/dev/null<CR>:e!<CR><CR>

" }}}

" Tabs {{{
" Tab Close
nnoremap <Leader>tc :tabclose<CR>

" Tab New
nnoremap <Leader>tn :tabnew<CR>

" Tab Move
nnoremap <Leader>tm :tabmove

" Tab End
nnoremap <Leader>te :tablast<CR>

" Tab First
nnoremap <Leader>tb :tabfirst<CR>

" Go to left tab
nnoremap <Leader>th @='gT' <CR>

" Go to right tab
nnoremap <Leader>tl @='gt' <CR>

" }}}

" Windows managemet {{{

" Window vertical
nnoremap <Leader>wv <C-w>v

" Window horizontal
nnoremap <Leader>wh <C-w>s

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Leader>wc :close<CR>			" Window Close

" }}}

" visual shifting (does not exit Visual mode) {{{
vnoremap < <gv
vnoremap > >gv 
" }}}

" Folding {{{

" toggle folding
nnoremap <CR> za
vnoremap <CR> za

set foldmethod=marker

" Code folding options
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>
" }}}

" Editing main .vimrc {{{
nnoremap <Leader>eo :edit   ~/.vimrc<CR>	" Options Edit
nnoremap <Leader>ro :source ~/.vimrc<CR>	" Options Reload
" }}}

" No highlight {{{
nnoremap <Leader><Space> :nohl<CR>
" }}}

" {{{ Tabularize

if exists(":Tabularize")
    " todo add some keybindings
endif

" }}}

" }}}

" Plugins Settings & Mappings {{{

" Neobundle {{{
" change filename of the main log file
let g:neobundle#log_filename = $HOME.'/.vim/tmp/neobundle.log'
" }}}

" }}}
