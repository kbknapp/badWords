" Vim plugin for highlighting words to avoid in educational writing
" Maintainer:	Xavier Maso <xav.maso@gmail.com>
" License:	This file is placed in the public domain.


if exists("g:loaded_badWords")
  finish
endif
let g:loaded_badWords = 1


highlight badWords ctermbg=red ctermfg=white

fun! HighlightBadWords()
  let en=[ 'obviously', 'basically', 'simply', 'of course', 'just', 'everyone knows', 'so,', 'easy', 'easily', 'trivial', 'trivially' ]
  let fr=[ 'évidemment', 'simplement', 'clairement', 'facile', 'bien sur' ]

  for lang in [ en, fr ]
    call matchadd('badWords', '\c\<\(' . join(lang, '\|') . '\)\>')
  endfor
endfun

autocmd BufRead,BufNewFile *.md,*.txt,*.rst call HighlightBadWords()
autocmd InsertLeave *.md,*.txt,*.rst call HighlightBadWords()
