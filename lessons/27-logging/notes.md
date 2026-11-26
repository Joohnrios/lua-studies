# Aula 27 — Logging

Um log registra o que aconteceu e o nível da mensagem. Os níveis usados aqui são `debug`, `info`, `warn` e `error`, nessa ordem. Uma mensagem abaixo do nível mínimo é descartada e a função devolve `nil`.

A função devolve a linha `nível mensagem`. Quem chama decide se imprime, guarda ou testa essa linha.

Referência: [Function Calls](https://www.lua.org/manual/5.4/manual.html#3.4.10).
