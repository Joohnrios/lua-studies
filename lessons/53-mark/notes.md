# Aula 53 — Mark

A marca grava o resultado do golpe. O golpe continua dono da decisão de descontar HP. O registro de eventos continua dono da sequência.

`Mark.new` guarda o golpe e os eventos. `land` lê o HP, pede `hit` e compara com o valor de antes. Quando o HP desce, grava `"hit"`. Quando o HP fica igual, grava `"miss"`. Devolve o HP que o golpe devolveu.

Referência: [Modules](https://www.lua.org/manual/5.4/manual.html#6.3) e [Control Structures](https://www.lua.org/manual/5.4/manual.html#3.3.4).
