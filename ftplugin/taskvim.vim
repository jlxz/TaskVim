" plugin to handle the TaskVim to-do list format
" inspired by TaskPaper http://hogbaysoftware.com/projects/taskpaper
" 'stealed' some code and learned a lot from the great plugin TaskPaper for Vim by David O'Callaghan
" http://www.cs.tcd.ie/David.OCallaghan/taskpaper.vim/
" Language:	TaskVim 
" Maintainer:	Jose Luis Diaz Gonzalez
" URL:		http://joseluisdgz.com/projects/taskvim/
" Version:	0.1
" Last Change:  20/03/2011

" check if the plugin is already loaded
if exists("loaded_task_vim")
    finish
endif
let loaded_task_vim = 1

" function TaskDone to toggle done status
function! s:TaskDone()
    let line = getline(".")
    if (line =~ '-\{1}\s')
       let line2 = substitute(line, "-", "+", "")
       call setline(".", line2)
       echo "task done"
    elseif (line =~ '+\{1}\s')
        let line2 = substitute(line, "+", "-", "")
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

" function TaskImportant to toggle important status
function! s:TaskImportant()
    let line = getline(".")
    if (line =~ '-\{1}\s')
        let line2 = substitute(line, "-", ">", "")
        call setline(".", line2)
        echo "important task"
    elseif (line =~ '>\{1}\s')
        let line2 = substitute(line, ">", "-", "")
        call setline(".", line2)
        echo "normal task"
    else
        echo "It's not a task"
    endif
endfunction

" Set up mappings
noremap <unique> <script> <Plug>TaskDone        :call <SID>TaskDone()<CR>
noremap <unique> <script> <Plug>TaskImportant   :call <SID>TaskImportant()<CR>

if has("gui_macvim")
    map <buffer> <silent> <Leader>2 <Plug>TaskDone
    map <buffer> <silent> <Leader>3 <Plug>TaskImportant

else
    map <buffer> <silent> <F2> <Plug>TaskDone
    map <buffer> <silent> <F3> <Plug>TaskImportant
endif

" Autocreate list items
setl comments=b:-,b:*,b:>
setl formatlistpat=^\\s*[->*]\\s*
setlocal formatoptions=tnro

" Set up list formating 
set autoindent
setl wrap

" Set up save on Focus Lost
au FocusLost * :wa


