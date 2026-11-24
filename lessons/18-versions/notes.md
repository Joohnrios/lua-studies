# Aula 18 — Lua 5.1 e Lua 5.4

O código deste repositório roda em Lua 5.4. O manual da 5.1 descreve outra linha, ainda comum em cliente de jogo.

Em 5.1, `number` é um double. Desde a 5.3 existem os subtipos integer e float, e `math.type` distingue os dois. `//` também chegou na 5.3. `/` continua devolvendo float.

Em 5.1, `getfenv` e `setfenv` trocam o ambiente da função. Desde a 5.2 esses nomes saíram, e o ambiente é a variável `_ENV`. `module` foi descontinuado. `loadstring` cedeu o lugar a `load`. `unpack` passou a ser `table.unpack`.

No 5.1, o `#` de uma table usa o comprimento primitivo e não chama `__len`. Desde a 5.2, `__len` vale para table.

A 5.3 trocou a biblioteca `bit32` por operadores bit a bit e acrescentou `utf8`. A 5.4 acrescenta a variável to-be-closed, `<close>`.

O `for` numérico, no texto do manual 5.1 e do 5.2, cria um local novo a cada volta (`local v = var` dentro do laço). O exemplo mede esse laço no Lua 5.4 da máquina.

Referências: [Lua 5.1 — Values and Types](https://www.lua.org/manual/5.1/manual.html#2.2), [Environments](https://www.lua.org/manual/5.1/manual.html#2.9), [Metatables](https://www.lua.org/manual/5.1/manual.html#2.8), [Lua 5.2 — Incompatibilities](https://www.lua.org/manual/5.2/manual.html#8), [Length](https://www.lua.org/manual/5.2/manual.html#3.4.6), [Lua 5.3 — Incompatibilities](https://www.lua.org/manual/5.3/manual.html#8).
