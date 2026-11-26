# Aula 46 — Brief

O brief escolhe a fala a partir do status da caçada. O diálogo continua dono das falas e do passo. A caçada continua dona do relatório `"open"` ou `"done"`.

`Brief.new` guarda o diálogo e a caçada. `say` pergunta o relatório. Quando a resposta é `"done"`, devolve o nome seguido de ` is done` e deixa o passo como está. Enquanto a resposta é `"open"`, pede `next` ao diálogo e devolve essa fala.

Referência: [Modules](https://www.lua.org/manual/5.4/manual.html#6.3) e [Control Structures](https://www.lua.org/manual/5.4/manual.html#3.3.4).
