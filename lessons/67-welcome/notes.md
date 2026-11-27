# Aula 67 — Welcome

A recepção pede o booleano à presença. Quando ele é `true`, pede a próxima fala ao diálogo. Quando ele é `false`, devolve o nome seguido de `" is away"` e deixa o passo onde está. A presença continua dona do booleano. O diálogo continua dono das falas e do passo.

`Welcome.new` guarda a presença e um diálogo próprio, separado das falas do aviso. `greet` pede `mark`. No caminho `false`, não chama `next`.

Em Python, o mesmo teste seria um `if` antes de pedir a próxima fala.

Referência: [Modules](https://www.lua.org/manual/5.4/manual.html#6.3) e [Control Structures](https://www.lua.org/manual/5.4/manual.html#3.3.4).
