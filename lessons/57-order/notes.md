# Aula 57 — Order

A ordem pede o pagamento e, se uma criatura viva desmaia nesse pagamento, pede um passo à quest. O pagamento continua dono do prêmio. A criatura continua dona de `alive`. A quest continua dona do progresso.

`Order.new` guarda o pagamento e a quest. `fill` olha se a criatura está viva, pede `close` e devolve o nível. O passo só entra quando ela estava viva antes e não está mais. Uma criatura que continua de pé não conta. Uma criatura que já estava desmaiada não conta outro passo.

Em Python, o mesmo teste seria um `if` com as duas condições.

Referência: [Modules](https://www.lua.org/manual/5.4/manual.html#6.3) e [Control Structures](https://www.lua.org/manual/5.4/manual.html#3.3.4).
