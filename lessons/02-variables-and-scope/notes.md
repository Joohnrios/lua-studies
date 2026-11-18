# Aula 2 — Variáveis e escopo

Um nome sem `local` é global. Ler um nome que não existe resulta em `nil`, sem erro.

`local` vale a partir da linha seguinte até o fim do bloco mais interno. Um bloco é o arquivo, `do ... end`, um `if`, um `for` ou o corpo de uma função.

Um `local` interno esconde um nome externo. A atribuição sem `local`, dentro de uma função, altera o `local` externo já visível.

`local x = x` lê o `x` anterior. O novo `x` só passa a existir na linha de baixo.

Referência: [Lua 5.4 — Visibility Rules](https://www.lua.org/manual/5.4/manual.html#3.5).
