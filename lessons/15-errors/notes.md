# Aula 15 — Tratamento de erros

`error(mensagem, nivel)` interrompe a função e sobe até alguém capturar. O nível diz qual chamada aparece na mensagem. O nível 1 é a própria chamada de `error`. O nível 2 é quem chamou essa função.

`assert(valor, mensagem)` devolve o valor quando ele não é `nil` nem `false`. Nesses dois casos, chama `error`. `0` passa, porque zero é verdadeiro.

`pcall(funcao, ...)` chama a função em modo protegido. Se ela termina, o primeiro resultado é `true` e os seguintes são os retornos dela. Se ela falha, o primeiro resultado é `false` e o segundo é o valor do erro, em geral uma string com arquivo e linha.

`xpcall(funcao, tratador, ...)` faz o mesmo e chama o tratador com a mensagem antes de desmontar a stack. Não existe `try`/`catch` na linguagem.

Referência: [Lua 5.4 — Error Handling](https://www.lua.org/manual/5.4/manual.html#2.3).
