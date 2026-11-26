# Aula 32 — Item

Um item é um objeto carregável, separado da criatura. A table guarda nome, tipo e a cura. `apply` soma a cura ao HP da criatura e não deixa o valor passar de `max_hp`. Uma cura menor que 1 deixa o HP como está.

O item conhece a própria cura. A criatura continua dona do HP.

Referência: [Metatables and Metamethods](https://www.lua.org/manual/5.4/manual.html#2.4).
