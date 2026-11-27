# Aula 94 — Soffit

O sofito pede a palavra à cimalha. Quando a palavra é `"rise"`, grava essa palavra num registro próprio. Quando a palavra é `"hold"`, devolve a palavra e não grava. A cimalha continua dona de `"rise"` e `"hold"`. O registro continua dono da lista.

`Soffit.new` guarda a cimalha e o registro. `set` pede `play`. Só o caminho `"rise"` chama `emit`.

Em Python, o mesmo teste seria um `if` antes de guardar a palavra.

Referência: [Modules](https://www.lua.org/manual/5.4/manual.html#6.3) e [Control Structures](https://www.lua.org/manual/5.4/manual.html#3.3.4).
