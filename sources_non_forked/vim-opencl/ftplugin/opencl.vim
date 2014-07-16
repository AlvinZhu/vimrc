" Vim filetype plugin file
" Language:	OpenCL
" Maintainer:	Alvin Zhu <alvin.zhuge@gmail.com>
" Last Change:	2013 Dec 22

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

" Behaves just like C
runtime! ftplugin/c.vim ftplugin/c_*.vim ftplugin/c/*.vim
