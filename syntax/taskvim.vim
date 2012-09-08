" Vim syntax file
" Language:     Taskvim (http://joseluisdgz.com/projects/taskvim)
" Maintainer:   Jose Luis Diaz Gonzalez <jlx.dgz@gmail.com>
" URL: 
" Version:      0.3
" Last Change: 10 Feb 2012

" Filename: taskvim.txt

" add compatibility checks
" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syn case ignore

"Text, comment, description
syn match taskText /^\w\+.*[^:]$/ 
syn match taskChar /[-—]/ contained
"Normal task line active and pending task
syn match taskTask /[-—]\s.*$/ contains=taskChar,taskCode,taskTag,taskVersion,taskDate 
"+ done task
syn match taskDone /+\s.*$/ "contains=taskTag,taskCode
"? waiting task
syn match taskWait /?\s.*$/ 
"@tag or @context
syn match taskTag  /@\S*/ contained
"@tag header for a group tag or a group context
syn match taskTagHeader  /^@.*/
" cool header with text
syn match taskHeader /^<\+—\+\w\+—\+>\+$/ contains=taskHeaderText
syn match taskHeaderText /\w\+/ contained
" cool separator
syn match taskSeparator /^<\+—\+>\+$/
" date to complete the task
syn match taskDate /#\S*/ contained
"* quick note or comment about the project/area
"syn match taskRaw /\*\{1}\s.*/ 
"> important task
syn match taskPriority />\s.*$/ contains=taskCode,taskTag,taskVersion,taskDate
"Project or Area
syn match taskToday /^\*\{1}.\+:\s*$/ 
syn match taskProject /^[^\*].\+:\s*$/ 
syn match taskDay /^[a-z]\{3}_[0-9]\{2}[a-z]\{3}:\s*$/ 
syn match taskCode /\s\S\+:\s/ contained 
"v0.1 version numbers
syn match taskVersion /v\d\{1,2}\.\d\{1,2}\s\+/ contained
" folding
syn region taskFold start=/^.*:\s*$/ end=/^\s*$/ transparent fold

    hi def link taskText Type
    hi def link taskChar Title
    hi def link taskDone Comment
    hi def link taskTag Constant
    hi def link taskTagHeader Constant
    "hi def link taskRaw PreProc
    hi def link taskPriority Special
    hi def link taskDay Identifier
    hi def link taskProject PreProc
    hi def link taskToday Special
    hi def link taskCode Statement
    hi def link taskVersion Type
    hi def link taskDate PreProc
    "hi def link taskWait Todo
    hi def link taskWait Underlined
    hi def link taskHeader PreProc
    hi def link taskHeaderText Constant
    hi def link taskSeparator Statement

syn sync fromstart

let b:current_syntax = "taskvim"
