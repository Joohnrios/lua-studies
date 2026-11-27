# Aula 58 — Notice

O aviso pergunta o relatório da ordem. Enquanto o relatório é `"open"`, pede a próxima fala ao diálogo. Quando o relatório é `"done"`, devolve o nome seguido de `" is done"` e deixa o passo onde está. A ordem continua dona do status. O diálogo continua dono das falas e do passo.

`Notice.new` guarda o diálogo e a ordem. `say` pede `report`. No caminho `"done"`, não chama `next`.

Em Python, o mesmo teste seria um `if` antes de pedir a próxima fala.

Referência: [Modules](https://www.lua.org/manual/5.4/manual.html#6.3) e [Control Structures](https://www.lua.org/manual/5.4/manual.html#3.3.4).
