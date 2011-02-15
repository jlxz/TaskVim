" plugin to handle the TaskVim to-do list format
" inspired by TaskPaper http://hogbaysoftware.com/projects/taskpaper
" 'stealed' some code and learned a lot from the great plugin TaskPaper for Vim by David O'Callaghan
" http://www.cs.tcd.ie/David.OCallaghan/taskpaper.vim/
" Language:	TaskVim 
" Maintainer:	Jose Luis Diaz Gonzalez
" URL:		http://joseluisdgz.com/projects/taskvim/
" Version:	0.2
" Last Change:  15/02/2011
 
augroup taskvim
     au! BufRead,BufNewFile *.taskvim.txt setfiletype taskvim
augroup END
