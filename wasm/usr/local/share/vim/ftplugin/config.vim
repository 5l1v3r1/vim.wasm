if exists("b:did_ftplugin") | finish | endif
let s:save_cpo = &cpo
set cpo-=C
let s:undo_ftplugin = ""
let s:browsefilter = "Bourne Shell Files (*.sh)\t*.sh\n" .
\	 "All Files (*.*)\t*.*\n"
let s:match_words = ""
runtime! ftplugin/sh.vim ftplugin/sh_*.vim ftplugin/sh/*.vim
let b:did_ftplugin = 1
if exists("b:undo_ftplugin")
let s:undo_ftplugin = b:undo_ftplugin
endif
if exists("b:browsefilter")
let s:browsefilter = b:browsefilter
endif
if has("gui_win32")
let  b:browsefilter="Configure Scripts (configure.*, config.*)\tconfigure*;config.*\n" .
\	s:browsefilter
endif
let b:undo_ftplugin = "unlet! b:browsefilter | " . b:undo_ftplugin
let &cpo = s:save_cpo
unlet s:save_cpo
