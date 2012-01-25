" Vim syntax file
" Language:     Taskvim (http://joseluisdgz.com/projects/taskvim)
" Maintainer:   Jose Luis Diaz Gonzalez <jlx.dgz@gmail.com>
" URL: 
" Version:      1
" Last Change: 19 Mar 2011

" Filename: taskvim.txt

syn case ignore
"hi clear

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

"hi Normal guifg=white guibg=black gui=NONE
"hi LineNr guifg=#3D3D3D guibg=black gui=NONE
"hi Cursor guifg=black guibg=white gui=NONE

syn match taskText /^\w\+.*[^:]$/ "Text, comment, description
syn match taskChar /^\s*[-—]\s\+/ "/-\{1}\s/ - active and pending task 
syn region taskDone start=/+\{1}\s/ end=/$/ "+ done task
syn match taskTag  /\s@\{1}.*/ "/@\{1}.*/ @tag or @context
syn match taskRaw /\*\{1}\s.*/ "* quick note or comment about the project/area
syn match taskPriority />\{1}\s.*/ contains=taskTag "> important task
syn match Project /^.\+:\s*$/ "/^\w.*:\{1}/ Project or Area
syn match taskCode /.\+:\s\+/ contains=taskChar

if &background == "dark"
    hi def link taskText Type
    hi def link taskChar PreProc
    hi def link taskDone Comment
    hi def link taskTag PreProc
    hi def link taskRaw Statement
    hi def link taskPriority Special
    hi def link Project Identifier
    hi def link taskCode Constant

"Better cursor line to match colors
"hi CursorLine guifg=NONE guibg=#333433 gui=NONE
"hi StatusLine guifg=#CCCCCC guibg=#202020 gui=italic 

elseif &background == "light"
"hi Normal guifg=black guibg=white gui=NONE
"hi LineNr guifg=white guibg=lightgrey gui=NONE
"hi Cursor guifg=white guibg=black gui=NONE

    hi taskText guifg=#5C84A0 gui=italic
    hi taskChar guifg=#C37310
    hi taskDone guifg=#B9B8BF gui=italic
    hi taskTag guifg=#CD8E2C
    hi taskRaw guifg=#57751D
    hi taskPriority guifg=#B6000D
    hi Project guifg=#1A526D

"Better cursor line to match colors
"hi CursorLine guifg=NONE guibg=#FFF7BF gui=NONE
"hi StatusLine guifg=#414042 guibg=#C3BEC3 gui=italic 
endif

"hi taskText guifg=#6D9CBD gui=italic
"hi taskChar guifg=Orange
"hi taskDone guifg=#666666 gui=italic
"hi taskTag guifg=#FFCC33
"hi taskRaw guifg=#99CC33
"hi taskPriority guifg=#DA4839
"hi Project guifg=#3399CC
"hi taskCode 

let b:current_syntax = "taskvim"
