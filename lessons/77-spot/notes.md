# Aula 77 — Spot

O ponto pede a palavra à deixa. Quando a palavra é `"first"`, grava essa palavra num registro próprio. Quando a palavra é `"more"`, devolve a palavra e não grava. A deixa continua dona de `"first"` e `"more"`. O registro continua dono da lista.

`Spot.new` guarda a deixa e o registro. `mark` pede `call`. Só o caminho `"first"` chama `emit`.

Em Python, o mesmo teste seria um `if` antes de guardar a palavra.

Referência: [Modules](https://www.lua.org/manual/5.4/manual.html#6.3) e [Control Structures](https://www.lua.org/manual/5.4/manual.html#3.3.4).
