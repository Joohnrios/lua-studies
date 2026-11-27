# Aula 56 — Payout

O pagamento pede o veredito e depois pede a recompensa. O veredito continua dono da luta. A recompensa continua dona da regra de só pagar quando o HP é zero.

`Payout.new` guarda o veredito, a recompensa e a criatura. `close` pede `judge` e devolve o que `grant` devolver. Com a criatura viva, esse nível não muda. Com o desmaio, a experiência recebe o prêmio.

Em Python, o mesmo passo seria chamar uma função e devolver o resultado da outra.

Referência: [Modules](https://www.lua.org/manual/5.4/manual.html#6.3).
