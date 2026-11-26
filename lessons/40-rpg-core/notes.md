# Aula 40 — RPG core

O `lua-rpg-core` é o projeto de portfólio. Cada module fica na pasta do projeto, com uma regra só. O primeiro é o mundo: `projects/lua-rpg-core/world.lua`.

`World.new` guarda dois atores e um registro vazio. `look` compara `x`, `y` e `z`. O mesmo tile acrescenta `"meet"` e devolve essa palavra. Um tile diferente acrescenta `"apart"` e devolve essa palavra.

Os atores continuam donos das próprias coordenadas. O mundo lê os três eixos e anota o resultado.

Referência: [Metatables and Metamethods](https://www.lua.org/manual/5.4/manual.html#2.4) e [Relational Operators](https://www.lua.org/manual/5.4/manual.html#3.4.4).
