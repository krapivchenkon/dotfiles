" ##### General configuration settings
"
" set encoding
set encoding=utf-8
" disable syntas after columns
set synmaxcol=120
" swap directory instead of saving swaps in the same directory
set dir=~/.vim/.swp/
" set undo directory
set undodir=~/.vim/.undo/
" set backup directory
set bdir=~/.vim/.backup/
" Font configuration
set guifont=Anonymous\ Pro:h14
" set nonumber
set number
" set clipboard to default registry
set clipboard=unnamed
" make delete key work in terminal
set backspace=indent,eol,start
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
" disable complete=preview mainly for YouCompleteMe plugin
set completeopt=menuone
" autosave when :w is executed
set autowrite
set visualbell
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵
" to toggle display:
" set invlist
" to search tabs /\t which will highlight all the tabs
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" Folding
" zf{motion}. fold
" in V mode type zf to fold selection
" zr, zR to open one level of folds or all of them
" zm, zM to close one level of folds or all of them
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
" set foldnestmax=10      " 10 nested fold max
" set foldmethod=indent   " fold based on indent level
" space open/closes folds
nnoremap <space> zA
" folding method will be choosed based on file format
set foldmethod=syntax

" set path to bash environment aliases
let $BASH_ENV = "~/.bash_aliases"
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
Plug 'Xuyuanp/nerdtree-git-plugin'
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
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
 Plug 'Shougo/deoplete.nvim'
 Plug 'roxma/nvim-yarp'
 Plug 'roxma/vim-hug-neovim-rpc'
 Plug 'ddrscott/vim-side-search'
endif
" instead of deoplete YouCompleteMe plugin
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-commentary'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'digitalrounin/vim-yaml-folds'
" disabled for performance in js files Plug 'vim-syntastic/syntastic'
" js plugin
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
" tern server is started when you first open javascript file .js
Plug 'ternjs/tern_for_vim' " don't forget to run: cd ~/.vim/plugged/tern_for_vim/ && npm install

" VimNotes pluggin
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
" typescript syntax files
Plug 'leafgarland/typescript-vim'
" Initialize plugin system
call plug#end()
" ####### END Plugin configuration
set pyxversion=0

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
" Automatically delete the buffer of the file you just deleted with NerdTree
let NERDTreeAutoDeleteBuffer = 1
" Make it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" open NERDTree on Tab
map <Tab> :NERDTreeToggle<CR>
nnoremap <silent> <Leader>s :NERDTreeFind<CR>
"
" ###### END NERDTree configuration 

" ###### Buffer managements configuration
" for help type :help minibufexplorer.text
" show list of all open buffers and switch to selected buffer by ids ID  
nnoremap <Leader>b :ls<CR>:buffer<Space>
" don't open minibuf explorer window by default
let g:miniBufExplAutoStart = 0
" map buffer navigation keys

if has("gui_macvim")
    nnoremap <D-j> :MBEbf<CR>  " next LRU
    nnoremap <D-k> :MBEbb<CR>  " prev LRU
    nnoremap <D-J> :MBEbn<CR> " next
    nnoremap <D-K> :MBEbp<CR> " prev
else
    nnoremap <C-j> :MBEbf<CR>  " next LRU
    nnoremap <C-k> :MBEbb<CR>  " prev LRU
    nnoremap <C-J> :MBEbn<CR> " next
    nnoremap <C-K> :MBEbp<CR> " prev
endif

nnoremap <Leader>d :MBEbd <CR>
"
" ###### END Buffer managements configuration

" ###### Window management
set mousefocus
set mouse=a
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

" ###### GO conf
let g:go_fmt_command = "goimports"
" let g:go_highlight_types = 1
let g:go_highlight_fields = 0
let g:go_highlight_functions = 0
let g:go_highlight_methods = 0
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"
" GoDef:
" place cursor on symbol and:
" - type gd, :GoDef or Ctrl-]
" - to go back :GoDefPop or Ctrl-t
autocmd FileType go noremap <C-]> :GoDef<CR> 
autocmd FileType go noremap <C-o> :GoDefPop<CR> 
if has("gui_macvim")
    " show function declarations in current file
    autocmd FileType go noremap <D-r> :GoDecls<CR> 
    " show function declarations in the current directory
    autocmd FileType go noremap <D-R> :GoDeclsDir<CR> 
