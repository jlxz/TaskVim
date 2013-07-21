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
syn match taskText /^\a\+.*[^:]$/ contains=taskLineSeparator,taskQuotes
" quotes
syn match taskQuotes /".\+"/
syn match taskChar /[-—]/ contained
"Normal task line active and pending task
syn match taskTask /[-—]\s.*$/ contains=taskChar,taskCode,taskTag,taskVersion,taskDate,taskBra,taskPar
" cool simple separator
syn match taskSeparatorSimple /^[-—]\{5}$/
"+ done task
syn match taskDone /\s*+\s.*$/ "contains=taskTag,taskCode
"? waiting task
syn match taskWait /?\s.*$/ 
"@tag or @context
syn match taskTag  /@\S*/ contained
" keys - values
syn match taskKey /[^+—>?\*·•-]\+:/ contained
syn match taskValue /[^+—>?\*·•-]\S\+:[^\/*].\+$/ contains=taskKey,taskBra,taskPar,taskTag,taskDate,taskLineSeparator
"@tag header for a group tag or a group context
syn match taskTagHeader  /^@.*/
"numbered lists
syn match taskNumList /\d\{1,3}\w*\./ contained
syn match taskNList /\d\{1,3}\w*\.\s.*$/ contains=taskNumList,taskBra,taskPar,taskLineSeparator
"subnumbered lists
"syn match taskNumSubList /\d\{1,3}\w\{1,3}\./ contained
"syn match taskSubList /\d\{1,3}\w\{1,3}\.\s.*$/ contains=taskNumSubList,taskLineSeparator
"bullet lists
syn match taskBulList /[·•\*]/ contained
syn match taskBulKey /[·•\*]\s.\+:\s/ contained
syn match taskBList /[·•*]\s.*$/ contains=taskBulList,taskBulKey,taskLineSeparator,taskBra,taskPar
" cool header with text
syn match taskHeader /#\{1}\s.*\s#\{1}/ contains=taskHeaderText
syn match taskHeaderText /[^#].[^#]\+/ contained
" cool separator
"syn match taskSeparator /^<\+—\+>\+$/
" date to complete the task
syn match taskDate /#\S*/ contained
"* quick note or comment about the project/area
"syn match taskRaw /\*\{1}\s.*/ 
"> important task
syn match taskPriority /\s*>\s.*$/ contains=taskCode,taskTag,taskVersion,taskDate,taskBra,taskPar
"Project or Area
syn match taskToday /^\*\{1}.\+:\s*$/ 
syn match taskProject /^[^\*].\+:\s*$/ 
syn match taskSpProject /^[^\*].\+_\s*$/ 
syn match taskSpProject2 /^[^\*].\+__\s*$/ 
syn match taskDay /^[a-z]\{3}_[0-9]\{2}[a-z]\{3}:\s*$/ 
"syn match taskCode /\s\S\+:\s/ contained 
syn match taskCode /\s.\+\S:\s/ contained
"syn match taskCodeP /\sp[A-Z]_\S\+:\s/ contained
"syn match taskCodeO /\so[A-Z]*_*\S*:\s/ contained
"syn match taskCodeQ /\sq[A-Z]*_*\S*:\s/ contained
" priorities
"syn match taskPrioA /(A)/ contained
"syn match taskPrioB /(B)/ contained
"syn match taskPrioC /(C)/ contained
"v0.1 version numbers
syn match taskVersion /v\d\{1,2}\.\d\{1,2}\s\+/ contained
"date event, something important for that day that it's not a task
syn match taskEvent /^:.\+$/
" folding
syn region taskFold start=/^.*:\s*$/ end=/^\s*$/ transparent fold
" taskvim note file title
"syntax match taskTitle /^.*\%1l.*$/
" surrounded text with [] () """
syn match taskBraSym /[\[\]]/ contained
syn match taskBra /\s\[.\+\]\s/ contains=taskBraSym
syn match taskParSym /[()]/ contained
syn match taskPar /\s(.\+)\s/ contains=taskParSym
"syn match taskCorSym /[{}]/ contained
"syn region taskCor start=/^\s*{$/ end=/\ze^\s*}$/ 
" links
syn match taskLink /https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?\S*/
" cool line separator
syn match taskLineSeparator /\s*>>\s*/ contained

    "hi def link taskTitle Underlined
    hi def link taskNumSubList Statement
    hi def link taskSubList Comment
    hi def link taskNumList Statement
    hi def link taskNList Normal
    hi def link taskBulList Statement
    hi def link taskBulKey Statement
    hi def link taskBList Comment
    hi def link taskChar Title
    hi def link taskSeparatorSimple Constant
    hi def link taskDone Comment
    hi def link taskTag Constant
    hi def link taskTagHeader Constant
    "hi def link taskRaw PreProc
    hi def link taskPriority Special
    hi def link taskDay Identifier
    hi def link taskProject PreProc
    hi def link taskSpProject Type
    hi def link taskSpProject2 Identifier
    hi def link taskToday Special
    "hi def link taskCode Statement
    hi def link taskCode Statement
    "hi def link taskCodeO PreProc
    "hi def link taskCodeQ Todo
    hi def link taskVersion Type
    hi def link taskDate PreProc
    hi def link taskKey Statement
    hi def link taskValue Normal
    "hi def link taskWait Todo
    hi def link taskWait Underlined
    hi def link taskHeader Special
    hi def link taskHeaderText Statement
    hi def link taskEvent Type
    hi def link taskText Normal
    hi def link taskQuotes pandocEmphasisDefinition
    hi def link taskBra Identifier
    hi def link taskBraSym Constant
    hi def link taskPar Identifier
    hi def link taskParSym Constant
    "hi def link taskCor Comment
    "hi def link taskCorSym Constant
    hi def link taskLineSeparator Constant
    hi def link taskLink pandocListReference
    "hi def link taskSeparator Constant

syn sync fromstart

let b:current_syntax = "taskvim"
