# Aula 43 — Reward

A recompensa decide se a experiência sobe. A experiência continua dona do nível, do XP e do custo `level * 10`.

`Reward.new` guarda a experiência e a quantidade do prêmio. `grant` lê o HP do alvo. Enquanto esse HP é maior que zero, devolve o nível como está. Quando o HP é zero, pede `gain` e devolve o nível que a experiência devolveu.

Referência: [Control Structures](https://www.lua.org/manual/5.4/manual.html#3.3.4) e [Metatables and Metamethods](https://www.lua.org/manual/5.4/manual.html#2.4).
