# Aula 41 — Turn

O turno é quem chama os outros modules. `require` carrega cada module uma vez e devolve a table que o arquivo retornou. O jogador continua dono do movimento. O mundo continua dono da comparação do tile.

`Turn.new` guarda o jogador e o mundo. `play` pede `move` ao jogador e, em seguida, pede `look` ao mundo. O turno devolve a palavra que o mundo devolveu.

Referência: [Modules](https://www.lua.org/manual/5.4/manual.html#6.3) e [Metatables and Metamethods](https://www.lua.org/manual/5.4/manual.html#2.4).
