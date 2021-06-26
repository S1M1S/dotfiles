let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/dotfiles
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 .config/nvim/init.vim
badd +73 .config/nvim/lua_setup.vim
badd +0 .vimrc
argglobal
%argdel
edit .config/nvim/init.vim
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 140 + 210) / 421)
exe '2resize ' . ((&lines * 34 + 35) / 71)
exe 'vert 2resize ' . ((&columns * 140 + 210) / 421)
exe '3resize ' . ((&lines * 33 + 35) / 71)
exe 'vert 3resize ' . ((&columns * 140 + 210) / 421)
exe 'vert 4resize ' . ((&columns * 139 + 210) / 421)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 67 - ((55 * winheight(0) + 34) / 68)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 67
normal! 0
wincmd w
argglobal
if bufexists(".config/nvim/lua_setup.vim") | buffer .config/nvim/lua_setup.vim | else | edit .config/nvim/lua_setup.vim | endif
if &buftype ==# 'terminal'
  silent file .config/nvim/lua_setup.vim
endif
balt .config/nvim/init.vim
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 78 - ((12 * winheight(0) + 17) / 34)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 78
normal! 027|
wincmd w
argglobal
if bufexists("~/.local/share/nvim/plugged/nvim-bufferline.lua/doc/bufferline-lua.txt") | buffer ~/.local/share/nvim/plugged/nvim-bufferline.lua/doc/bufferline-lua.txt | else | edit ~/.local/share/nvim/plugged/nvim-bufferline.lua/doc/bufferline-lua.txt | endif
if &buftype ==# 'terminal'
  silent file ~/.local/share/nvim/plugged/nvim-bufferline.lua/doc/bufferline-lua.txt
endif
balt .config/nvim/lua_setup.vim
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
silent! normal! zE
let &fdl = &fdl
let s:l = 404 - ((31 * winheight(0) + 16) / 33)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 404
normal! 015|
wincmd w
argglobal
if bufexists(".vimrc") | buffer .vimrc | else | edit .vimrc | endif
if &buftype ==# 'terminal'
  silent file .vimrc
endif
balt .config/nvim/lua_setup.vim
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 143 - ((57 * winheight(0) + 34) / 68)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 143
normal! 035|
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 140 + 210) / 421)
exe '2resize ' . ((&lines * 34 + 35) / 71)
exe 'vert 2resize ' . ((&columns * 140 + 210) / 421)
exe '3resize ' . ((&lines * 33 + 35) / 71)
exe 'vert 3resize ' . ((&columns * 140 + 210) / 421)
exe 'vert 4resize ' . ((&columns * 139 + 210) / 421)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0&& getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOF
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
