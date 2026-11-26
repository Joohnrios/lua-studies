# Aula 50 — Practice

O treino conta um uso quando uma poção realmente sai da bolsa. A skill continua dona do rank. O rank começa em `1` e os usos em `0`. Cada `5` usos sobem um rank: `1 + usos // 5`.

`Practice.new` guarda a bolsa e a skill. `sip` lê o estoque, pede `drink` e, se o estoque era maior que zero, pede `train(1)`. Devolve o HP que a bolsa devolveu. Uma bolsa vazia não treina.

Referência: [Modules](https://www.lua.org/manual/5.4/manual.html#6.3) e [Arithmetic Operators](https://www.lua.org/manual/5.4/manual.html#3.4.1).
