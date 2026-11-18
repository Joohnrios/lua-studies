# Aula 5 — Tables

A table é a estrutura de dados de Lua. Lista, registro, conjunto e objeto usam o mesmo tipo.

A comparação com outra table é por referência. Atribuir uma table a outra variável não copia o conteúdo: as duas variáveis apontam para a mesma table.

Índices inteiros de uma sequência começam em 1. A posição 0 não faz parte dela. `t.name` é açúcar para `t["name"]`.

`nil` não fica armazenado. Atribuir `nil` remove a chave. Ler uma chave ausente também devolve `nil`.

`#t` é o tamanho de uma sequência, uma table com as chaves 1, 2, 3, sem buracos, até o primeiro `nil`. Se faltar uma posição no meio, o manual permite que `#` devolva qualquer uma das bordas. Não use `#` numa table com buraco.

Para percorrer uma sequência sem buracos, use `for i = 1, #t`. O `for` genérico fica na aula de iteradores.

`table.insert(t, valor)` acrescenta no fim. `t[#t + 1] = valor` faz o mesmo. `table.remove(t, posicao)` tira um elemento e desloca os seguintes. A posição padrão é a última.

Referência: [Lua 5.4 — Table Constructors](https://www.lua.org/manual/5.4/manual.html#3.4.9), [Length Operator](https://www.lua.org/manual/5.4/manual.html#3.4.7) e [Table Manipulation](https://www.lua.org/manual/5.4/manual.html#6.6).
