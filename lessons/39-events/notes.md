# Aula 39 — Events

O registro de eventos guarda os nomes na ordem em que aconteceram. `emit` acrescenta o nome no fim da sequência e devolve o tamanho do registro. `#` numa sequência sem buracos é esse tamanho.

`count` percorre o registro e devolve quantas vezes aquele nome apareceu. Um nome ausente vale `0`.

Este module não é o do diálogo. Cada sistema guarda a própria regra.

Referência: [The Length Operator](https://www.lua.org/manual/5.4/manual.html#3.4.7) e [Metatables and Metamethods](https://www.lua.org/manual/5.4/manual.html#2.4).
