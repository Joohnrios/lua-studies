# Aula 71 — Chime

O sino pede a palavra ao eco. Quando a palavra é `"new"`, grava essa palavra num registro próprio. Quando a palavra é `"again"`, devolve a palavra e não grava. O eco continua dono de `"new"` e `"again"`. O registro continua dono da lista.

`Chime.new` guarda o eco e o registro. `ring` pede `hear`. Só o caminho `"new"` chama `emit`.

Em Python, o mesmo teste seria um `if` antes de guardar a palavra.

Referência: [Modules](https://www.lua.org/manual/5.4/manual.html#6.3) e [Control Structures](https://www.lua.org/manual/5.4/manual.html#3.3.4).
