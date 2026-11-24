# Aula 12 — Closures

Uma closure é uma função que continua enxergando as variáveis locais do escopo onde nasceu. A função guarda a variável, não uma cópia do valor daquele instante.

Cada chamada da função de fora cria variáveis novas. Duas closures feitas em chamadas diferentes não compartilham o contador.

No `for` numérico do Lua 5.4, a variável do laço é local de cada volta. Uma função criada dentro do laço guarda o valor daquela volta. Em Lua 5.1 a variável é uma só para o laço inteiro. Essa diferença volta na aula de compatibilidade.

Referência: [Lua 5.4 — Visibility Rules](https://www.lua.org/manual/5.4/manual.html#3.5).
