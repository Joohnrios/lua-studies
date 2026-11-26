# Aula 31 — Creature

A criatura é outro ator no mapa. A table guarda nome, espécie, pontos de vida, o máximo desses pontos e a posição `x`, `y`, `z`. `alive` responde se o HP ainda é maior que zero. `damage` reduz o HP e não deixa o valor passar de zero. `move` altera `x` e `y` e devolve os três eixos. O eixo `z` permanece.

Este module não é o do jogador. Cada sistema guarda a própria regra.

Referência: [Metatables and Metamethods](https://www.lua.org/manual/5.4/manual.html#2.4).
