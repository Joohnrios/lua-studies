# Aula 10 — Metatables

Uma metatable é uma table comum que Lua consulta quando uma operação não cabe na table original. `setmetatable(tabela, meta)` liga as duas e devolve `tabela`. `getmetatable(tabela)` devolve a meta.

`__index` entra quando a chave não existe. Se `__index` for uma table, Lua procura a chave nela. Se for uma função, Lua chama essa função com a table e a chave.

Uma chave com valor `false` existe. `__index` não é chamado. Uma chave com `nil` não existe, e a consulta segue para `__index`.

Atribuir a chave grava na table original. A table apontada por `__index` não muda. `rawget(tabela, chave)` lê só a table original e ignora a metatable.

Vários objetos podem compartilhar a mesma table de métodos por `__index`. Cada um continua com os próprios dados. Os outros metamethods ficam para a próxima aula.

Referência: [Lua 5.4 — Metatables and Metamethods](https://www.lua.org/manual/5.4/manual.html#2.4).
