# Aula 24 — Padrão Strategy

Strategy guarda uma regra intercambiável dentro do objeto. O lutador não contém a fórmula do dano. Ele chama a função que recebeu. Trocar a função troca a regra e o tipo do lutador permanece o mesmo.

A função recebe o lutador e o alvo. Assim a regra pode usar um campo do lutador, como `level`, sem o lutador conhecer cada fórmula.

Referência: [Visibility Rules](https://www.lua.org/manual/5.4/manual.html#3.5).
