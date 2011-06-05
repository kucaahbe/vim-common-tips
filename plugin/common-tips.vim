" Vim plugin that adds :Tips command to view quickhelp window
" Last Change:	2011 Jun 5
" Maintainer:	Kuca AHbE <kucaahbe@ukr.net>
" License:	This file is placed in the public domain.

" vim:fileformat=unix

if exists("loaded_common_tips")
  finish
endif
let loaded_common_tips = 1

function <SID>ShowTips()
  help common-tips
endfunction

function <SID>TryShowTips()
  try
    call <SID>ShowTips()
  catch /E149/
    echo "helptags for 'common-tips' is not generated yet, please wait while it will be done..."
    let l:doc_dir = fnamemodify("<sfile>",":p:h").'/doc'
    echo l:doc_dir
    "silent helptags l:doc_dir
    execute "helptags ".l:doc_dir
    call <SID>ShowTips()
    echo "done"
  endtry
endfunction

if !exists(":Tips")
  command Tips call <SID>TryShowTips()
endif
