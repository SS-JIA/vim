"""""""""""""""""""""""""""""""""""""""""""""
""		External Dependencies for Plugins		
""""""""""""""""""""""""""""""""""""""""""""
" vim-autopep8 : pip install autopep8
" gutentags    : exuberant ctags (and move .ctags file to ~)


execute pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""
""		Basics		
""""""""""""""""""""""""""""""""""""""""""""
set nocompatible "be iMproved, no vi compatibility
filetype plugin indent on "enable indent scripts and filetype plugins
autocmd VimEnter * Helptags "load plugin helptags
syntax enable "enable syntax processing
set rnu "display line numbers
set nu "display line numbers
set t_Co=256 "enable 256 colors in terminal
set guioptions-=T "remove the Toolbar from gvim
set guioptions-=r "remove right hand scrollbar from gvim
set guioptions-=L "remove left hand scrollbar from gvim
set tabstop=4 shiftwidth=4 "make tabs 4 spaces wide
set expandtab "convert tabs to spaces
set textwidth=120 "set text width for note taking
set formatoptions-=t "not not automatically format text with textwidth
set mouse=a "allow mouse
set directory=~/tmp "vim swap file directory
set nowrap "do not wrap text
set backspace=2 "make backspace work like other applications
set autoindent "automatically indent new lines
set incsearch "highlight search as I type
set encoding=utf-8 "set character encoding
set fillchars+=vert:\ "configure separators
set ttimeoutlen=0 "no delay when pressing escape key
set laststatus=2 "Always display status line
set foldmethod=indent "fold by indent level
set cinoptions=(0,+1s,:0,=2s,>2s,c1s,g2s,h2s,j1,l1,m1,p2s,t0,u0,w1 "set indent options
set complete-=i "Prevent autocomplete from looking in included files

"""""""""""""""""""""""""""""""""""""""""""""
"" Visuals
"""""""""""""""""""""""""""""""""""""""""""""
" Configure Airline
autocmd VimEnter * AirlineTheme zenburn
autocmd VimEnter * AirlineToggleWhitespace
let g:airline_powerline_fonts=1 "enable powerline fonts for airline
"Indicate Insert mode
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul
" Colorscheme
colorscheme solarized8_dark
autocmd VimEnter * AirlineTheme solarized
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"""""""""""""""""""""""""""""""""""""""""""""
""		GVIM		
"""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
	set guifont=Roboto\ Mono\ for\ Powerline\ 10.5 "set font for GUI mode
	set lines=999 columns=999 "start in fullscreen
	colorscheme solarized8_dark "set solarized colorscheme
	set background=dark "set light background for solarized
	autocmd VimEnter * AirlineTheme papercolor "Set airlinetheme for GUI
	autocmd VimEnter * NERDTree "start NERDTREE
	autocmd VimEnter * wincmd p "set cursor on main window
endif

""""""""""""""""""""""""""""""""""""""""""""
""		Key Maps		
""""""""""""""""""""""""""""""""""""""""""""
let mapleader=" "
" Search Helpers
nnoremap ? ?\v
nnoremap / /\v
cnoremap /? /\v
cnoremap ?/ ?\v
" Command Mappings
nnoremap <leader>n :ClrSrch<CR>
nnoremap <C-k> :CtrlPTag<CR>

""""""""""""""""""""""""""""""""""""""""""""
""		Commands and Functions
""""""""""""""""""""""""""""""""""""""""""""
function! NumberToggle()
	if (&relativenumber==1)
		set number
	else
		set relativenumber
	endif
endfunc	
command NumberToggle call NumberToggle()

function! Solarize()
	colorscheme solarized
	set background=light 
	autocmd VimEnter * AirlineTheme zenburn
endfunc
command Solarize call Solarize()

function! Industrialize()
	colorscheme industry
	highlight Normal ctermbg=NONE
	highlight NonText ctermbg=NONE
	autocmd VimEnter * AirlineTheme molokai
endfunc
command Industrialize call Industrialize()

function! ClearSearch()
    let @/=''
endfunc
command ClrSrch call ClearSearch()

command! -nargs=1 -range SuperRetab <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g

"Toggle rnu and nornu
command RN set relativenumber!

highlight MatchParen cterm=bold ctermbg=none ctermfg=red

""""""""""""""""""""""""""""""""""""""""""""
""      Wikis
""""""""""""""""""""""""""""""""""""""""""""
let vimwiki={}
let vimwiki.path='/home/stephen/site/src'
let vimwiki.path_html='/home/stephen/site/html'
let vimwiki.template_path='/home/stephen/site/templates'
let vimwiki.template_default='default'
let vimwiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
let vimwiki.template_ext='.tpl'
let vimwiki.auto_export=1
let vimwiki.css_name='css/style.css'
let vimwiki.maxhi=1

let personal={}
let personal.path='/home/stephen/personal/src'
let personal.path_html='/home/stephen/personal/html'
let personal.template_path='/home/stephen/personal/templates'
let personal.template_default='default'
let personal.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
let personal.template_ext='.tpl'
let personal.auto_export=1
let personal.css_name='css/style.css'
let personal.maxhi=1

let g:vimwiki_list = [vimwiki, personal]

function! VimwikiLinkConverter(link, source_wiki_file, target_html_file)
	if a:link =~# '^local:'
	  let link_infos = vimwiki#base#resolve_link(a:link)
	  let html_link = vimwiki#path#relpath(
				\ fnamemodify(a:source_wiki_file, ':h'), link_infos.filename)
	  let relative_link =
				\ fnamemodify(a:target_html_file, ':h') . '/' . html_link
	  call system('cp ' . fnameescape(link_infos.filename) .
				\ ' ' . fnameescape(relative_link))
	  echo html_link
	  return html_link
	endif
	return ''
endfunction
