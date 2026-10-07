if exists("b:current_syntax")
    finish
endif

syn keyword aetherKeyword fn trait impl effect module using
syn keyword aetherKeyword ensures requires where handle seal
syn keyword aetherOperator and or not
syn keyword aetherBoolean true false null none
syn keyword aetherKeyword message actor state receive spawn serve repo after reply
"syn keyword aetherType i8 i16 i32 i64 i128 u8 u16 u32 u64 u128 f32 f64 bool string void array ptr vec

syn keyword aetherKeyword const let var static inline typedef type
syn keyword aetherKeyword export extern callback embed register restrict
syn keyword aetherKeyword distinct
"syn keyword aetherKeywordimpl alias volatile async rec uni ext def tag sel
syn keyword aetherType bool byte array void string ptr bit_set Underlying
syn keyword aetherType cstring cstring_const cfn
syn keyword aetherType atomic_int atomic_flag
syn keyword aetherType int uint long
syn keyword aetherType uint8 uint16 uint32 uint64 uint128
syn keyword aetherType float double longdouble f32 f64 f128

syn keyword aetherLabel default result ref deref defer except
"syn keyword aetherConstant true false null
syn keyword aetherSComment assert
"syn keyword aetherMacro std
"syn keyword aetherSMacro print alignof typeof
"syn match aetherSMacro '\v<(put|[e]?print|[e]?println||alignas|alignof|typeof|typeof_unequal)>'
"syn match aetherAdded '\v<(new|[m]?alloc)>'
"syn match aetherException '\v<(free)>'

syn keyword aetherSelf self
syn keyword aetherRepeat do while loop for in to step
syn keyword aetherStatement break continue return with as
syn keyword aetherConditional if or else elif then match switch case
syn keyword aetherInclude include link when

syn keyword aetherException throw try catch cast hide
syn keyword aetherPanic panic
"syn keyword aetherSuper private

" -- shader
"syn match   aetherKeyword  '\v<(uniform|instance|varying|var|vertex|fragment|in|out)>'
"syn match   aetherType     '\v<(texture|texture2[Dd])>'
"syn match   aetherType     '\v<bool[234]?>'
"syn match   aetherType     '\v<int[234]?>'
"syn match   aetherType     '\v<uint[234]?>'
"syn match   aetherType     '\v<half[234]?>'
"syn match   aetherType     '\v<float([234](x[234])?)?>'
"syn match   aetherType     '\v<[dbui]?vec[234]>'
"syn match   aetherType     '\v<vec[234][dbfhui]?>'
"syn match   aetherType     '\v<mat[234](x[234]f)?>'
"syn match   aetherType     '\v<(vec|mat|list)\ze\['

syn match aetherPreProc   '[@]'
syn match aetherSymbol    '[,;:\.]'
syn match aetherOperator  '[\+\-\%=\/\^\&\*!?><\$|~]'
syn match aetherConstant  '[{}\[\]()]'
syn match aetherType      '\v\(@<=\s*\w+\ze(\[.*\])*\s*\*+\s*\)' " (type*)
syn match aetherType      '\v\[@<=\s*\w+\ze(\[.*\])*\s*\*+\s*\]' " [type*]
syn match aetherType      '\v<\w+_[tscemui]>'
syn match aetherRepeat    '\v([^\.](\.|(-\>)))@<=\w\w*'
syn match aetherMacro     '\v<[_]*\u[A-Z0-9_]*>'
syn match aetherType      '\v<[_]*\u[A-Z0-9_]*[a-z]+\w*>'
syn match aetherType      '\v\.?\zs<([iu][0-9]{1,3})?>'

syn match aetherType      '\v<\w+>\ze(::|\<(\w+\s*(\<.*\>|\[.*\])?\s*[,]?\s*)*\>)' "foo<T>()
syn match aetherFunc      '\v\w+\ze((\[[^=;]*\])|((::)?\<.*\>))*\s*\('

syn match aetherException '\v(\W@<=[~*@!?^]+\ze[\(\[\{\<]*[-]?\w)|(\w@<=[!]+\ze\W)'
syn match aetherType      '\v<[uif]\d+(x\d+)+>' "f64x6
syn match aetherAdded     '\v^\s*<(test)\ze\s+'
syn match aetherInclude   '\v^<(import).*$'
syn match aetherInclude   '\v\#(\w+)'
syn match aetherSComment  '\v\@(\w+)'
syn match aetherSComment  '\v<(call)\ze\s*\('
syn match aetherInclude   '\v<(exports)\ze\s*\('
"syn match aetherType      '\v<(res|opt)\ze\s*\['
"syn match aetherMacro     '\v^\s*\[.{-}\]'
"syn match aetherType      '\v<(str)\ze\s*\('
""syn match aetherSMacro    '\v<(reduce|deref|list)\ze\s*\('
"syn match aetherLabel     '\v<(addr)\ze\s*\('
syn match aetherLabel     '\v(\-\>)'
"syn match aetherFunc      '\v(\|\>)@<=\s*\w\w*'
syn match aetherLabel     '\v^\s*\w+\ze:'

