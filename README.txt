*taskvim* TaskVim file-type plugin and syntax file

Jose Luis Diaz Gonzalez <joseluisdgz@gmail.com>

20th March 2011

==============================================================================
ABOUT                                               *taskvim-about*

TaskVim is inspired by Taskpaper: simple to-do list in plain text. You can group your tasks in projects or areas and keep it simple.

I love plain text, I love colors (rather than just black on white) and I have multiples OSs (at home, at work, mobility). So after tried a lot of productivity systems and apps, I always come back to a simple list (in a plain txt) of tasks grouped in projects or areas of my life. And the best multiplatform text editor I know is Vim.

TaskVim is a task manager with some more advanced functionalities than just simple text, based on concepts from Taskpaper (and GTD system as well), implemented on GVim (multiOS), using syntax coloring to highlight the status (and elements) of your tasks and always kept in a simple txt file.

The coding part is inspired, learned, copied and modified from the taskpaper plugin for vim by David O'Callaghan <david.ocallaghan@cs.tcd.ie>, published under GNU license.

TaskPaper website http://hogbaysoftware.com/projects/taskpaper
Taskpaper vim plugin website http://www.vim.org/scripts/script.php?script_id=2027
and also on github https://github.com/davidoc/taskpaper.vim

==============================================================================
INSTALLATION                                        *taskvim-installation*

Unpack the archivo to ~/.vim.
It contains the following files:

    doc/taskvim.txt
    doc/taskvim_licence.txt
    ftplugin/taskvim.vim
    syntax/taskvim.vim
    ftdetect/taskvim.vim

To access this help file from within Vim you must first update your help 
tags:

    :helptags ~/.vim/doc

To access the TaskVim help execute this command:

    :help taskvim

==============================================================================
SYNTAX                                              *taskvim-syntax*

You have 5 main elements: 
    - Projects: 
    - Tasks: 
    - Important Tasks: 
    - Quick notes: 
    - Tags: 

The syntax file highlights all these elements with predefined colors. 

To define a project write some text at the begining of a line ending in a colon.  

A task is a line beginning with '-' and can have zero or more tags.

An important task is a line beginning with '>' and can have zero or more context tags.

A completed task is a line beginning with '+'.

A tag has the form "@tag" and must be placed at the end of the task.

Other text is considered as a "note".

==============================================================================
FILETYPE PLUGIN                                              *taskvim-ftplugin*

The file-type plugin tries to make editing TaskVim files in Vim more
comfortable. 

The plugin defines some new mappings. 

Now the mappins depends on the platform you are using (trying to be more os-friendly):
If you are using MacVim:
    <Leader>2   Mark task done
    <Leader>3   Mark task as important

The default setting for the 'mapleader' variable is backslash ('\'). You can config other mapleader (most common and productive is ',').

If you are using GVim in other platforms:
    F2     Mark task as done
    F3     Mark task as important

The plugin now auto saves your taskvim file when your window editor loses focus. So if you are editing your tasks, and then you start doing anything else, your changes are saved automatically and silently.

==============================================================================
FILETYPE DETECT                                             *taskvim-ftdetect*

This package also contains a script to automatically use the TaskVim file
type for all files with the format <filename>.taskvim.txt

The reason to keep the main extension as txt instead of taskvim is for compatibility purposes, so you can use your taskvim lists in any app that just supports txt files.

This filetype detect script is based on Taskpaper plugin from David O'Callaghan <david.ocallaghan@cs.tcd.ie>

==============================================================================
LICENCE                                                     *taskvim-licence*

Copyright (C) 2011 by Jose Luis Diaz Gonzalez 

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

==============================================================================
REPORTING BUGS AND FEATURE REQUESTS                             *taskvim-bugs*

Taskvim uses github for bug tracking. Go to
http://github.com/joseluisdgz/taskvim/issues to report any issues.

The latest version of the script is always available on github:

http://github.com/joseluisdgz/taskvim
