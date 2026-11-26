# Aula 48 — Item

O item guarda o nome, o tipo e a quantidade de cura. Quem limita o HP é o jogador. `use` pede `heal` e devolve o HP que o jogador devolveu.

`label` junta o nome, um espaço e o tipo.

Uma cura `0` passa `0` para `heal`, e o HP fica como está. Uma cura que passaria do máximo para no `max_hp`, porque essa regra já está no jogador.

Referência: [Modules](https://www.lua.org/manual/5.4/manual.html#6.3) e [Metatables and Metamethods](https://www.lua.org/manual/5.4/manual.html#2.4).
