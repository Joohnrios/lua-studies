# Aula 52 — Strike

O golpe pergunta ao vigia se a criatura está pronta. Pronta significa o mesmo tile e HP acima de zero. A batalha continua dona do poder e do piso em zero. A criatura continua dona do HP.

`Strike.new` guarda o vigia e a batalha. `hit` pede `ready`. Quando a resposta é falsa, devolve o HP da criatura como está. Quando a resposta é verdadeira, pede `swing` e devolve o HP que a batalha devolveu.

Referência: [Modules](https://www.lua.org/manual/5.4/manual.html#6.3) e [Control Structures](https://www.lua.org/manual/5.4/manual.html#3.3.4).
