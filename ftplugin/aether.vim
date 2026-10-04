if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

compiler aether

" Formatting
"setl formatoptions+=croql/ formatoptions-=t
setl formatoptions+=crql formatoptions-=t

" Miscellaneous settings
setl comments=://
setl commentstring=//\ %s
setl iskeyword+=@-@
setl suffixesadd=.ae

let b:undo_ftplugin = 'setl cms< com< fo< isk< sua<'

" Follow the aether style guide by default.
if get(g:, 'aether_recommended_style', 1)
  setl expandtab
  setl shiftwidth=4
  setl softtabstop=4
  setl tabstop=4
  setl textwidth=80
  let b:undo_ftplugin .= ' et< sts< sw< ts< tw<'

  "let s:root = expand('<sfile>:p:h:h')
  "exe 'setl dict+='.s:root.'/dicts/aether.base.dict,'.s:root. '/dicts/aether.dict'
endif

fu! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+\r\?$//ge
    nohl
    exe "normal `z"
endf

" Auto delete trailing white_space if save.
if get(g:, 'aether_save_cls', 1)
  au BufWrite *.ae call DeleteTrailingWS()
endif

augroup aether.vim
  autocmd!
  " Highlight incorrect spacing by default.
  if get(g:, 'aether_space_error', 1)
    au InsertEnter * hi link aetherSpaceError NONE
    au InsertLeave * hi link aetherSpaceError Error
  endif
augroup END

let &cpo = s:cpo_save
unlet s:cpo_save

" vim: et sw=2 sts=2 ts=8
