""""""""""""""""""""""""""""""""""""""""""""
""		Basics		
""""""""""""""""""""""""""""""""""""""""""""
set nocompatible "be iMproved, no vi compatibility
filetype plugin indent on "enable indent scripts and filetype plugins
execute pathogen#infect()
autocmd VimEnter * Helptags "load plugin helptags
syntax enable "enable syntax processing
set rnu "display line numbers
set t_Co=256 "enable 256 colors in terminal
set guioptions-=T "remove the Toolbar from gvim
set guioptions-=r "remove right hand scrollbar from gvim
set guioptions-=L "remove left hand scrollbar from gvim
set tabstop=4 shiftwidth=4 "make tabs 4 spaces wide
"set expandtab "convert tabs to spaces
set textwidth=80 "set text width for note taking
set formatoptions-=t "not not automatically format text with textwidht
set mouse=a "allow mouse
autocmd VimEnter * AirlineTheme molokai
autocmd VimEnter * AirlineToggleWhitespace
set directory=~/tmp "vim swap file directory
set nowrap "do not wrap text
set backspace=2 "make backspace work like other applications
let g:airline_powerline_fonts=1 "enable powerline fonts for airline
set encoding=utf-8 "set character encoding
set guifont=Roboto\ Mono\ for\ Powerline\ 11 "set font
set fillchars+=vert:\ "configure separators
set ttimeoutlen=0 "no delay when pressing escape key
set laststatus=2 "Always display status line

"""""""""""""""""""""""""""""""""""""""""""""
"" Colors and Visuals
"""""""""""""""""""""""""""""""""""""""""""""
colorscheme industry
highlight Normal ctermbg=NONE
highlight NonText ctermbg=NONE

"Indicate Insert mode
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

"Change cursorline color

"""""""""""""""""""""""""""""""""""""""""""""
""		GVIM		
"""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
	set lines=999 columns=999 "start in fullscreen
	colorscheme solarized "set solarized colorscheme
	autocmd VimEnter * NERDTree "start NERDTREE
	autocmd VimEnter * wincmd p "set cursor on main window
endif

""""""""""""""""""""""""""""""""""""""""""""
""		Key Maps		
""""""""""""""""""""""""""""""""""""""""""""
let mapleader=" "
" Commonly used keys in insert mode
imap ê (
imap ë )
imap ì {
imap » }
imap î -
imap í =
imap õ [
imap é ]
imap ï *
noremap ê d
map <M-j> (
map <A-k> )
map <A-l> {
map <A-;> }
map <A-n> -
map <A-m> =
map <A-u> [
map <A-i> ]
map <A-o> *
" Movement
noremap j h
noremap k j
noremap l k
noremap ; l
noremap h ;
map <leader>n $
map <leader>N ^
" Buffer
map <silent> <leader>q; :bnext<CR>
map <silent> <leader>qj :bprev<CR>
map <silent> <leader>qd :bp<bar>sp<bar>bn<bar>bd<CR>
map <silent> <leader>qx :bd<CR>
map <silent> <leader>qe :BufExplorer<CR>
" Windows
map <silent> <leader>j :wincmd h<CR>
map <silent> <leader>k :wincmd j<CR>
map <silent> <leader>l :wincmd k<CR>
map <silent> <leader>; :wincmd l<CR>
map <silent> <leader>J <C-W>H
map <silent> <leader>K <C-W>J
map <silent> <leader>L <C-W>K
map <silent> <leader>: <C-W>L
map <silent> <leader>ws <C-W>x
" File Operations
map <silent> <leader>m :w<CR>
map <silent> <leader>M :wall<CR>
map <silent> <leader>x :q<CR>
map <silent> <leader>X :qall<CR>

""""""""""""""""""""""""""""""""""""""""""""
""		Functions
""""""""""""""""""""""""""""""""""""""""""""
function! NumberToggle()
	if (&relativenumber==1)
		set number
	else
		set relativenumber
	endif
endfunc	

""""""""""""""""""""""""""""""""""""""""""""
""      Wikis
""""""""""""""""""""""""""""""""""""""""""""
let vimwiki={}
let vimwiki.path='/home/stephen/vimwiki'
let vimwiki.path_html='/home/stephen/vimwiki/html/'
let vimwiki.template_path='/home/stephen/vimwiki/'
let vimwiki.template_default='default'
let vimwiki.template_ext='.tpl'
let vimwiki.auto_export=0
let vimwiki.css_name='css/style.css'
let cvwiki={}
let cvwiki.path='/home/stephen/Projects/Network-of-Autonomous-Vehicles/CVWiki/'
let cvwiki.path_html='/home/stephen/Projects/Network-of-Autonomous-Vehicles/CVWiki/html/'
let cvwiki.index='index'
let cvwiki.template_path='/home/stephen/Projects/Network-of-Autonomous-Vehicles/CVWiki/'
let cvwiki.template_default='format'
let cvwiki.template_ext='.tpl'
let cvwiki.auto_export=1
let g:vimwiki_list = [vimwiki, cvwiki]
