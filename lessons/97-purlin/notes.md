# Aula 97 — Purlin

A terça pede a palavra ao caimento. Quando a palavra é `"rise"`, grava essa palavra num registro próprio. Quando a palavra é `"hold"`, devolve a palavra e não grava. O caimento continua dono de `"rise"` e `"hold"`. O registro continua dono da lista.

`Purlin.new` guarda o caimento e o registro. `seat` pede `play`. Só o caminho `"rise"` chama `emit`.

Em Python, o mesmo teste seria um `if` antes de guardar a palavra.

Referência: [Modules](https://www.lua.org/manual/5.4/manual.html#6.3) e [Control Structures](https://www.lua.org/manual/5.4/manual.html#3.3.4).
