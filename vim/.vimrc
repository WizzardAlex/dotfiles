" Pulgin's  ====================================================================

set nocompatible
filetype plugin on
" gruvbox error fix, for getting spell check hightlitghting to work again
let g:gruvbox_guisp_fallback = "bg"
syntax enable

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

"TODO FIXA NERDTREE?

"Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'

Plug 'ycm-core/YouCompleteMe', { 'for': ['python','c','lua']}

Plug 'vim-syntastic/syntastic'
Plug 'morhetz/gruvbox'

"Zettlekasten
Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'michal-h21/vim-zettel'

call plug#end()

" Settings ==================================================================

syntax on			" turn on syntax highlighting

set hidden			" allows reuse the same window
set encoding=utf-8		" set encoding
set autoindent
set shiftwidth=4		" Number of autoindent spaces
set smartindent
set smarttab
set breakindent			" indent line wraps
set scrolloff=2                 " always show at least one line abo/below cursor

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

set noswapfile			" no swap files
set smartcase			" only use case sensitive search when uppercase
set showmatch			" show matching brackets
set history=1000
set undolevels=1000
set visualbell			
set noerrorbells		" turns of the beep
set backspace=indent,eol,start	" allows backspace over autoindent etc
set ttyfast                     " speeds up scrolling

set updatetime=100              " default 4000 ms = 4 s, is noticeable
set cursorline                  " highlights the cursorline
set t_Co=256			" for the colorschemes
set wildmenu
set mouse=a                     " Enable mouse for scrolling and resizing

set confirm                     " Confirm when closing an unsaved file

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

"setlocal foldmethod=manual

" ** ctags **
set tags+=./tags;,tags
" Generates ctags silently
nnoremap <Leader>tt :silent !ctags -R ~/Documents/notes/ <CR> :redraw! <CR>
" Go to index of notes and set working directory to my notes
nnoremap <leader>ni :e $NOTES_DIR/index.md<CR>:cd $NOTES_DIR<CR>

" *** Spell Checking ***
" zg = 'adds the selected word to the dictionary' , zw = 'marks words as incorrect'
" Toggle SpellCheck
map <Leader>sc :setlocal spell!<CR>

" Shortcuts using <Leader>
map <C-n> ]s
map <Leader>sb [s
map <Leader>s? z=


" set local language
nmap <Leader>ss :setlocal spell! spelllang=sv<CR>
nmap <Leader>se :setlocal spell! spelllang=en<CR>

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
  \ 'template_default': 'markdown',
  \ 'custom_wiki2html': '~/Documents/notes/wiki2html.sh',
  \ 'template_ext': '.html',
  \ 'syntax' :'markdown', 
  \ 'ext': '.md' 
  \ }]

"au FileType markdown set ft=markdown
nnoremap <C-Space> :VimwikiToggleListItem<CR>

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
"let g:tex_flavor='latex'
"let g:vimtex_view_method='zathura'
"let g:vimtex_quickfix_mode=0
"set conceallevel=1
"let g:tex_conceal='abdmg'

" Snippets =================================================================
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" YouCompleteMe  ============================================================

let g:ycm_filetype_blacklist = { 'man': 1, 
                                \ 'manpage':1,
                                \ 'markdown': 1, 
                                \ 'vimwiki': 1 }
let g:ycm_show_diagnostics_ui = 0       " Lets syntastic checkers run with YCM

" Syntastic ================================================================
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

au FileType tex let g:syntastic_auto_loc_list = 0
au FileType tex let g:syntastic_check_on_open  = 0

" Zettlekasten ==============================================================
" let g:nv_search_paths = ['~/Documents/notes']
" let g:nv_default_extension = '.md'
" let g:zettel_format = "%title-%H%M-%d%m%y"
" let g:zettel_link_format = "[%title](%link)"

" Alacritty mouse fix =======================================================
set ttymouse=sgr
