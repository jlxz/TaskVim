" Vim syntax file
" Language:     Taskvim (http://joseluisdgz.com/projects/taskvim)
" Maintainer:   Jose Luis Diaz Gonzalez <jlx.dgz@gmail.com>
" URL: 
" Version:      0.2
" Last Change: 26 Ene 2012

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
syn match taskTask /[-—]\s.*$/ contains=taskChar,taskCode,taskTag,taskVersion 
"+ done task
syn match taskDone /+\s.*$/ "contains=taskTag,taskCode
"@tag or @context
syn match taskTag  /@\S*/ contained 
"* quick note or comment about the project/area
"syn match taskRaw /\*\{1}\s.*/ 
"> important task
syn match taskPriority />\s.*$/ contains=taskCode,taskTag,taskVersion 
"Project or Area
syn match taskProject /^.\+:\s*$/ 
syn match taskCode /\s\S\+:\s/ contained 
"v0.1 version numbers
syn match taskVersion /v\d\{1,2}\.\d\{1,2}\s\+/ contained
" folding
syn region taskFold start=/^.*:\s*$/ end=/^\s*$/ transparent fold

    hi def link taskText Type
    hi def link taskChar Title
    hi def link taskDone Comment
    hi def link taskTag Constant
    "hi def link taskRaw PreProc
    hi def link taskPriority Special
    hi def link taskProject Identifier
    hi def link taskCode Statement
    hi def link taskVersion Type

syn sync fromstart

let b:current_syntax = "taskvim"
