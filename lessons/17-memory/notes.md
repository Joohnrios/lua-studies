# Aula 17 — Memória

Lua libera sozinha a memória que o programa não alcança mais. Strings, tables, funções, threads e userdata entram nesse controle. Uma table continua viva enquanto uma variável ou outra table viva aponta para ela. Apagar a chave com `nil` tira esse apontamento. A liberação acontece quando o coletor roda, não no instante da atribuição.

`collectgarbage("collect")` faz um ciclo completo. `collectgarbage("count")` devolve os Kbytes em uso, com parte fracionária. O coletor também trabalha em modo incremental, intercalado com o programa, ou em modo geracional, com coletas menores nos objetos recentes.

Uma weak table ignora referências fracas na hora de decidir o que ainda está vivo. O campo `__mode` vale `"v"` para valores fracos, `"k"` para chaves fracas e `"kv"` para os dois. Se a chave ou o valor é coletado, o par sai da table. Números e strings não são removidos dessas tables. Uma table construída no código é removida quando só restam referências fracas.

`__gc` é um finalizador. Ele precisa já existir na metatable no momento do `setmetatable`. O coletor chama esse metamétodo depois de perceber que a table morreu. O fechamento com `<close>` continua sendo a forma de soltar um arquivo no fim do bloco.

Referência: [Lua 5.4 — Garbage Collection](https://www.lua.org/manual/5.4/manual.html#2.5) e [`collectgarbage`](https://www.lua.org/manual/5.4/manual.html#pdf-collectgarbage).
