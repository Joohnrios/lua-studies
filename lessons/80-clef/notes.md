# Aula 80 — Clef

A clave pede a palavra ao compasso. Quando a palavra é `"rise"`, grava essa palavra num registro próprio. Quando a palavra é `"hold"`, devolve a palavra e não grava. O compasso continua dono de `"rise"` e `"hold"`. O registro continua dono da lista.

`Clef.new` guarda o compasso e o registro. `mark` pede `play`. Só o caminho `"rise"` chama `emit`.

Em Python, o mesmo teste seria um `if` antes de guardar a palavra.

Referência: [Modules](https://www.lua.org/manual/5.4/manual.html#6.3) e [Control Structures](https://www.lua.org/manual/5.4/manual.html#3.3.4).