else 
    " show function declarations in current file
    autocmd FileType go noremap <C-r> :GoDecls<CR> 
    " show function declarations in the current directory
    autocmd FileType go noremap <C-R> :GoDeclsDir<CR> 
endif
" build and run current file
autocmd FileType go nmap <leader>r  <Plug>(go-run)
let g:go_def_mode = 'godef'
let g:go_decls_includes = "func,type"
" enable autotype information in cmdline:
let g:go_auto_type_info = 1
set updatetime=800
autocmd FileType go nmap <Leader>i <Plug>(go-info)
" Highlight the same identifiers
let g:go_auto_sameids = 1
" remap CtrlP to Cmd-P
let g:ctrlp_map = '<D-p>'
let g:ctrlp_cmd = 'CtrlP'
" Use deoplete.
" let g:deoplete#enable_at_startup = 1
if has("gui_macvim")
    " navigate autocompletion menu using Ctrl-n or Ctrl-j keys
    inoremap <expr> <D-j> pumvisible() ? "\<C-n>" : "\<D-j>"
    inoremap <expr> <D-k> pumvisible() ? "\<C-p>" : "\<D-k>"
else
    " navigate autocompletion menu using Ctrl-n or Ctrl-j keys
    inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
    inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
endif
" ###### END GO conf
autocmd FileType javascript noremap <C-]> :YcmCompleter GoTo<CR> 
" Ctrl-o is already a part of YCM completer
" autocmd FileType js noremap <C-o> :GoDefPop<CR> 
" ###### JS conf
"
" ###### END JS conf
" ###### SideSearch config
" How should we execute the search?
" --heading and --stats are required!
let g:side_search_prg = 'ag --word-regexp'
  \. " --ignore='vendor/*'"
  \. " --heading --stats -B 1 -A 2"

" Can use `vnew` or `new`
let g:side_search_splitter = 'vnew'

" I like 30% splits, change it if you don't
let g:side_search_split_pct = 0.3
" Create an shorter `SS` command
command! -complete=file -nargs=+ SS execute 'SideSearch <args>'
command! -complete=file  Todo execute 'SideSearch "TODO|todo|tood|Todo|TOOD"'
" or command abbreviation
cabbrev SS SideSearch
" ###### END SideSearch config
"
" ###### Text editing configuration
" Moving current or selected lines up or down
nnoremap <S-down> :m .+1<CR>== 
nnoremap <S-up> :m .-2<CR>==
inoremap <S-down> <Esc>:m .+1<CR>==gi
inoremap <S-up> <Esc>:m .-2<CR>==gi
vnoremap <S-down> :m '>+1<CR>gv=gv
vnoremap <S-up> :m '<-2<CR>gv=gv
" Comment/uncomment
" Current plugin works with motions, i.e. gcap will comment paragraph
" gcc - to comment a line
" gc to comment in visual mode
if has("gui_macvim")
    nnoremap <D-/> :Commentary<CR>==
    inoremap <D-/> <Esc>:Commentary<CR>==gi
    vnoremap <D-/> :Commentary<CR>gv==gv
else
    " C-? == Ctrl-Shift-/
    nnoremap <C-?> :Commentary<CR>==
    " Commented as it will make <Del> button in insert mode to comment the
    " line
    " inoremap <C-?> <Esc>:Commentary<CR>==gi
    vnoremap <C-?> :Commentary<CR>gv==gv
endif
" text modification
" ### Concatenate lines:
" Shift+J in normal mode and then 'x' to concatenate line and remove extra
" symbols
" map Ctrl+H to move left and delete the char in insert mode
imap ^H <Left><Del>         

" Markdown preview plugin
let vim_markdown_preview_github=1
" let vim_markdown_preview_hotkey='<D-S-M>' let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_toggle=0
let vim_markdown_preview_browser='Safari'
" if preview didn't toggle, try run :call Vim_Markdown_Preview_Local()
" YAML filetype run YamlFolds on bufenter
" 
" ###### Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'
" ###### END Syntastic config
" ###### Vim Notes config
let g:notes_directories = ['~/Documents/Notes',]
let g:notes_suffix = '.txt'
" ###### END Vim Notes config

" enable tern pluggin
call tern#Enable()
" ###### END Text editing configuration

