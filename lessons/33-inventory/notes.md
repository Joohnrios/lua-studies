# Aula 33 — Inventory

O inventário guarda pilhas. Cada pilha tem nome e quantidade. `add` procura uma pilha com o mesmo nome. Se acha, soma a quantidade e devolve o novo total. Se não acha, cria uma pilha no fim da sequência e devolve a quantidade recebida.

`count` devolve a quantidade daquele nome. Um nome ausente vale `0`. A ordem das pilhas é a ordem em que os nomes apareceram.

Referência: [The Length Operator](https://www.lua.org/manual/5.4/manual.html#3.4.7) e [table](https://www.lua.org/manual/5.4/manual.html#6.6).
