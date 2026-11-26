# Aula 30 — Player

O jogador é a table que guarda quem está no mundo: nome, pontos de vida, o máximo desses pontos e a posição `x`, `y`, `z`. `move` altera `x` e `y` e devolve os três eixos. O eixo `z` permanece. `damage` reduz o HP e não deixa o valor passar de zero.

O teste chama essas regras com valores conhecidos. `assert` interrompe se o resultado diverge.

Referência: [Metatables and Metamethods](https://www.lua.org/manual/5.4/manual.html#2.4).
