" plugin to handle the TaskVim to-do list format
" inspired by TaskPaper http://hogbaysoftware.com/projects/taskpaper
" 'stealed' some code and learned a lot from the great plugin TaskPaper for Vim by David O'Callaghan
" http://www.cs.tcd.ie/David.OCallaghan/taskpaper.vim/
" Language: TaskVim 
" Maintainer: Jose Luis Diaz Gonzalez
" URL: http://joseluisdgz.com/projects/taskvim/
" Version: 0.3
" Last Change: 10/02/2012
 
augroup taskvim
     au! BufRead,BufNewFile *.taskvim.txt set filetype=taskvim
augroup END
