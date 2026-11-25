# Aula 21 — Separação de responsabilidades

Cada module muda por um motivo. `health` aplica a regra dos pontos de vida e devolve o resultado. `notice` transforma esse resultado em texto. O formato da frase muda em `notice`. O limite de zero muda em `health`.

O resultado é a fronteira entre os dois: uma table com `hp` e `state`. Quem escreve a frase não altera o HP. Quem altera o HP não escolhe as palavras.

Referência: [require](https://www.lua.org/manual/5.4/manual.html#pdf-require).
