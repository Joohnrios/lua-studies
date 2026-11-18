# Aula 1 — Valores e tipos

Lua é dinamicamente tipada. O tipo pertence ao valor, não à variável.

Os oito tipos básicos são `nil`, `boolean`, `number`, `string`, `function`, `userdata`, `thread` e `table`. `userdata` e `thread` ficam para depois.

`type(valor)` devolve o nome do tipo como string. `nil` e a string `"nil"` são coisas diferentes.

Desde o Lua 5.3, inteiro e decimal continuam sendo `number`. `math.type` distingue `"integer"` de `"float"`. `1 == 1.0` é verdadeiro.

Só `nil` e `false` são valores falsos. `0`, `""` e `{}` tornam uma condição verdadeira.

Declare variáveis com `local`. Escopo é o assunto da próxima aula.

Referência: [Lua 5.4 Reference Manual](https://www.lua.org/manual/5.4/).

## Exercício

Resolva `exercises/types.lua` antes de olhar qualquer correção. Envie o arquivo com as previsões originais, inclusive as que o interpretador contrariar.
