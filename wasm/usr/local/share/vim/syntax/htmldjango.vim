if exists("b:current_syntax")
finish
endif
if !exists("main_syntax")
let main_syntax = 'html'
endif
runtime! syntax/django.vim
runtime! syntax/html.vim
unlet b:current_syntax
syn cluster djangoBlocks add=djangoTagBlock,djangoVarBlock,djangoComment,djangoComBlock
syn region djangoTagBlock start="{%" end="%}" contains=djangoStatement,djangoFilter,djangoArgument,djangoTagError display containedin=ALLBUT,@djangoBlocks
syn region djangoVarBlock start="{{" end="}}" contains=djangoFilter,djangoArgument,djangoVarError display containedin=ALLBUT,@djangoBlocks
syn region djangoComment start="{%\s*comment\(\s\+.\{-}\)\?%}" end="{%\s*endcomment\s*%}" contains=djangoTodo containedin=ALLBUT,@djangoBlocks
syn region djangoComBlock start="{#" end="#}" contains=djangoTodo containedin=ALLBUT,@djangoBlocks
let b:current_syntax = "htmldjango"
