" Vim plugin for highlighting words to avoid in educational writing
" Maintainer:	Xavier Maso <xav.maso@gmail.com>
" License:	This file is placed in the public domain.

function! s:ShowBadWords(force)
  if a:force
    let b:bad_whitespace_show = 1
  endif
  highlight default BadWords ctermbg=red guibg=red ctermfg=white guifg=white
  autocmd ColorScheme <buffer> highlight default BadWords ctermbg=red guibg=red ctermfg=white guifg=white

  autocmd InsertLeave <buffer> match BadWords /\c\<\(obvious\|obviously\|basically\|simply\|of\scourse\|everyone\sknows\|easy\|easily\|trivial\|trivially\)\>/
  autocmd InsertEnter <buffer> match BadWords /\c\<\(obvious\|obviously\|basically\|simply\|of\scourse\|everyone\sknows\|easy\|easily\|trivial\|trivially\)\>/
endfunction

function! s:HideBadWords(force)
  if a:force
    let b:bad_words_show = 0
  endif
  match none BadWords
endfunction

function! s:EnableShowBadWords()
  if exists("b:bad_words_show")
    return
  endif
  if &modifiable
    call <SID>ShowBadWords(0)
  else
    call <SID>HideBadWords(0)
  endif
endfunction

function! s:ToggleBadWords()
  if !exists("b:bad_words_show")
    let b:bad_words_show = 0
    if &modifiable
      let b:bad_words_show = 1
    endif
  endif
  if b:bad_words_show
    call <SID>HideBadWords(1)
  else
    call <SID>ShowBadWords(1)
  endif
endfunction

autocmd BufWinEnter,WinEnter,FileType *.md,*.txt,*.rst call <SID>EnableShowBadWords()
