if exists("b:did_indent")
finish
endif
let b:did_indent = 1
setlocal indentexpr=GetXF86ConfIndent()
setlocal indentkeys=!^F,o,O,=End
setlocal nosmartindent
if exists("*GetXF86ConfIndent")
finish
endif
function GetXF86ConfIndent()
let lnum = prevnonblank(v:lnum - 1)
if lnum == 0
return 0
endif
let ind = indent(lnum)
if getline(lnum) =~? '^\s*\(Sub\)\=Section\>'
let ind = ind + shiftwidth()
endif
if getline(v:lnum) =~? '^\s*End\(Sub\)\=Section\>'
let ind = ind - shiftwidth()
endif
return ind
endfunction
