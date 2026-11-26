# Aula 49 — Pack

A bolsa decide se a poção pode ser usada. O inventário continua dono das pilhas. O item continua dono da quantidade de cura e pede `heal` ao jogador.

`Pack.new` guarda o inventário e o item. `drink` consulta `count` pelo nome do item. Quando a contagem é menor que `1`, devolve o HP como está. Quando há pelo menos uma unidade, pede `take` de `1` e depois `use`.

`take` desconta a pilha. Quando a quantidade chega a zero, remove a pilha.

Referência: [Modules](https://www.lua.org/manual/5.4/manual.html#6.3) e [Control Structures](https://www.lua.org/manual/5.4/manual.html#3.3.4).
