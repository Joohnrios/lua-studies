# Aula 81 — March

A marcha pede à clave para marcar e depois olha se o `x` do jogador mudou. Quando muda, devolve `"moved"`. Quando fica igual, devolve `"still"`. A clave continua dona da palavra. O jogador continua dono da coordenada. Quem anda é o portão, quando o carimbo fecha.

`March.new` guarda a clave e o jogador. `walk` guarda o `x`, pede `mark` e compara.

Em Python, a mesma comparação seria um `if` entre o valor de antes e o valor de depois.

Referência: [Modules](https://www.lua.org/manual/5.4/manual.html#6.3) e [Control Structures](https://www.lua.org/manual/5.4/manual.html#3.3.4).
