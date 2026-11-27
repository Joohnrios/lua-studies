# Aula 100 — Rafter

O caibro pede a palavra ao rincão. Quando a palavra é `"rise"`, grava essa palavra num registro próprio. Quando a palavra é `"hold"`, devolve a palavra e não grava. O rincão continua dono de `"rise"` e `"hold"`. O registro continua dono da lista.

`Rafter.new` guarda o rincão e o registro. `place` pede `play`. Só o caminho `"rise"` chama `emit`.

Em Python, o mesmo teste seria um `if` antes de guardar a palavra.

Referência: [Modules](https://www.lua.org/manual/5.4/manual.html#6.3) e [Control Structures](https://www.lua.org/manual/5.4/manual.html#3.3.4).
