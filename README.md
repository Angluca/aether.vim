#### Vim plugin for flow language
https://aether-lang.dev/

Install using [vim-plug](https://github.com/junegunn/vim-plug)
```vim
Plug 'angluca/aether.vim'
```
Set lsp if you want
```vim
Plug 'yegappan/lsp'

def g:MyLspSetup()
  g:LspOptionsSet(g:lsp_options)
  g:LspAddServer([
    { name: 'aether', filetype: ['aether'], path: exepath('aether-lsp') },
  ])
enddef
au User LspSetup call g:MyLspSetup()
```
