" plugin to handle the TaskVim to-do list format
" inspired by TaskPaper http://hogbaysoftware.com/projects/taskpaper
" 'stealed' some code and learned a lot from the great plugin TaskPaper for Vim by David O'Callaghan
" http://www.cs.tcd.ie/David.OCallaghan/taskpaper.vim/
" Language: TaskVim
" Maintainer: Jose Luis Diaz Gonzalez
" URL: http://joseluisdgz.com/projects/taskvim/
" Version: 0.3
" Last Change: 10/02/2012

" check if the plugin is already loaded
if exists("loaded_task_vim")
    finish
endif
let loaded_task_vim = 1

" function TaskDone to toggle done status
function! s:TaskDone()
    let line = getline(".")
    if (line =~ '—\{1}\s')
       let line2 = substitute(line, "—", "+", "")
       call setline(".", line2)
       echo "task done"
    elseif (line =~ '+\{1}\s')
        let line2 = substitute(line, "+", "—", "")
        call setline(".", line2)
        echo "task undone"
    elseif (line =~ '>\{1}\s')
        let line2 = substitute(line, ">", "+", "")
        call setline(".", line2)
        echo "important task done"
    else    
        echo "It's not a task"
    endif
endfunction

" function TaskWaiting to toggle waiting status
function! s:TaskWait()
    let line = getline(".")
    if (line =~ '—\{1}\s')
       let line2 = substitute(line, "—", "?", "")
       call setline(".", line2)
       echo "task waiting"
    elseif (line =~ '?\{1}\s')
        let line2 = substitute(line, "?", "—", "")
        call setline(".", line2)
        echo "task active"
    elseif (line =~ '>\{1}\s')
        let line2 = substitute(line, ">", "?", "")
        call setline(".", line2)
        echo "important task waiting"
    else    
        echo "It's not a task"
    endif
endfunction


" function TaskImportant to toggle important status
function! s:TaskImportant()
    let line = getline(".")
    if (line =~ '—\{1}\s')
        let line2 = substitute(line, "—", ">", "")
        call setline(".", line2)
        echo "important task"
    elseif (line =~ '>\{1}\s')
        let line2 = substitute(line, ">", "—", "")
        call setline(".", line2)
        echo "normal task"
    else
        echo "It's not a task"
    endif
endfunction

" Set up mappings
nmap <unique> <script> <Plug>TaskDone        :call <SID>TaskDone()<CR>
nmap <unique> <script> <Plug>TaskImportant   :call <SID>TaskImportant()<CR>
nmap <unique> <script> <Plug>TaskWait        :call <SID>TaskWait()<CR>

if has("gui_macvim")
    nmap <silent> <Leader>2 <Plug>TaskDone
    nmap <silent> <Leader>2 <Plug>TaskDone
    nmap <silent> <Leader>3 <Plug>TaskImportant
    "nmap <buffer> <silent> <Leader>4 <Plug>TaskWait
    "nmap <buffer> <silent> <Leader>3 <Plug>TaskImportant
    "nmap <buffer> <silent> <Leader>4 <Plug>TaskWait
else
    nmap <silent> <F2> <Plug>TaskDone
    nmap <silent> <F2> <Plug>TaskDone
    nmap <silent> <F3> <Plug>TaskImportant
    "nmap <buffer> <silent> <F4> <Plug>TaskWait
    "nmap <buffer> <silent> <F3> <Plug>TaskImportant
    "nmap <buffer> <silent> <F4> <Plug>TaskWait
endif

" Autocreate list items
setlocal comments+=b:—,
setlocal formatoptions=qro1
"add '@' to keyword character set so that we can complete contexts as keywords
setlocal iskeyword+=@-@
" Set up list formating 
" almost perfect config for list handling
setlocal autoindent
setlocal textwidth=0
setlocal wrapmargin=0
setlocal nolist

"fold projects
setlocal foldmethod=syntax
setlocal foldlevel=99

" Set up save on Focus Lost
au FocusLost * :wa

