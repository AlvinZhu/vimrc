" Vim indent file
" Language:	OpenCL
" Maintainer:	Alvin Zhu <alvin.zhuge@gmail.com>
" Last Change:	2013 Dec 22

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
   finish
endif
let b:did_indent = 1

" It's just like C indenting
setlocal cindent

let b:undo_indent = "setl cin<"
