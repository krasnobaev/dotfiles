" Use the excellent Railscat theme by Jeff Kreeftmeijer (gVim-only)
colorscheme railscat
" Use 14pt Menlo
if has("gui_gtk2")
"    set guifont=Consolas\ 10 "
    set guifont=Droid\ Sans\ Mono
elseif has("gui_macvim")
    set guifont=Consolas:h11
elseif has("gui_win32")
    set guifont=Consolas:h10
end
" Better line-height
set linespace=1

