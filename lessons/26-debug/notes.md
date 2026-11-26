# Aula 26 — Depuração

`xpcall` chama um tratador antes de desmontar a stack. `debug.traceback(mensagem, nivel)` devolve a mensagem seguida da cadeia de chamadas. O nível 2 começa em quem chamou o tratador.

`debug.getinfo(nivel, "n")` lê o nome disponível naquele nível. O nível 1 é a função que chamou `getinfo`. O nível 2 é quem a chamou. Um `return chamada()` é tail call: a função intermediária sai da cadeia e o nome lido é o de quem veio antes.

Referência: [`debug.traceback`](https://www.lua.org/manual/5.4/manual.html#pdf-debug.traceback) e [`debug.getinfo`](https://www.lua.org/manual/5.4/manual.html#pdf-debug.getinfo).
