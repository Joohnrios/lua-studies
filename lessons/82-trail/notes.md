# Aula 82 — Trail

A trilha pede a palavra à marcha. Quando a palavra é `"moved"`, grava essa palavra num registro próprio. Quando a palavra é `"still"`, devolve a palavra e não grava. A marcha continua dona de `"moved"` e `"still"`. O registro continua dono da lista.

`Trail.new` guarda a marcha e o registro. `step` pede `walk`. Só o caminho `"moved"` chama `emit`.

Em Python, o mesmo teste seria um `if` antes de guardar a palavra.

Referência: [Modules](https://www.lua.org/manual/5.4/manual.html#6.3) e [Control Structures](https://www.lua.org/manual/5.4/manual.html#3.3.4).
