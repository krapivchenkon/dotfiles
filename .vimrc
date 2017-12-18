set encoding=utf-8

call plug#begin('~/.local/share/nvim/plugged')
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
" Plug 'fholgado/minibufexpl.vim'
Plug 'bling/vim-bufferline'
" Initialize plugin system
call plug#end()


nnoremap <D-]> :bnext<CR>
nnoremap <D-[> :bprev<CR>

set number
autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>

let NERDTreeShowHidden = 1
set guioptions=
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" let g:hybrid_custom_term_colors = 1
"" set background=dark
" colorscheme hybrid_material

if has('gui_running')
else
endif
set guifont=Anonymous\ Pro:h12
colorscheme flattened_dark

set dir=~/.vim/.swp//
set undodir=~/.vim/.undo//
set bdir=~/.vim/.backup/

nnoremap <Leader>b :ls<CR>:buffer<Space>
nnoremap gb :ls<CR>:buffer<Space>

" Airline config
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 0
let g:airline_right_alt_sep = ''
" unicode symbols
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = 'Ξ'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.branch = '⎇'
let g:airline_detect_spell=0
" Airline White Space Handling:
let g:airline#extensions#whitespace#enabled = 1
let g:airline_symbols.whitespace = '□□'

let g:airline#extensions#branch#enabled = 1


" airline bufferline extension:
let g:airline_extensions = ['bufferline','branch']
" let g:airline#extensions#bufferline#enabled =     1
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
" If need to know these then simply do:
" set ff for fileformat
" set fenc for fileencoding
" set ft for filetype

" Airline Short Form Mode Indicators:
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
let g:airline_section_x = airline#section#create(['branch'])
