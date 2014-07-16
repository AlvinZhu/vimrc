"call pathogen#infect('~/.vim_runtime/my_plugin')
"call pathogen#helptags()

set path=.,/usr/include,/opt/AMDAPP/include,,

set mouse=a

set cmdheight=1

set scrolloff=1

set autochdir

"if &term == "xterm"
"    set t_Co=256
"endif

" Set font according to system
if has("mac") || has("macunix")
    set gfn=Menlo:h15
elseif has("win16") || has("win32")
    set gfn=Bitstream\ Vera\ Sans\ Mono:h11
elseif has("unix")
    set gfn=Monospace\ 12
endif

try
"    colorscheme molokai
"    colorscheme solarized
"    colorscheme railscasts
"    colorscheme jellybeans
    colorscheme desertEx
catch
endtry

"let g:molokai_original=1

set foldmethod=syntax
set foldlevel=100

unmap <space>
unmap <c-space>
nmap <space> za

if has("gui_running")
    winpos 109 24
    set lines=43 columns=132
endif

autocmd BufWrite *.c :call DeleteTrailingWS()
autocmd BufWrite *.h :call DeleteTrailingWS()

nmap <F9> :call DeleteTrailingWS()<CR>

nmap <F12> :call Do_CsTag()<CR>
function Do_CsTag()
    let dir = getcwd()
    if filereadable("tags")
        let tagsdeleted=delete("./"."tags")
        if(tagsdeleted!=0)
            echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
            return
        endif
    endif
    if has("cscope")
        silent! execute "cs kill -1"
    endif
    if filereadable("cscope.files")
        let csfilesdeleted=delete("./"."cscope.files")
        if(csfilesdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
            return
        endif
    endif
    if filereadable("cscope.out")
        let csoutdeleted=delete("./"."cscope.out")
        if(csoutdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
            return
        endif
    endif
    if(executable('ctags'))
        "silent! execute "!ctags -R --c-types=+p --fields=+S *"
        silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
    endif
    if(executable('cscope') && has("cscope") )
        silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
        silent! execute "!cscope -Rb"
        execute "normal :"
        if filereadable("cscope.out")
            execute "cs add cscope.out"
        endif
    endif
endfunction

nmap <F2> :NERDTreeToggle<CR>
let NERDTreeWinSize=30
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

nmap <F3> :TlistToggle<CR>
let Tlist_Ctags_Cmd='ctags'
let Tlist_Use_Right_Window=1
let Tlist_Show_One_File=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Process_File_Always=0
let Tlist_Inc_Winwidth=0
let Tlist_Auto_Update=1
"let Tlist_Enable_Fold_Column=0
