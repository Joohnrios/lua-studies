# Aula 28 — Performance

Uma string é imutável. Cada `..` produz uma string nova. Para juntar uma lista, monte a table e chame `table.concat` uma vez.

`os.clock` devolve o tempo de CPU em segundos. A comparação desta aula mede as duas formas com a mesma quantidade de pedaços.

Referência: [Values and Types](https://www.lua.org/manual/5.4/manual.html#2.1), [Concatenation](https://www.lua.org/manual/5.4/manual.html#3.4.6) e [`table.concat`](https://www.lua.org/manual/5.4/manual.html#pdf-table.concat).
