if exists("b:current_syntax")
finish
endif
let s:cpo_save = &cpo
set cpo&vim
syntax sync fromstart
syn match   gitoliteGroup           '@\S\+'
syn match   gitoliteComment         '#.*' contains=gitoliteTodo
syn keyword gitoliteTodo            TODO FIXME XXX NOT contained
syn match   gitoliteRepoError       '^\s*repo.*='
syn match   gitoliteRepoError       '^\s*\S\+\s*='  " this gets overridden later when first word is a perm, don't worry
syn match   gitoliteGroupLine       '^\s*@\S\+\s*=\s*\S.*$' contains=gitoliteGroup,gitoliteComment
syn match   gitoliteRepoLine        '^\s*repo\s\+[^=]*$' contains=gitoliteRepo,gitoliteGroup,gitoliteComment
syn keyword gitoliteRepo            repo contained
syn keyword gitoliteSpecialRepo     CREATOR
syn match   gitoliteRuleLine        '^\s*\(-\|C\|R\|RW+\?C\?D\?\)\s[^#]*' contains=gitoliteRule,gitoliteCreateRule,gitoliteDenyRule,gitoliteRefex,gitoliteUsers,gitoliteGroup
syn match   gitoliteRule            '\(^\s*\)\@<=\(-\|C\|R\|RW+\?C\?D\?\)\s\@=' contained
syn match   gitoliteRefex           '\(^\s*\(-\|R\|RW+\?C\?D\?\)\s\+\)\@<=\S.\{-}\(\s*=\)\@=' contains=gitoliteSpecialRefex
syn match   gitoliteSpecialRefex    'NAME/'
syn match   gitoliteSpecialRefex    '/USER/'
syn match   gitoliteCreateRule      '\(^\s*C\s.*=\s*\)\@<=\S[^#]*[^# ]' contained contains=gitoliteGroup
syn match   gitoliteDenyRule        '\(^\s*-\s.*=\s*\)\@<=\S[^#]*[^# ]' contained
syn match   gitoliteConfigLine      '^\s*\(config\|option\|include\|subconf\)\s[^#]*' contains=gitoliteConfigKW,gitoliteConfigKey,gitoliteConfigVal,gitoliteComment
syn keyword gitoliteConfigKW        config option include subconf contained
syn match   gitoliteConfigKey       '\(\(config\|option\)\s\+\)\@<=[^ =]*' contained
syn match   gitoliteConfigVal       '\(=\s*\)\@<=\S.*' contained
syn region  gitoliteTemplateLine    matchgroup=PreProc start='^=begin template-data$' end='^=end$' contains=gitoliteTplRepoLine,gitoliteTplRoleLine,gitoliteGroup,gitoliteComment,gitoliteTplError
syn match   gitoliteTplRepoLine     '^\s*repo\s\+\S.*=.*' contained contains=gitoliteTplRepo,gitoliteTplTemplates,gitoliteGroup
syn keyword gitoliteTplRepo         repo contained
syn match   gitoliteTplTemplates    '\(=\s*\)\@<=\S.*' contained contains=gitoliteGroup,gitoliteComment
syn match   gitoliteTplRoleLine     '^\s*\S\+\s*=\s*.*' contained contains=gitoliteTplRole,gitoliteGroup,gitoliteComment
syn match   gitoliteTplRole         '\S\+\s*='he=e-1 contained
syn match   gitoliteTplError        '^\s*repo[^=]*$' contained
syn match   gitoliteTplError        '^\s*\(-\|R\|RW+\?C\?D\?\)\s'he=e-1 contained
syn match   gitoliteTplError        '^\s*\(config\|option\|include\|subconf\)\s'he=e-1 contained
syn match   gitoliteTplError        '^\s*@\S\+\s*=' contained contains=NONE
hi def link gitoliteGroup           Identifier
hi def link gitoliteComment         Comment
hi def link gitoliteTodo            ToDo
hi def link gitoliteRepoError       Error
hi def link gitoliteGroupLine       PreProc
hi def link gitoliteRepo            Keyword
hi def link gitoliteSpecialRepo     PreProc
hi def link gitoliteRule            Keyword
hi def link gitoliteCreateRule      PreProc
hi def link gitoliteDenyRule        WarningMsg
hi def link gitoliteRefex           Constant
hi def link gitoliteSpecialRefex    PreProc
hi def link gitoliteConfigKW        Keyword
hi def link gitoliteConfigKey       Identifier
hi def link gitoliteConfigVal       String
hi def link gitoliteTplRepo         Keyword
hi def link gitoliteTplTemplates    Constant
hi def link gitoliteTplRole         Constant
hi def link gitoliteTplError        Error
let b:current_syntax = "gitolite"
let &cpo = s:cpo_save
unlet s:cpo_save
