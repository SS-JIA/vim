"""""""""""""""""""""""""""""""""""""""""""""
""		External Dependencies for Plugins		
""""""""""""""""""""""""""""""""""""""""""""
" vim-autopep8 : pip install autopep8
" gutentags    : exuberant ctags (and move .ctags file to ~)

"""""""""""""""""""""""""""""""""""""""""""""
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
set expandtab "convert tabs to spaces
set textwidth=120 "set text width for note taking
set formatoptions-=t "not not automatically format text with textwidth
set mouse=a "allow mouse
autocmd VimEnter * AirlineTheme zenburn
autocmd VimEnter * AirlineToggleWhitespace
set directory=~/tmp "vim swap file directory
set nowrap "do not wrap text
set backspace=2 "make backspace work like other applications
set autoindent "automatically indent new lines
set incsearch "highlight search as I type
let g:airline_powerline_fonts=1 "enable powerline fonts for airline
set encoding=utf-8 "set character encoding
set fillchars+=vert:\ "configure separators
set ttimeoutlen=0 "no delay when pressing escape key
set laststatus=2 "Always display status line
set cinoptions=(0,+1s,:0,=2s,>2s,c1s,g2s,h2s,j1,l1,m1,p2s,t0,u0,w1 "set indent options

"""""""""""""""""""""""""""""""""""""""""""""
"" Colors and Visuals
"""""""""""""""""""""""""""""""""""""""""""""
"Indicate Insert mode
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

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

" Enable magic searches
nnoremap ? ?\v
nnoremap / /\v
cnoremap s/ s/\v

"" Commonly used keys in insert mode
"imap ê (
"imap ë )
"imap ì {
"imap » }
"imap î -
"imap í =
"imap õ [
"imap é ]
"imap ï *
"noremap ê d
"map <M-j> (
"map <A-k> )
"map <A-l> {
"map <A-;> }
"map <A-n> -
"map <A-m> =
"map <A-u> [
"map <A-i> ]
"map <A-o> *
"" Movement
"noremap j h
"noremap k j
"noremap l k
"noremap ; l
"noremap h ;
"map <leader>n $
"map <leader>N ^
"" Buffer
"map <silent> <leader>q; :bnext<CR>
"map <silent> <leader>qj :bprev<CR>
"map <silent> <leader>qd :bp<bar>sp<bar>bn<bar>bd<CR>
"map <silent> <leader>qx :bd<CR>
"map <silent> <leader>qe :BufExplorer<CR>
"" Windows
"map <silent> <leader>j :wincmd h<CR>
"map <silent> <leader>k :wincmd j<CR>
"map <silent> <leader>l :wincmd k<CR>
"map <silent> <leader>; :wincmd l<CR>
"map <silent> <leader>J <C-W>H
"map <silent> <leader>K <C-W>J
"map <silent> <leader>L <C-W>K
"map <silent> <leader>: <C-W>L
"map <silent> <leader>ws <C-W>x
"" File Operations
"map <silent> <leader>m :w<CR>
"map <silent> <leader>M :wall<CR>
"map <silent> <leader>x :q<CR>
"map <silent> <leader>X :qall<CR>
"" EasyMotion
"map <leader><leader>k <Plug>(easymotion-j)
"map <leader><leader>l <Plug>(easymotion-k)
"map s <Plug>(easymotion-s2)
"map f <Plug>(easymotion-fl)
"map F <Plug>(easymotion-Fl)
"map t <Plug>(easymotion-tl)
"map T <Plug>(easymotion-Tl)

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

highlight MatchParen cterm=bold ctermbg=none ctermfg=red

""""""""""""""""""""""""""""""""""""""""""""
""      Wikis
""""""""""""""""""""""""""""""""""""""""""""
let vimwiki={}
let vimwiki.path='/home/stephen/vimwiki/src'
let vimwiki.path_html='/home/stephen/vimwiki/'
let vimwiki.template_path='/home/stephen/vimwiki/templates'
let vimwiki.template_default='default'
let vimwiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
let vimwiki.template_ext='.tpl'
let vimwiki.auto_export=1
let vimwiki.css_name='css/style.css'
let vimwiki.maxhi=1

let schoolnotes={}
let schoolnotes.path='/home/stephen/Documents/SchoolNotes/src'
let schoolnotes.path_html='/home/stephen/Documents/SchoolNotes/'
let schoolnotes.template_path='/home/stephen/Documents/SchoolNotes/'
let schoolnotes.template_default='default'
let schoolnotes.template_ext='.tpl'
let schoolnotes.auto_export=1
let schoolnotes.css_name='css/style.css'

let cvwiki={}
let cvwiki.path='/home/stephen/Projects/Network-of-Autonomous-Vehicles/CVWiki/'
let cvwiki.path_html='/home/stephen/Projects/Network-of-Autonomous-Vehicles/CVWiki/html/'
let cvwiki.index='index'
let cvwiki.template_path='/home/stephen/Projects/Network-of-Autonomous-Vehicles/CVWiki/'
let cvwiki.template_default='format'
let cvwiki.template_ext='.tpl'
let cvwiki.auto_export=1
let g:vimwiki_list = [vimwiki, schoolnotes, cvwiki]

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
