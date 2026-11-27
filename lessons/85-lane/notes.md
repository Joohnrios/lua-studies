# Aula 85 — Lane

A faixa pede a palavra à passada. Quando a palavra é `"rise"`, grava essa palavra num registro próprio. Quando a palavra é `"hold"`, devolve a palavra e não grava. A passada continua dona de `"rise"` e `"hold"`. O registro continua dono da lista.

`Lane.new` guarda a passada e o registro. `cross` pede `play`. Só o caminho `"rise"` chama `emit`.

Em Python, o mesmo teste seria um `if` antes de guardar a palavra.

Referência: [Modules](https://www.lua.org/manual/5.4/manual.html#6.3) e [Control Structures](https://www.lua.org/manual/5.4/manual.html#3.3.4).