syn match aetherInclude "\v^\s*(import)>" nextgroup=aetherRepeat,aetherString,aetherSymbol skipwhite
syn match aetherRepeat "\v\w+" contained nextgroup=aetherString,aetherSymbol,aetherRepeat skipwhite
"syn match aetherSymbol ":" contained nextgroup=aetherString,aetherRepeat skipwhite
syn match aetherString "\v(\w+\.)+" contained nextgroup=aetherRepeat skipwhite
syn match aetherString "\v\s+<as>\s+" contained nextgroup=aetherRepeat skipwhite
"syn match aetherString "\v:\s*(\w+(\.\w+)*)" contained

syn match aetherConstant contained /\v[\<,\>]/
syn region aetherConstantSpec
    \ oneline
    \ keepend
    \ contains=aetherType,aetherOperator,aetherMacro,aetherSComment,aetherConstant,aetherConstantSpec
    \ start=/\v\<\s*/
    \ end=/\v\s*\>/

"hi def aetherSymbol ctermfg=DarkGray guifg=DarkGray
hi def link aetherSMacro   SpecialComment
hi def link aetherTitle    Title
hi def link aetherAdded    Added
hi def link aetherConstant Constant
hi def link aetherBoolean Constant
hi def link aetherSymbol   Changed
hi def link aetherMacro    Macro
hi def link aetherSComment SpecialComment
hi def link aetherFunc     Function
hi def link aetherTypedef  Changed
"hi def aetherType ctermfg=DarkCyan guifg=DarkCyan
hi def link aetherType     MoreMsg
"hi def aetherSelf ctermfg=DarkMagenta guifg=DarkMagenta
hi def link aetherSelf     Label
hi def link aetherModeMsg  ModeMsg

