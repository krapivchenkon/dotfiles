if has("gui_macvim")
	macmenu &File.Print key=<nop>
endif


" set window title string to:
" CWD(uppercase)| current file directory| current file name| modifier | filetype
set title titlestring=%{toupper(fnamemodify(getcwd(),\":t\"))}:\ \ \ %{expand(\"%:p:h\")}\ \ \ \ [%{expand(\"%:t\")}]\ %m\ %Y

