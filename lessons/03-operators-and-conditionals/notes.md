# Aula 3 — Operadores e condicionais

`/` é divisão real. `//` é divisão inteira, arredondada para baixo. `%` é o resto. `^` é potência, associativa à direita, e o resultado é float.

`~=` significa diferente. `not` sempre devolve booleano. `and` e `or` devolvem um dos operandos e param cedo.

Só `nil` e `false` são falsos. Por isso `not 0` é `false`, e `0 or "wild"` devolve `0`.

`if` exige `then` e fecha com `end`. O meio é `elseif`, uma palavra só. Não existe operador ternário.

`cond and valor or padrao` falha quando `valor` é `nil` ou `false`. Para preservar `false`, use `if`.

Referência: [Lua 5.4 — Expressions](https://www.lua.org/manual/5.4/manual.html#3.4).
