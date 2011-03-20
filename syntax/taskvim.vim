" Vim syntax file
" Language:     Taskvim (http://joseluisdgz.com/projects/taskvim)
" Maintainer:   Jose Luis Diaz Gonzalez <joseluisdgz@gmail.com>
" URL: 
" Version:      1
" Last Change: 20 Mar 2011

" Filename: taskvim.txt

syn case ignore
hi clear

if exists("t:taskvim_theme")
else 
    let t:taskvim_theme = 1
endif

if (t:taskvim_theme == 1)
    set background=dark
    hi Normal guifg=white guibg=black gui=NONE
    hi LineNr guifg=#3D3D3D guibg=black gui=NONE
    hi Cursor guifg=black guibg=white gui=NONE
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
    hi StatusLine guifg=#CCCCCC guibg=#202020 gui=italic 
elseif (t:taskvim_theme == 2)
    set background=light
    hi Normal guifg=black guibg=white gui=NONE
    hi LineNr guifg=white guibg=lightgrey gui=NONE
    hi Cursor guifg=white guibg=black gui=NONE
    "Text, comment, description
    syn match taskText /^\w\+.*[^:]$/
    hi taskText guifg=#5C84A0 gui=italic
    "- active and pending task
    syn match taskChar /-\{1}\s/ 
    hi taskChar guifg=#C37310
    "+ done task
    syn region taskDone start=/+\{1}\s/ end=/$/
    hi taskDone guifg=#B9B8BF gui=italic
    " @tag or @context
    syn match taskTag /\s@\{1}.*/ "/@\{1}.*/
    hi taskTag guifg=#CD8E2C
    "* quick note or comment about the project/area
    syn match taskRaw /\*\{1}\s.*/
    hi taskRaw guifg=#57751D
    "> important task
    syn match taskPriority />\{1}\s.*/ contains=taskTag
    hi taskPriority guifg=#B6000D
    "Project or Area
    syn match Project /^.\+:\s*$/ "/^\w.*:\{1}/
    hi Project guifg=#1A526D
    "Better cursor line to match colors
    hi CursorLine guifg=NONE guibg=#FFF7BF gui=NONE
    hi StatusLine guifg=#414042 guibg=#C3BEC3 gui=italic 
endif

let b:current_syntax = "taskvim"
