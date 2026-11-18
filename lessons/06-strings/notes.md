# Aula 6 — Strings

Uma string é uma sequência imutável de bytes. `"Pikachu"` e uma cópia alterada são valores diferentes. A variável só muda se receber uma string nova.

`#texto` conta bytes, não caracteres. Em UTF-8, `á` ocupa dois bytes, então o tamanho é 2. `string.upper` e `string.lower` tratam só o ASCII.

O primeiro byte é a posição 1. `string.sub(texto, inicio, fim)` inclui o fim. Índice negativo conta a partir do último byte.

`..` concatena. Número nos dois lados vira texto. Em conta aritmética, uma string numérica vira número: `"10" + 1` vale 11.

`string.format` monta texto com `%s` para string e `%d` para inteiro. `string.match(texto, padrao)` devolve o trecho encontrado. `%d` é um dígito e `+` significa um ou mais. O padrão de Lua não é expressão regular do Python.

`texto:upper()` é o mesmo que `string.upper(texto)`. O `:` entra na aula de objetos.

Referência: [Lua 5.4 — Strings](https://www.lua.org/manual/5.4/manual.html#3.1) e [String Manipulation](https://www.lua.org/manual/5.4/manual.html#6.4).
