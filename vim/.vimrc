" Pulgin's  ====================================================================


" vim-plug auto-intsall
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs 
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  au VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugins')

Plug 'vimwiki/vimwiki', { 'branch' : 'dev'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() },
      \ 'for': ['markdown', 'vim-plug']}

" Vim Plugin for Lively Previewing LaTeX PDF Output
"Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

"TODO FIXA NERDTREE?

Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'

Plug 'ycm-core/YouCompleteMe'
Plug 'vim-syntastic/syntastic'
Plug 'morhetz/gruvbox'

call plug#end()

" Settings ==================================================================

set nocompatible
filetype plugin on
syntax on			" turn on syntax highlighting

set hidden			" allows reuse the same window
set encoding=utf-8		" set encoding
set autoindent
set shiftwidth=4		" Number of autoindent spaces
set smartindent
set smarttab
set breakindent			" indent line wraps

set rnu				" set relative line number
set nu
set ruler			" Show row and column info
set autoread			" auto read files changed outside vim	
set clipboard=unnamedplus	" use the system clipboard
set colorcolumn=81		" highlight max column length
set expandtab			" tabs to spaces
set hlsearch			" highlight search query
set incsearch			" highlight when typing
set ignorecase			" case insensitive searching
set linebreak			" break on word boundaries

set nobackup			" no backup files
set noswapfile			" no swap files
set smartcase			" only use case sensitive search when uppercase
set showmatch			" show matching brackets
set scrolloff=4			" lines off to keep of the edge of the screen
set history=1000
set undolevels=1000
set visualbell			
set noerrorbells		" turns of the beep
set backspace=indent,eol,start	" allows backspace over autoindent etc
set ttyfast                     " speeds up scrolling

set updatetime=100              " default 4000 ms = 4 s, is noticeable
set cursorline                  " highlights the cursorline
set t_Co=256			" for the colorscheme Zenburn
"colors zenburn

" removes white space at boot, for c and python files
au FileType python,c au BufWritePre <buffer> %s/\s\+$//e

" Theme  ====================================================================

"colors zenburn
colors gruvbox
set background=dark

" Keybindings ===============================================================

set pastetoggle=<F2>		" toggle between 'paste' and 'nopaste'
map <F8> :make <CR>
au FileType c map <F9> :! ./%<  <CR>
au FileType python map <F9> :w <CR> :! python3 %  <CR>
				" acts like 'D' and 'C' instead of 'yy'
map Y y$			
let mapleader = ","

setlocal foldmethod=manual

" *** Spell Checking ***

" Toggle SpellCheck
map <Leader>sc :setlocal spell!<CR>

" Shortcuts using <Leader>
map <Leader>sn ]s
map <Leader>sb [s
map <Leader>s? z=

" set local language
nmap <Leader>ss :setlocal spell! spelllang=sv_se<CR>
nmap <Leader>se :setlocal spell! spelllang=en_uk<CR>

" FileExplorer Settings (nerdtree subsitute) ================================
let g:newtrw_banner = 0
let g:newtrw_keepdir = 0 
let g:newtrw_liststyle = 1" or 3
let g:newtrw_sort_options = 'i'

nmap <Leader>e :Lexplore<CR>

" VimWiki ===================================================================
"  \ 'auto_export': 1, inställning som sparar ändringar i _site
let g:vimwiki_list = [{ 
  \ 'automatic_nested_syntaxes': 1,
  \ 'path': '~/Documents/notes/', 
  \ 'path_html': '~/Documents/notes/_site/',
  \ 'template_path': '~/Documents/notes/_site/templates/',
  \ 'custom_wiki2html': '~/Documents/notes/wiki2html.sh',
  \ 'template_default': 'markdown',
  \ 'template_ext': '.html',
  \ 'syntax' :'markdown', 
  \ 'ext': '.md' 
  \ }]

"au FileType markdown set ft=markdown
"au FileType vimwiki set colorcolumn=0

" Transform to html keyBindings
nmap <silent> <leader>wb :Vimwiki2HTMLBrowse<CR>

" Powerline =================================================================

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

set laststatus=2


" Markdown-Preview =========================================================

let g:mkdp_browser = 'firefox'
let g:mkdp_auto_close = 0
let g:mkdp_preview_options = {
  \ 'katex': {},
  \ }

nmap <leader>p <Plug>MarkdownPreview

" Vim-Tex ==================================================================

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" Snippets =================================================================

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" LaTeX-Preview ============================================================

"let g:livepreview_use_biber=1

" Syntastic ================================================================

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

au FileType tex let g:syntastic_auto_loc_list = 0
au FileType tex let g:syntastic_check_on_open  = 0

" YouCompleteMe  ============================================================

let g:ycm_show_diagnostics_ui = 0       " Lets syntastic checkers run with YCM
