# Aula 47 — Ledger

O livro registra a fala que o brief devolveu. O brief continua dono da escolha entre a próxima fala e o fechamento. O registro de eventos continua dono da sequência.

`Ledger.new` guarda o brief e os eventos. `hear` pede `say`, grava essa string com `emit` e devolve a mesma string. Um registro vazio não tem última fala: o valor nessa posição é `nil`.

Referência: [Modules](https://www.lua.org/manual/5.4/manual.html#6.3) e [The Length Operator](https://www.lua.org/manual/5.4/manual.html#3.4.7).
