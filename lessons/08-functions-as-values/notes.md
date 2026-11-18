# Aula 8 — Funções como valores

Uma função é um valor. Ela pode ficar numa variável, numa table, ser passada para outra função e ser devolvida.

`local function nome()` é um atalho. Por dentro, Lua declara `local nome` e depois atribui a função. Por isso o nome já existe dentro do corpo, e a função pode chamar a si mesma.

`local nome = function()` só cria o nome na linha seguinte. Dentro desse corpo, o mesmo nome ainda procura uma global.

`function tabela:metodo()` grava a função em `tabela.metodo` e declara um primeiro parâmetro chamado `self`. A chamada `tabela:metodo(5)` equivale a `tabela.metodo(tabela, 5)`. Sem os dois pontos, o primeiro argumento vira o `self`.

Uma função que usa uma variável local de fora guarda essa variável. Isso é uma closure. O estudo completo fica na Fase 2.

Referência: [Lua 5.4 — Function Definitions](https://www.lua.org/manual/5.4/manual.html#3.4.11) e [Function Calls](https://www.lua.org/manual/5.4/manual.html#3.4.10).
