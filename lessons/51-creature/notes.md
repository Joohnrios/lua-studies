# Aula 51 — Creature

A criatura guarda o nome, a espécie, o HP, o máximo e a posição. `alive` é verdadeiro enquanto o HP é maior que zero. `damage` desconta e não deixa o valor passar de zero. `move` altera `x` e `y` e devolve os três eixos. O `z` permanece. `same_place` compara `x`, `y` e `z` com o outro ator.

O vigia pergunta isso à criatura. `Watch.new` guarda o jogador e a criatura. `share` pede `same_place`. O mesmo tile devolve `"meet"`. Um tile diferente devolve `"apart"`.

Referência: [Modules](https://www.lua.org/manual/5.4/manual.html#6.3) e [Relational Operators](https://www.lua.org/manual/5.4/manual.html#3.4.4).
