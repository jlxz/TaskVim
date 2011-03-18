" Vim syntax file
" Language:     Taskvim (http://joseluisdgz.com/projects/taskvim)
" Maintainer:   Jose Luis Diaz Gonzalez <jlx.dgz@gmail.com>
" URL: 
" Version:      1
" Last Change: 08 Feb 2011

" Filename: taskvim.txt

syn case ignore

set background=dark
" set background=white
if g:taskvim_theme=
"Text, comment, description
syn match taskText /^\w\+.*[^:]$/
hi taskText guifg=#6D9CBD gui=italic
"- active and pending task
syn match taskChar /-\{1}\s/ 
hi taskChar guifg=Orange
"+ done task
syn region taskDone start=/+\{1}\s/ end=/$/
hi taskDone guifg=#666666 gui=italic
" @tag or @context
syn match taskTag /\s@\{1}.*/ "/@\{1}.*/
hi taskTag guifg=#FFCC33
"* quick note or comment about the project/area
syn match taskRaw /\*\{1}\s.*/
hi taskRaw guifg=#99CC33
"> important task
syn match taskPriority />\{1}\s.*/ contains=taskTag
hi taskPriority guifg=#DA4839
"Project or Area
syn match Project /^.\+:\s*$/ "/^\w.*:\{1}/
hi Project guifg=#3399CC
"Better cursor line to match colors
hi CursorLine guifg=NONE guibg=#333433 gui=NONE

let b:current_syntax = "taskvim"
