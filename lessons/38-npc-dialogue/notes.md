# Aula 38 — NPC dialogue

O diálogo guarda o nome do NPC, as falas e o passo atual. O passo começa em `1`. `next` lê a fala desse passo, avança o passo e devolve a fala.

Uma chave ausente na table vale `nil`. Quando o passo passa da última fala, `next` devolve o nome seguido de ` is done` e deixa o passo onde está.

Este module não é o da quest. Cada sistema guarda a própria regra.

Referência: [Values and Types](https://www.lua.org/manual/5.4/manual.html#2.1) e [Metatables and Metamethods](https://www.lua.org/manual/5.4/manual.html#2.4).
