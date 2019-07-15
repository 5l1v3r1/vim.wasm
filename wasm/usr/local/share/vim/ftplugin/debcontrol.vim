if exists('b:did_ftplugin')
finish
endif
let b:did_ftplugin=1
if exists('g:debcontrol_fold_enable')
setlocal foldmethod=expr
setlocal foldexpr=DebControlFold(v:lnum)
setlocal foldtext=DebControlFoldText()
endif
setlocal textwidth=0
let b:undo_ftplugin = 'setlocal tw< foldmethod< foldexpr< foldtext<'
function! s:getField(f, lnum)
let line = getline(a:lnum)
let fwdsteps = 0
while line !~ '^'.a:f.':'
let fwdsteps += 1
let line = getline(a:lnum + fwdsteps)
if line ==# ''
return 'unknown'
endif
endwhile
return substitute(line, '^'.a:f.': *', '', '')
endfunction
function! DebControlFoldText()
if v:folddashes ==# '-'  " debcontrol entry fold
let type = substitute(getline(v:foldstart), ':.*', '', '')
if type ==# 'Source'
let ftext = substitute(foldtext(), ' *Source: *', ' ', '')
return ftext . ' -- ' . s:getField('Maintainer', v:foldstart) . ' '
endif
let arch  = s:getField('Architecture', v:foldstart)
let ftext = substitute(foldtext(), ' *Package: *', ' [' . arch . '] ', '')
return ftext . ': ' . s:getField('Description', v:foldstart) . ' '
endif
return foldtext()
endfunction
function! DebControlFold(l)
if getline(a:l) =~# '^Source:'
return '>1'
endif
if getline(a:l) =~# '^Package:'
return '>1'
endif
return '='
endfunction
