if exists("b:current_syntax")
finish
endif
setlocal iskeyword=@,48-57,_,-,#,$,{,}
syn case ignore
syn keyword    sqrSection     begin-footing begin-heading begin-procedure
syn keyword    sqrSection     begin-program begin-report begin-setup
syn keyword    sqrSection     end-footing end-heading end-procedure
syn keyword    sqrSection     end-program end-report end-setup
syn keyword    sqrParagraph   alter-color-map alter-connection
syn keyword    sqrParagraph   alter-locale alter-printer alter-report
syn keyword    sqrParagraph   begin-document begin-execute begin-select
syn keyword    sqrParagraph   begin-sql declare-chart declare-image
syn keyword    sqrParagraph   declare-color-map declare-connection
syn keyword    sqrParagraph   declare-layout declare-printer
syn keyword    sqrParagraph   declare-report declare-procedure
syn keyword    sqrParagraph   declare-toc declare-variable end-declare
syn keyword    sqrParagraph   end-document end-select exit-select end-sql
syn keyword    sqrParagraph   load-lookup
syn keyword    sqrReserved    #current-column #current-date #current-line
syn keyword    sqrReserved    #end-file #page-count #return-status
syn keyword    sqrReserved    #sql-count #sql-status #sqr-max-columns
syn keyword    sqrReserved    #sqr-max-lines #sqr-pid #sqr-toc-level
syn keyword    sqrReserved    #sqr-toc-page $sqr-database {sqr-database}
syn keyword    sqrReserved    $sqr-dbcs {sqr-dbcs} $sqr-encoding
syn keyword    sqrReserved    {sqr-encoding} $sqr-encoding-console
syn keyword    sqrReserved    {sqr-encoding-console}
syn keyword    sqrReserved    $sqr-encoding-database
syn keyword    sqrReserved    {sqr-encoding-database}
syn keyword    sqrReserved    $sqr-encoding-file-input
syn keyword    sqrReserved    {sqr-encoding-file-input}
syn keyword    sqrReserved    $sqr-encoding-file-output
syn keyword    sqrReserved    {sqr-encoding-file-output}
syn keyword    sqrReserved    $sqr-encoding-report-input
syn keyword    sqrReserved    {sqr-encoding-report-input}
syn keyword    sqrReserved    $sqr-encoding-report-output
syn keyword    sqrReserved    {sqr-encoding-report-output}
syn keyword    sqrReserved    $sqr-encoding-source {sqr-encoding-source}
syn keyword    sqrReserved    $sql-error $sqr-hostname {sqr-hostname}
syn keyword    sqrReserved    $sqr-locale $sqr-platform {sqr-platform}
syn keyword    sqrReserved    $sqr-program $sqr-report $sqr-toc-text
syn keyword    sqrReserved    $sqr-ver $username
syn keyword    sqrPreProc     #define #else #end-if #endif #if #ifdef
syn keyword    sqrPreProc     #ifndef #include
syn keyword    sqrCommand     add array-add array-divide array-multiply
syn keyword    sqrCommand     array-subtract ask break call clear-array
syn keyword    sqrCommand     close columns commit concat connect
syn keyword    sqrCommand     create-array create-color-palette date-time
syn keyword    sqrCommand     display divide do dollar-symbol else encode
syn keyword    sqrCommand     end-evaluate end-if end-while evaluate
syn keyword    sqrCommand     execute extract find get get-color goto
syn keyword    sqrCommand     graphic if input last-page let lookup
syn keyword    sqrCommand     lowercase mbtosbs money-symbol move
syn keyword    sqrCommand     multiply new-page new-report next-column
syn keyword    sqrCommand     next-listing no-formfeed open page-number
syn keyword    sqrCommand     page-size position print print-bar-code
syn keyword    sqrCommand     print-chart print-direct print-image
syn keyword    sqrCommand     printer-deinit printer-init put read
syn keyword    sqrCommand     rollback security set-color set-delay-print
syn keyword    sqrCommand     set-generations set-levels set-members
syn keyword    sqrCommand     sbtombs show stop string subtract toc-entry
syn keyword    sqrCommand     unstring uppercase use use-column
syn keyword    sqrCommand     use-printer-type use-procedure use-report
syn keyword    sqrCommand     while write
syn keyword    sqrParam       3d-effects after after-bold after-page
syn keyword    sqrParam       after-report after-toc and as at-end before
syn keyword    sqrParam       background batch-mode beep before-bold
syn keyword    sqrParam       before-page before-report before-toc blink
syn keyword    sqrParam       bold border bottom-margin box break by
syn keyword    sqrParam       caption center char char-size char-width
syn keyword    sqrParam       chars-inch chart-size checksum cl
syn keyword    sqrParam       clear-line clear-screen color color-palette
syn keyword    sqrParam       cs color_ data-array
syn keyword    sqrParam       data-array-column-count
syn keyword    sqrParam       data-array-column-labels
syn keyword    sqrParam       data-array-row-count data-labels date
syn keyword    sqrParam       date-edit-mask date-seperator
syn keyword    sqrParam       day-of-week-case day-of-week-full
syn keyword    sqrParam       day-of-week-short decimal decimal-seperator
syn keyword    sqrParam       default-numeric delay distinct dot-leader
syn keyword    sqrParam       edit-option-ad edit-option-am
syn keyword    sqrParam       edit-option-bc edit-option-na
syn keyword    sqrParam       edit-option-pm encoding entry erase-page
syn keyword    sqrParam       extent field fill fixed fixed_nolf float
syn keyword    sqrParam       font font-style font-type footing
syn keyword    sqrParam       footing-size foreground for-append
syn keyword    sqrParam       for-reading for-reports for-tocs
syn keyword    sqrParam       for-writing format formfeed from goto-top
syn keyword    sqrParam       group having heading heading-size height
syn keyword    sqrParam       horz-line image-size in indentation
syn keyword    sqrParam       init-string input-date-edit-mask insert
syn keyword    sqrParam       integer into item-color item-size key
syn keyword    sqrParam       layout left-margin legend legend-placement
syn keyword    sqrParam       legend-presentation legend-title level
syn keyword    sqrParam       line-height line-size line-width lines-inch
syn keyword    sqrParam       local locale loops max-columns max-lines
syn keyword    sqrParam       maxlen money money-edit-mask money-sign
syn keyword    sqrParam       money-sign-location months-case months-full
syn keyword    sqrParam       months-short name need newline newpage
syn keyword    sqrParam       no-advance nolf noline noprompt normal not
syn keyword    sqrParam       nowait number number-edit-mask on-break
syn keyword    sqrParam       on-error or order orientation page-depth
syn keyword    sqrParam       paper-size pie-segment-explode
syn keyword    sqrParam       pie-segment-percent-display
syn keyword    sqrParam       pie-segment-quantity-display pitch
syn keyword    sqrParam       point-markers point-size printer
syn keyword    sqrParam       printer-type quiet record reset-string
syn keyword    sqrParam       return_value reverse right-margin rows save
syn keyword    sqrParam       select size skip skiplines sort source
syn keyword    sqrParam       sqr-database sqr-platform startup-file
syn keyword    sqrParam       status stop sub-title symbol-set system
syn keyword    sqrParam       table text thousand-seperator
syn keyword    sqrParam       time-seperator times title to toc
syn keyword    sqrParam       top-margin type underline update using
syn keyword    sqrParam       value vary vert-line wait warn when
syn keyword    sqrParam       when-other where with x-axis-grid
syn keyword    sqrParam       x-axis-label x-axis-major-increment
syn keyword    sqrParam       x-axis-major-tick-marks x-axis-max-value
syn keyword    sqrParam       x-axis-min-value x-axis-minor-increment
syn keyword    sqrParam       x-axis-minor-tick-marks x-axis-rotate
syn keyword    sqrParam       x-axis-scale x-axis-tick-mark-placement xor
syn keyword    sqrParam       y-axis-grid y-axis-label
syn keyword    sqrParam       y-axis-major-increment
syn keyword    sqrParam       y-axis-major-tick-marks y-axis-max-value
syn keyword    sqrParam       y-axis-min-value y-axis-minor-increment
syn keyword    sqrParam       y-axis-minor-tick-marks y-axis-scale
syn keyword    sqrParam       y-axis-tick-mark-placement y2-type
syn keyword    sqrParam       y2-data-array y2-data-array-row-count
syn keyword    sqrParam       y2-data-array-column-count
syn keyword    sqrParam       y2-data-array-column-labels
syn keyword    sqrParam       y2-axis-color-palette y2-axis-label
syn keyword    sqrParam       y2-axis-major-increment
syn keyword    sqrParam       y2-axis-major-tick-marks y2-axis-max-value
syn keyword    sqrParam       y2-axis-min-value y2-axis-minor-increment
syn keyword    sqrParam       y2-axis-minor-tick-marks y2-axis-scale
syn keyword    sqrFunction    abs acos asin atan array ascii asciic ceil
syn keyword    sqrFunction    cos cosh chr cond deg delete dateadd
syn keyword    sqrFunction    datediff datenow datetostr e10 exp edit
syn keyword    sqrFunction    exists floor getenv instr instrb isblank
syn keyword    sqrFunction    isnull log log10 length lengthb lengthp
syn keyword    sqrFunction    lengtht lower lpad ltrim mod nvl power rad
syn keyword    sqrFunction    round range replace roman rpad rtrim rename
syn keyword    sqrFunction    sign sin sinh sqrt substr substrb substrp
syn keyword    sqrFunction    substrt strtodate tan tanh trunc to_char
syn keyword    sqrFunction    to_multi_byte to_number to_single_byte
syn keyword    sqrFunction    transform translate unicode upper wrapdepth
syn match	  sqrVariable	/\(\$\|#\|&\)\(\k\|\.\)*/
syn match	  sqrPreProc	/\s*#debug\a\=\(\s\|$\)/
syn match	  sqrSubstVar	/{\k*}/
syn match	  sqrString	/'\(!!\|[^!']\)*'/      contains=sqrSubstVar
syn match	  sqrStrOpen	/'\(!!\|''\|[^!']\)*$/
syn match	  sqrError	/'\(!!\|[^'!]\)*![^!]/me=e-1
syn match	  sqrError	/'\(!!\|[^'!]\)*!$/
syn match	  sqrNumber	/-\=\<\d*\.\=[0-9_]\>/
syn keyword	sqrTodo		TODO FIXME XXX DEBUG NOTE ###
syn match	sqrTodo		/???/
syn match	sqrComment	/!\@<!!\([^!=].*\|$\)/ contains=sqrTodo
syn match	sqrComment	/^!=.*/ contains=sqrTodo
syn match	sqrComment	/^!!.*/ contains=sqrTodo
syn match	sqrError	/^\s\+\zs!=.*/
syn match	sqrError	/.\+\zs!!.*/
hi def link sqrSection Statement
hi def link sqrParagraph Statement
hi def link sqrReserved Statement
hi def link sqrParameter Statement
hi def link sqrPreProc PreProc
hi def link sqrSubstVar PreProc
hi def link sqrCommand Statement
hi def link sqrParam Type
hi def link sqrFunction Special
hi def link sqrString String
hi def link sqrStrOpen Todo
hi def link sqrNumber Number
hi def link sqrVariable Identifier
hi def link sqrComment Comment
hi def link sqrTodo Todo
hi def link sqrError Error
let b:current_syntax = "sqr"
