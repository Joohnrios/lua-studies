# Aula 91 — Gable

O frontão pede a palavra à cumeeira. Quando a palavra é `"rise"`, grava essa palavra num registro próprio. Quando a palavra é `"hold"`, devolve a palavra e não grava. A cumeeira continua dona de `"rise"` e `"hold"`. O registro continua dono da lista.

`Gable.new` guarda a cumeeira e o registro. `fit` pede `play`. Só o caminho `"rise"` chama `emit`.

Em Python, o mesmo teste seria um `if` antes de guardar a palavra.

Referência: [Modules](https://www.lua.org/manual/5.4/manual.html#6.3) e [Control Structures](https://www.lua.org/manual/5.4/manual.html#3.3.4).
