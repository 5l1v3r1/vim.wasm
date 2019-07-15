if exists("b:did_ftplugin")
finish
endif
let b:did_ftplugin = 1
let s:cpo_save = &cpo
set cpo&vim
if !exists('current_compiler')
compiler context
endif
let b:undo_ftplugin = "setl com< cms< def< inc< sua< fo< ofu<"
\ . "| unlet! b:match_ignorecase b:match_words b:match_skip"
setlocal comments=b:%D,b:%C,b:%M,:% commentstring=%\ %s formatoptions+=tjcroql2
if get(b:, 'context_metapost', get(g:, 'context_metapost', 1))
setlocal omnifunc=contextcomplete#Complete
let g:omni_syntax_group_include_context = 'mf\w\+,mp\w\+'
let g:omni_syntax_group_exclude_context = 'mfTodoComment'
endif
let &l:define='\\\%([egx]\|char\|mathchar\|count\|dimen\|muskip\|skip\|toks\)\='
\ .     'def\|\\font\|\\\%(future\)\=let'
\ . '\|\\new\%(count\|dimen\|skip\|muskip\|box\|toks\|read\|write'
\ .     '\|fam\|insert\|if\)'
let &l:include = '^\s*\\\%(input\|component\|product\|project\|environment\)'
setlocal suffixesadd=.tex
if exists("loaded_matchit")
let b:match_ignorecase = 0
let b:match_skip = 'r:\\\@<!\%(\\\\\)*%'
let b:match_words = '(:),\[:],{:},\\(:\\),\\\[:\\],' .
\ '\\start\(\a\+\):\\stop\1'
endif
let s:context_regex = {
\ 'beginsection' : '\\\%(start\)\=\%(\%(sub\)*section\|\%(sub\)*subject\|chapter\|part\|component\|product\|title\)\>',
\ 'endsection'   : '\\\%(stop\)\=\%(\%(sub\)*section\|\%(sub\)*subject\|chapter\|part\|component\|product\|title\)\>',
\ 'beginblock'   : '\\\%(start\|setup\|define\)',
\ 'endblock'     : '\\\%(stop\|setup\|define\)'
\ }
function! s:move_around(count, what, flags, visual)
if a:visual
exe "normal! gv"
endif
call search(s:context_regex[a:what], a:flags.'s') " 's' sets previous context mark
call map(range(2, a:count), 'search(s:context_regex[a:what], a:flags)')
endfunction
nnoremap <silent><buffer> [[ :<C-U>call <SID>move_around(v:count1, "beginsection", "bW", v:false) <CR>
vnoremap <silent><buffer> [[ :<C-U>call <SID>move_around(v:count1, "beginsection", "bW", v:true)  <CR>
nnoremap <silent><buffer> ]] :<C-U>call <SID>move_around(v:count1, "beginsection", "W",  v:false) <CR>
vnoremap <silent><buffer> ]] :<C-U>call <SID>move_around(v:count1, "beginsection", "W",  v:true)  <CR>
nnoremap <silent><buffer> [] :<C-U>call <SID>move_around(v:count1, "endsection",   "bW", v:false) <CR>
vnoremap <silent><buffer> [] :<C-U>call <SID>move_around(v:count1, "endsection",   "bW", v:true)  <CR>
nnoremap <silent><buffer> ][ :<C-U>call <SID>move_around(v:count1, "endsection",   "W",  v:false) <CR>
vnoremap <silent><buffer> ][ :<C-U>call <SID>move_around(v:count1, "endsection",   "W",  v:true)  <CR>
nnoremap <silent><buffer> [{ :<C-U>call <SID>move_around(v:count1, "beginblock",   "bW", v:false) <CR>
vnoremap <silent><buffer> [{ :<C-U>call <SID>move_around(v:count1, "beginblock",   "bW", v:true)  <CR>
nnoremap <silent><buffer> ]} :<C-U>call <SID>move_around(v:count1, "endblock",     "W",  v:false) <CR>
vnoremap <silent><buffer> ]} :<C-U>call <SID>move_around(v:count1, "endblock",     "W",  v:true)  <CR>
if get(g:, 'context_mappings', 1)
let s:tp_regex = '?^$\|^\s*\\\(item\|start\|stop\|blank\|\%(sub\)*section\|chapter\|\%(sub\)*subject\|title\|part\)'
fun! s:tp()
call cursor(search(s:tp_regex, 'bcW') + 1, 1)
normal! V
call cursor(search(s:tp_regex, 'W') - 1, 1)
endf
onoremap <silent><buffer> tp :<c-u>call <sid>tp()<cr>
vnoremap <silent><buffer> tp <esc>:<c-u>call <sid>tp()<cr>
onoremap <silent><buffer> i$ :<c-u>normal! T$vt$<cr>
onoremap <silent><buffer> a$ :<c-u>normal! F$vf$<cr>
vnoremap <buffer> i$ T$ot$
vnoremap <buffer> a$ F$of$
endif
command! -buffer -nargs=? -complete=file ConTeXt          call context#typeset(<q-args>)
command!         -nargs=0                ConTeXtJobStatus call context#job_status()
command!         -nargs=0                ConTeXtStopJobs  call context#stop_jobs()
let &cpo = s:cpo_save
unlet s:cpo_save
