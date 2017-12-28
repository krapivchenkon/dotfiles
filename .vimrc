" ##### General configuration settings
"
" set encoding
set encoding=utf-8
" swap directory instead of saving swaps in the same directory
set dir=~/.vim/.swp/
" set undo directory
set undodir=~/.vim/.undo/
" set backup directory
set bdir=~/.vim/.backup/
" Font configuration
set guifont=Anonymous\ Pro:h12
" set nonumber
set number
" enable indent
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" If need to know these then simply do:
" set ff for fileformat
" set fenc for fileencoding
" set ft for filetype
" disable guioptions, i.e. hide scrollbars
set guioptions=
" autosave when :make is executed
set autowrite
set visualbell
"
" ###### END General configuration settings

" ####### Plugin configuration
" Check if vim-plug is set up and setup if not
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'mhartington/oceanic-next'
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
Plug 'ajmwagar/vim-dues'
Plug 'YorickPeterse/happy_hacking.vim'
Plug 'scrooloose/nerdtree'
Plug 'lifepillar/vim-solarized8'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
" buffer management plugin
Plug 'fholgado/minibufexpl.vim'
Plug 'bling/vim-bufferline'
Plug 'gcmt/taboo.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go'
" Initialize plugin system
call plug#end()
" ####### END Plugin configuration

" ###### Colorscheme setup start
" current configuration is for deus colorscheme
" for best results install closest iterm2 colorprofile from https://github.com/mbadolato/iTerm2-Color-Schemes
" profile name is "Gruvbox Dark"
if has('gui_running')
else
    set t_Co=256
    set termguicolors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    let g:deus_termcolors=256
endif  
set background=dark " Setting dark mode
colorscheme deus
let g:airline_theme = "deus"
" ###### END colorscheme setup 

" ###### NERDTree configuration
" enable NERTREE if running in gui
if has('gui_running')
"  autocmd vimenter * NERDTree
endif
" enable hidden files
let NERDTreeShowHidden = 1
" open NERDTree on Tab
map <Tab> :NERDTreeToggle<CR>
"
" ###### END NERDTree configuration 

" ###### Buffer managements configuration
" for help type :help minibufexplorer.text
" show list of all open buffers and switch to selected buffer by ids ID  
nnoremap <Leader>b :ls<CR>:buffer<Space>
" don't open minibuf explorer window by default
let g:miniBufExplAutoStart = 0
" map buffer navigation keys
nnoremap <D-j> :MBEbf<CR> " next LRU
nnoremap <D-k> :MBEbb<CR> " prev LRU
nnoremap <D-]> :MBEbn<CR> " next
nnoremap <D-k> :MBEbp<CR> " prev
nnoremap <Leader>d :MBEbd <CR>
"
" ###### END Buffer managements configuration

" ###### Window management
set mousefocus
" on Ctrl-Tab  set focus to next window clockwise
nnoremap <C-Tab> <C-W>w
" on Ctrl-Shift-Tab  set focus to next window against clockwise
nnoremap <C-S-Tab> <C-W>W
nnoremap <D-i> :TabooRename<space>
" 
" ###### END Window management

" ###### Airline config

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1
let g:airline_right_alt_sep = ''
let g:airline_left_alt_sep = ''
" unicode symbols
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = 'Ξ'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.branch = '⎇'
let g:airline_detect_spell=0
" Airline White Space Handling:
let g:airline#extensions#whitespace#enabled = 1
let g:airline_symbols.whitespace = '□□'
" airline bufferline extension:
let g:airline_extensions = ['bufferline','branch']
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#bufferline#overwrite_variables = 1
let g:bufferline_echo = 0
" Automatically displays all buffers when there's only one tab open.
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1

"configure the formatting of the warning messages. >
let g:airline#extensions#whitespace#mixed_indent_format = 'MI[%s]'
let g:airline#extensions#whitespace#trailing_format = 'T[%s]'
" regex for trailing white space, looks for TWO spaces, not one
let g:airline#extensions#whitespace#trailing_regexp = '\s\s$'
" orange for mixed-indent
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing']
" File Type File Encoding File Format:
" Tells airline not to display file format
let g:airline_section_x =''
" Tells airline not to display fileencoding or fileformat
let g:airline_section_y =''
let g:airline_skip_empty_sections = 1
" " Airline Short Form Mode Indicators:
" Paste the following into your vimrc for shortform text
" N instead of NORMAL, I instead of INSERT

let g:airline_mode_map = {
\ '__' : '-',
\ 'n' : 'N',
\ 'i' : 'I',
\ 'R' : 'R',
\ 'c' : 'C',
\ 'v' : 'V',
\ 'V' : 'V',
\ '�' : 'V',
\ 's' : 'S',
\ 'S' : 'S',
\ }
"
" ###### END Airline config


