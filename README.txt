*taskvim* TaskVim file-type plugin and syntax file

Jose Luis Diaz Gonzalez <joseluisdgz@me.com>

10th February 2012

![TaskVim](https://skitch.com/joseluisdgz/8ytar/taskvim)

==============================================================================
ABOUT                                               *taskvim-about*

TaskVim is inspired by Taskpaper: simple to-do list in plain text. You can group your tasks in projects or areas and keep it simple.

I love plain text, I love colors (rather than just black on white) and I have multiples OSs (at home, at work, mobility). So after tried a lot of productivity systems and apps, I always come back to a simple list (in a plain txt) of tasks grouped in projects or areas of my life. And the best multiplatform text editor I know is Vim.

TaskVim is a task manager with some more advanced functionalities than just simple text, based on concepts from Taskpaper (and GTD system as well), implemented on GVim (multiOS), using syntax coloring to highlight the status (and elements) of your tasks and always kept in a simple txt file.

My goal is to define a system totally flexible. Offering enough elements to help you to adapt taskvim to the way you handle your tasks. 

The coding part is inspired, learned, copied and modified from the taskpaper plugin for vim by David O'Callaghan <david.ocallaghan@cs.tcd.ie>, published under GNU license.

TaskPaper website http://hogbaysoftware.com/projects/taskpaper
Taskpaper vim plugin website http://www.vim.org/scripts/script.php?script_id=2027
and also on github https://github.com/davidoc/taskpaper.vim

==============================================================================
INSTALLATION                                        *taskvim-installation*

Unpack the archive to ~/.vim.
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

You have 3 main elements: 
    - Projects: 
    - Tasks: 
    - Notes:

The syntax file highlights all these elements with the predefined colors of the colorscheme you have configured in your vimrc. 

# PROJECTS:

To define a project write some text at the begining of a line ending in a colon.  

Example:

TaskVim vim plugin:
    — sometask
    — another task

# TASKS:

A task is a line beginning with '-' or '—' 

If you press 'o' or '<cr>' on a task line, it will create a new task in the next line.

A task can have several subelements to add additional information to that task:
    - code
    - tag/context
    - date
    - version

To classify your tasks you could use a Project header, a code, or a tag.

## Code:
You can assign a code to a task. A code can help you to classify that task into a project, an area of your life, some event, etc.

To assign a code to a task, type a non-spaced code at the beginning of the task ending in a colon.

Example:

TaskVim vim plugin:
    — prj_taskvim: write doc file
    — prj_taskvim: upload updates to github

## Tag:
A tag has the form "@tag" 

Example:

TaskVim vim plugin:
    — prj_taskvim: write doc file @write
    — prj_taskvim: upload updates to github @github

## Date:
The date when you want to schedule that task or whatever meaning you want to give to that date.

The date is freeform. By now it's just simple text preceded by a hash

Examples:
        #mon        - schedule for next monday
        #saturday   - schedule for next saturday
        #03162012   - ...
        #March16th  - whatever format you want to use for your dates

TaskVim vim plugin:
    — prj_taskvim: write doc file #friday @write
    — prj_taskvim: upload updates to github #tomorrow @github

## Version:
If you are a programmer (professional or amateur) you can link some task to a version of your app, script, service, whatever.

Examples:
        v0.1
        v5.4
        v15.56 - just the format vXY.WZ

TaskVim vim plugin:
    — prj_taskvim: write doc file #friday @write
    — prj_taskvim: v0.3 upload updates to github #tomorrow @github

A Task can have four different states:
    - Normal Task
    - Important Task
    - Completed Task
    - Waiting Task
        
## Important Task
An important task is a line beginning with '>' and can have zero or more context tags.

Example:

TaskVim vim plugin:
    > prj_taskvim: write doc file #friday @write
    — prj_taskvim: v0.3 upload updates to github #tomorrow @github

## Completed Task
A completed task is a line beginning with '+'.

Example:

TaskVim vim plugin:
    + prj_taskvim: write doc file #friday @write
    — prj_taskvim: v0.3 upload updates to github #tomorrow @github

## Waiting Task
A waiting task is a line beginning with '?'.

Example:

TaskVim vim plugin:
    + prj_taskvim: write doc file #friday @write
    ? prj_taskvim: v0.3 upload updates to github #tomorrow @github

NOTES:

Other text is considered as a "note".

Example:

TaskVim vim plugin:
A note about taskvim or something.
    + prj_taskvim: write doc file #friday @write
    ? prj_taskvim: v0.3 upload updates to github #tomorrow @github

==============================================================================
FILETYPE PLUGIN                                              *taskvim-ftplugin*

The file-type plugin tries to make editing TaskVim files in Vim more
comfortable. 

The plugin defines some new mappings. 

Now you can fold your projects. A Project region includes from Project header to next blank line.

Now the mappins depends on the platform you are using (trying to be more os-friendly):
If you are using MacVim:
    <Leader>2   Mark task done
    <Leader>3   Mark task as important
    <Leader>4   Mark task as waiting

The default setting for the 'mapleader' variable is backslash ('\'). You can config other mapleader (most common and productive is ',').

If you are using GVim in other platforms:
    F2     Mark task as done
    F3     Mark task as important
    F4     Mark task as waiting

The plugin now auto saves your taskvim file when your window editor loses focus. So if you are editing your tasks, and then you start doing anything else, your changes are saved automatically and silently.

==============================================================================
DEFAULT CONFIG                                             *taskvim-config*

The plugin configure the next vim options to manage list in a better way:

    * added — (DASH EM) as a comment
    * added @ as a keyword
    * formatoptions=qro1
    * textwidth=0 and wrapmargin=0 to avoid hard-wrap on list items
    * autoindent


==============================================================================
FILETYPE DETECT                                             *taskvim-ftdetect*

This package also contains a script to automatically use the TaskVim file
type for all files with the format <filename>.taskvim.txt

The reason to keep the main extension as txt instead of taskvim is for compatibility purposes, so you can use your taskvim lists in any app that just supports txt files.

This filetype detect script is based on Taskpaper plugin from David O'Callaghan <david.ocallaghan@cs.tcd.ie>

==============================================================================
LICENCE                                                     *taskvim-licence*

Copyright (C) 2012 by Jose Luis Diaz Gonzalez 

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
