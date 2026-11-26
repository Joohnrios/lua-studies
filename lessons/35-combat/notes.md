# Aula 35 — Combat

O combate guarda o poder de um golpe. `strike` desconta esse poder do HP do alvo e não deixa o valor passar de zero. Um poder menor que 1 deixa o HP como está. A função devolve o HP que restou.

O alvo é uma table com `hp`. O combate conhece o poder. O alvo continua dono do HP.

Este module não é o da experiência. Cada sistema guarda a própria regra.

Referência: [Metatables and Metamethods](https://www.lua.org/manual/5.4/manual.html#2.4).
