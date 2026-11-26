# Aula 34 — Experience

A experiência guarda o nível e o XP que ainda não virou nível. O nível começa em `1` e o XP em `0`. O custo do próximo nível é o nível atual vezes `10`.

`gain` soma a quantidade recebida. Enquanto o XP alcança o custo, desconta esse custo e sobe um nível. Uma única chamada pode cruzar mais de um nível, porque o `while` repete o desconto. Uma quantidade menor que `1` deixa o nível como está. `gain` devolve o nível.

Este module não é o do inventário. Cada sistema guarda a própria regra.

Referência: [Metatables and Metamethods](https://www.lua.org/manual/5.4/manual.html#2.4) e [Control Structures](https://www.lua.org/manual/5.4/manual.html#3.3.4).
