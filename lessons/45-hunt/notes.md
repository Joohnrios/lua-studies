# Aula 45 — Hunt

A caçada conta um passo da quest quando um alvo que ainda tinha HP desmaia nesta chamada. A quest continua dona da meta e do progresso. Os espólios continuam donos do golpe e da experiência.

`Hunt.new` guarda os espólios e a quest. `finish` pede `collect`. Se o HP era maior que zero e ficou em zero, pede `advance(1)` à quest. A função devolve o nível que os espólios devolveram.

Um alvo que já estava em zero não conta outro passo. Um alvo que continua com HP também não conta.

Referência: [Modules](https://www.lua.org/manual/5.4/manual.html#6.3) e [Control Structures](https://www.lua.org/manual/5.4/manual.html#3.3.4).