syn match  aetherSpecialCharError display contained +\\\([^0-7nrt\\'"]\|[xX]\x\{2}\)+
syn match  aetherSpecialChar      contained "\\\([\"\\'ntr]\|[xX]\x\{2}\)"
syn match  aetherCharacter        "'[^']*'" contains=aetherSpecialChar,aetherSpecialCharError
syn match  aetherCharacter        "'\\''" contains=aetherSpecialChar
syn match  aetherCharacter        "'[^\\]'"

"syn region    aetherString      matchgroup=aetherString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=aetherEscape,@Spell
syn region    aetherString      matchgroup=aetherString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=@Spell
syn region    aetherString      matchgroup=aetherString start=+`+ skip=+\\\\\|\\`+ end=+`+ contains=@Spell

syn match aetherNumber "\v<[0-9_]+>"
syn match aetherNumber "\v<0[xX][0-9a-fA-F_]+([iuIU]?[lL]?[0-9]{-,3})?>"
syn match aetherNumber "\v<0[bB][01_]+([iuIU]?[lL]?[0-9]{-,3})?>"

syn match aetherFloat  '\v<\.\d+([eE][+-]?\d+)?[fFdD]?>' display
syn match aetherFloat  '\v<0x\x+(\.\x+)?[pP][+-]?\d+[fFdD]?>' display

" Integer literals
syn match aetherInteger '\v(\.@1<!|\.\.)\zs<(0|[1-9]\d*)([eE][+-]?\d+)?([iuIU]?[lL]?[0-9]{-,3})?>' display
syn match aetherInteger '\v(\.@1<!|\.\.)\zs<0b[01]+([iuIU]?[lL]?[0-9]{-,3})?>' display
syn match aetherInteger '\v(\.@1<!|\.\.)\zs<0o\o+([iuIU]?[lL]?[0-9]{-,3})?>' display
syn match aetherInteger '\v(\.@1<!|\.\.)\zs<0x\x+([iuIU]?[lL]?[0-9]{-,3})?>' display

syn match aetherFloat   display "\<[0-9][0-9_]*\.\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\|\.\)\@!"
syn match aetherFloat   display "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\%([eE][+-]\=[0-9_]\+\)\=\(f32\|f64\)\="
syn match aetherFloat   display "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\=\%([eE][+-]\=[0-9_]\+\)\(f32\|f64\)\="
syn match aetherFloat   display "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\=\%([eE][+-]\=[0-9_]\+\)\=\(f32\|f64\)"

" Escape sequences
syn match aetherEscape '\\[\\'"0abfnrtv]' contained display
syn match aetherEscape '\v\\(x\x{2}|u\x{4}|U\x{8})' contained display
" Format sequences
syn match aetherFormat '\v\{\d*(\%\d*|:([- +=befgoxX]|F[.2sESU]|\.?\d+|_(.|\\([\\'"0abfnrtv]|x\x{2}|u\x{4}|\x{8})))*)?}' contained contains=aetherEscape display
syn match aetherFormat '{{\|}}' contained display


hi def link aetherPreProc               PreProc
hi def link aetherSuper                 Title
"hi def link aetherFloat                 Constant
hi def link aetherFloat                 Underlined
hi def link aetherInteger               Number
hi def link aetherEscape                SpecialComment
hi def link aetherFormat                SpecialChar

hi def link aetherKeyword               Keyword
hi def link aetherInclude               Include
hi def link aetherLabel                 Label
hi def link aetherConditional           Conditional
hi def link aetherRepeat                Repeat
hi def link aetherStatement             Statement
"hi def link aetherType                  Type
hi def link aetherNumber                Number
hi def link aetherComment               Comment
hi def link aetherOperator              Operator
hi def link aetherCharacter             Character
hi def link aetherString                String
hi def link aetherTodo                  Todo
hi def link aetherSpecial               Special
hi def link aetherSpecialError          Error
hi def link aetherSpecialCharError      Error
hi def link aetherString                String
hi def link aetherCharacter             Character
hi def link aetherSpecialChar           SpecialChar
hi def link aetherException             Exception
hi def link aetherPanic                 Exception

syn match   aetherTypedef "\h\w*" display contained
syn match   aetherFunc "\h\w*" display contained
"syn keyword aetherKeyword union struct enum type nextgroup=aetherTypedef skipwhite skipempty
syn keyword aetherKeyword aether union struct bitstruct enum type capability nextgroup=aetherTypedef skipwhite
"syn keyword aetherKeyword union nextgroup=aetherTypedef skipwhite skipempty contained
syn keyword aetherKeyword fun nextgroup=aetherFunc skipwhite
"syn keyword aetherAdded test nextgroup=aetherFunc skipwhite
"syn keyword aetherTypedef asm nextgroup=aetherRepeat skipwhite skipempty
syn keyword aetherTodo contained TODO FIXME XXX NOTE
syn region  aetherComment  start="/\*" end="\*/" contains=aetherTodo,@Spell
syn match   aetherComment  '\v//.*$' contains=aetherTodo,@Spell
"syn match   aetherComment  '\v\#.*$' contains=aetherTodo,@Spell
"syn match   aetherPreProc  '\v\#\[\w+.{-}\]'

" aetherAsm
hi def link aetherAsmEntry Changed
hi def link aetherAsmMacro Macro
hi def link aetherAsmCmd SpecialComment
hi def link aetherAsmCall Changed
hi def link aetherAsmGoto Label

"syn keyword aetherAsmMacro main contained containedin=ALLBUT,aetherAsm
""syn keyword aetherAsmCmd mov contained containedin=ALLBUT,aetherAsm
"syn region aetherAsm start=/\v[^#]?(^|\{)\s*asm\s+\w+\s*\{/
    "\ end=/\v((^|\{)\s*asm\s+\w+\s*\{[^}]*\})|(\s*\})\s*$/
    "\ contains=aetherAsmEntry,aetherAsmCmd,aetherAsmCall,aetherAsmMacro,aetherAsmGoto,aetherComment,aetherConstant,aetherSymbol,aetherOperator,aetherType,aetherNumber,aetherFloat,aetherInteger
    "\ containedin=ALLBUT,aetherAsm keepend
"syn match aetherAsmEntry '\v\s*asm\s+' contained containedin=ALLBUT,aetherAsm
"syn match aetherAsmMacro /\v\s*asm\s+\w+/ contained containedin=ALLBUT,aetherAsm
"syn match aetherAsmMacro '\v<_\w+>' contained containedin=ALLBUT,aetherAsm
"syn match aetherAsmCmd '\v^\s+\.?\w+(\.\w+)*\s' contained containedin=ALLBUT,aetherAsm
"syn match aetherAsmCall '\v^\s+\.?\w+(\.\w+)*\s*$' contained containedin=ALLBUT,aetherAsm
"syn match aetherAsmGoto '\v^\s*\w+\ze:' contained containedin=ALLBUT,aetherAsm


syn sync fromstart
let b:current_syntax = "aether"
