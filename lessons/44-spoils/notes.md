# Aula 44 — Spoils

Os espólios chamam dois modules nesta ordem. O encontro golpeia, se o tile for o mesmo. A recompensa lê o HP que restou e decide se a experiência sobe.

`Spoils.new` guarda o encontro e a recompensa. `collect` pede `act` e, em seguida, pede `grant`. Devolve o nível que a recompensa devolveu.

Referência: [Modules](https://www.lua.org/manual/5.4/manual.html#6.3) e [Metatables and Metamethods](https://www.lua.org/manual/5.4/manual.html#2.4).
