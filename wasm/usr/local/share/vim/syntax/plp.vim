if exists("b:current_syntax")
finish
endif
if !exists("main_syntax")
let main_syntax = 'perlscript'
endif
runtime! syntax/html.vim
unlet b:current_syntax
syn include @PLPperl syntax/perl.vim
syn cluster htmlPreproc add=PLPperlblock
syn keyword perlControl PLP_END
syn keyword perlStatementInclude include Include
syn keyword perlStatementFiles ReadFile WriteFile Counter
syn keyword perlStatementScalar Entity AutoURL DecodeURI EncodeURI
syn cluster PLPperlcode contains=perlStatement.*,perlFunction,perlOperator,perlVarPlain,perlVarNotInMatches,perlShellCommand,perlFloat,perlNumber,perlStringUnexpanded,perlString,perlQQ,perlControl,perlConditional,perlRepeat,perlComment,perlPOD,perlHereDoc,perlPackageDecl,perlElseIfError,perlFiledescRead,perlMatch
syn region  PLPperlblock keepend matchgroup=Delimiter start=+<:=\=+ end=+:>+ transparent contains=@PLPperlcode
syn region  PLPinclude keepend matchgroup=Delimiter start=+<(+ end=+)>+
let b:current_syntax = "plp"
