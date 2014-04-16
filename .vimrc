" http://stackoverflow.com/questions/164847/what-is-in-your-vimrc
" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Don’t add empty newlines at the end of files
set binary
set noeol
" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
"set exrc
"set secure
" Enable line numbers
set number
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Big history
set history=1000
" do not store global and local values in a session
" http://stackoverflow.com/questions/1642611/how-to-save-a-session-in-vim
set ssop-=options

" http://www.vim.org/scripts/script.php?script_id=365
" http://www.thegeekstuff.com/2009/02/make-vim-as-your-bash-ide-using-bash-support-plugin
" bash-support
let g:BASH_AuthorName   = $LOGNAME
let g:BASH_Email        = $USERMAIL

" Multiple vim configurations
" http://stackoverflow.com/questions/1889602/multiple-vim-configurations
function! CheckCustomConfiguration()
	let this_dir=expand('%:p:h')
	let custom_conf=escape(this_dir.'/.vim', ' \')
	if (filereadable(custom_conf))
		execute "source " . custom_conf
	endif

	au BufNewFile,BufRead *.tex call CheckCustomConfiguration()	
endfunction

augroup vimrc_CheckCustomConfiguration
	let this_dir=expand('%:p:h')
	let custom_conf=escape(this_dir.'/.vim', ' \')
	if (filereadable(custom_conf))
		execute "source " . custom_conf
	endif
augroup END

augroup vimrc_swapsbackups
  " Centralize backups, swapfiles and undo history
  set backup
  set backupdir=~/.vim/backup,.,/tmp
  set directory=~/.vim/swap,/tmp

  " Incremental Backups
  " http://vimdoc.sourceforge.net/htmldoc/options.html#'backupext'
  au BufWritePre * let &bex = '-' . strftime("%y%m%d-%Hh%M") . '~'

  set undodir=~/.vim/undo
  set undofile
augroup END

augroup vimrc_highlights
  " Enable syntax highlighting
  syntax on
  " Highlight current line
  set cursorline

  " http://stackoverflow.com/questions/1551231/highlight-variable-under-cursor-in-vim-like-in-netbeans
  autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

  " Show the cursor position
  set ruler
augroup END

augroup vimrc_search
  " Highlight searches
  set hlsearch
  " Ignore case of searches
  set ignorecase
  " Highlight dynamically as pattern is typed
  set incsearch
  " http://stackoverflow.com/questions/657447/vim-clear-last-search-highlighting
  nnoremap <silent> <Esc> :noh<CR><Esc>
augroup END

augroup vimrc_textoutlook
  " Make tabs as wide as four spaces
  set tabstop=4
  " size of an indent"
  set shiftwidth=4
  " Show “invisible” characters
  set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
  set list
  set iskeyword+=.
  " http://stackoverflow.com/questions/235439/vim-80-column-layout-concerns
  if exists('+colorcolumn')
    set colorcolumn=81
  else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>81v.\+', -1)
  endif
augroup END

augroup vimrc_behavior
  " Start scrolling three lines before the horizontal window border
  set scrolloff=3
augroup END

augroup vimrc_statusline
  " Always show status line
  set laststatus=2

  " show character code
  set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
  set statusline +=\ %0*0x%04B\ %*
augroup END

augroup vimrc_REFINEME
" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction

noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
endif

filetype off " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
" ...
filetype plugin indent on " required!
"
" Brief help
" :BundleList - list configured bundles
" :BundleInstall(!) - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!) - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
" https://github.com/Chiel92/vim-autoformat
Bundle "Chiel92/vim-autoformat"

filetype plugin on

" http://blog.ezyang.com/2010/03/vim-textwidth/
"augroup vimrc_matchoverlength
"  autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
"  autocmd CursorMovedI * match OverLength /\%81v.*/
"  set tw=0
"augroup END
augroup END

augroup vimrc_filetype
	"  au BufNewFile,BufRead *.sty set filetype=texsty | set foldmethod=syntax
	"  au BufNewFile,BufRead *.sty set filetype=tex | set foldmethod=syntax
	au FileType c set lcs=tab:\ \ ,trail:· | set autoread
	au FileType cpp set lcs=tab:\ \ ,trail:· | set autoread
"	au FileType java unmap <silent> <F6>

	" set up syntax folding automatically for XML files
	let g:xml_syntax_folding=1
	au FileType xml setlocal foldmethod=syntax
augroup END

augroup vimrc_clangscrathremove
	" Automatically remove the preview window after autocompletion
	" http://stackoverflow.com/questions/3105307/how-do-you-automatically-remove-the-preview-window-after-autocompletion-in-vim
	autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
	autocmd InsertLeave * if pumvisible() == 0|pclose|endif
augroup END

augroup vimrc_cscope
if has('cscope')
	set cscopetag cscopeverbose

	if has('quickfix')
		set cscopequickfix=s-,c-,d-,i-,t-,e-
	endif

	cnoreabbrev csa cs add
	cnoreabbrev csf cs find
	cnoreabbrev csk cs kill
	cnoreabbrev csr cs reset
	cnoreabbrev css cs show
	cnoreabbrev csh cs help

	command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
endif
augroup END

augroup vimrc_plugins
  let g:vimwiki_list = [{'path': '~/Documents/Dropbox/vimwiki/',
  			\ 'path_html': '~/Documents/Dropbox/vimwiki/html/'}]

  let g:C_UseTool_cmake = 'yes'
  let g:C_UseTool_doxygen = 'yes'
augroup END

augroup vimrc_tex
	"let tlist_texsty_settings = 'texsty;y:pgflayers;o:nodes;h:lengths;m:pgfmacros;s:tikzstyles;e:environments;c:comments;n:newcommands;t:counters;d:defs;g:global defs;f:edefs;x:global edefs;l:lets;a:csnames'
	let tlist_tex_settings = 'tex;d:definitions;l:labels;s:sections;e:environments'
	let g:tex_indent_items = 1

	" http://vim-latex.sourceforge.net/documentation/latex-suite/latex-completion.html
	set grepprg=grep\ -nH\ $*

	" from *ls_1*
	filetype indent on
	let g:tex_flavor='latex'
augroup END

augroup vimrc_tags
  set tags=./tags;/
  let Tlist_Auto_Open = 1
  let Tlist_Compact_Format = 1
augroup END

" mappings

" https://github.com/fholgado/minibufexpl.vim
let g:miniBufExplCycleArround = 1
noremap <silent> <C-Tab> :MBEbf<CR>
noremap <silent> <C-S-Tab> :MBEbb<CR>
inoremap <silent> <C-Tab> <esc>:MBEbf<CR>i
inoremap <silent> <C-S-Tab> <esc>:MBEbb<CR>i

map <C-w><C-w> :Kwbd<CR>

map <F4> :vertical resize 87<CR>

" autoformat for C
map <silent> <F6> :!indent %<CR><Esc>

map <F8> :TlistToggle<CR>
map <A-F8> :TagbarToggle<CR>
map <F10> :edit ./.vim<CR>
map <A-F10> :edit ~/.vimrc<CR>
map <C-F10> :so ./.vim<CR>
map <C-s> :w<CR>
map! <C-s> <Esc>:w<CR>

" run it sometimes
" helptags ~/.vim/doc
