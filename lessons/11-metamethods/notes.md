# Aula 11 — Metamethods

Um metamethod é uma função guardada na metatable com um nome reservado. Lua chama essa função quando a operação correspondente acontece.

`__index` lê uma chave ausente. `__newindex` entra na atribuição de uma chave ausente. Se a chave já existe, a atribuição grava direto na table.

`__add` responde à soma. `__tostring` responde a `tostring` e ao `print`. `__call` deixa a table ser chamada como função. `__eq` compara dois valores quando os dois têm o mesmo metamethod.

`rawget`, `rawset` e `rawequal` ignoram esses metamethods.

Referência: [Lua 5.4 — Metatables and Metamethods](https://www.lua.org/manual/5.4/manual.html#2.4).
