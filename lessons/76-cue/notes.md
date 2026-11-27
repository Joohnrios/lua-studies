# Aula 76 — Cue

A deixa pede a contagem ao refrão. Quando a contagem é `1`, devolve `"first"`. Quando a contagem passa de `1`, devolve `"more"`. Uma palavra diferente começa de novo em `"first"`. O refrão continua dono do número. A deixa só escolhe a palavra.

`Cue.new` guarda o refrão. `call` pede `sing`.

Em Python, a mesma escolha seria um `if` sobre o número devolvido.

Referência: [Modules](https://www.lua.org/manual/5.4/manual.html#6.3) e [Control Structures](https://www.lua.org/manual/5.4/manual.html#3.3.4).
