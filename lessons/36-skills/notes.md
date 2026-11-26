# Aula 36 — Skills

Uma skill guarda o nome, o rank e o total de usos. O rank começa em `1` e os usos em `0`. Cada `5` usos sobem um rank.

`train` soma a quantidade aos usos e recalcula o rank: `1 + usos // 5`. O total de usos permanece. Uma quantidade menor que `1` deixa o rank como está. `train` devolve o rank.

Este module não é o do combate. Cada sistema guarda a própria regra.

A divisão `//` arredonda o quociente para baixo. O resto dessa divisão é o operador `%`.

Referência: [Metatables and Metamethods](https://www.lua.org/manual/5.4/manual.html#2.4) e [Arithmetic Operators](https://www.lua.org/manual/5.4/manual.html#3.4.1).
