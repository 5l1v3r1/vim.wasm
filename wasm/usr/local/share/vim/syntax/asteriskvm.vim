if exists("b:current_syntax")
finish
endif
syn sync clear
syn sync fromstart
syn keyword     asteriskvmTodo    TODO contained
syn match       asteriskvmComment         ";.*" contains=asteriskvmTodo
syn match       asteriskvmContext         "\[.\{-}\]"
syn match       asteriskvmZone            "^[[:alnum:]]\+\s*=>\?\s*[[:alnum:]/_]\+|.*$" contains=zoneName,zoneDef
syn match       zoneName                "=\zs[[:alnum:]/_]\+\ze" contained
syn match       zoneDef                 "|\zs.*\ze$" contained
syn match       asteriskvmSetting         "\<\(format\|serveremail\|minmessage\|maxmessage\|maxgreet\|skipms\|maxsilence\|silencethreshold\|maxlogins\)="
syn match       asteriskvmSetting         "\<\(externnotify\|externpass\|directoryintro\|charset\|adsi\(fdn\|sec\|ver\)\|\(pager\)\?fromstring\|email\(subject\|body\|cmd\)\|tz\|cidinternalcontexts\|saydurationm\|dialout\|callback\)="
syn match       asteriskvmSettingBool     "\<\(attach\|pbxskip\|usedirectory\|saycid\|sayduration\|sendvoicemail\|review\|operator\|envelope\|delete\|nextaftercmd\|forcename\|forcegreeting\)=\(yes\|no\|1\|0\|true\|false\|t\|f\)"
syn match       asteriskvmMailbox         "^[[:digit:]]\+\s*=>\?\s*[[:digit:]]\+\(,[^,]*\(,[^,]*\(,[^,]*\(,[^,]*\)\?\)\?\)\?\)\?" contains=mailboxEmail,asteriskvmSetting,asteriskvmSettingBool,comma
syn match       mailboxEmail            ",\zs[^@=,]*@[[:alnum:]\-\.]\+\.[[:alpha:]]\{2,10}\ze" contains=comma
syn match       comma                   "[,|]" contained
hi def link        asteriskvmComment Comment
hi def link        asteriskvmContext         Identifier
hi def link        asteriskvmZone            Type
hi def link        zoneName                String
hi def link        zoneDef                 String
hi def link        asteriskvmSetting         Type
hi def link        asteriskvmSettingBool     Type
hi def link        asteriskvmMailbox         Statement
hi def link        mailboxEmail            String
let b:current_syntax = "asteriskvm"
