# Aula 37 — Quest

Uma quest guarda o nome, a meta e o progresso. O progresso começa em `0`. `advance` soma a quantidade e não deixa o progresso passar da meta. Uma quantidade menor que `1` deixa o progresso como está. `advance` devolve o progresso.

`done` devolve `true` quando o progresso alcança a meta. Antes disso, devolve `false`.

Este module não é o da skill. Cada sistema guarda a própria regra.

Referência: [Metatables and Metamethods](https://www.lua.org/manual/5.4/manual.html#2.4) e [Relational Operators](https://www.lua.org/manual/5.4/manual.html#3.4.4).
