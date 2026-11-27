# Aula 64 — Permit

O passe pede um passo às visitas e depois lê o total. Se esse total é maior que zero, devolve `"met"`. Se ainda é zero, devolve `"none"`. As visitas continuam donas da contagem. O passe só escolhe a palavra. Um encontro antigo continua no total, então um `"apart"` posterior não apaga o `"met"`.

`Permit.new` guarda as visitas. `grant` pede `step` e depois `total`.

Em Python, o mesmo teste seria um `if` sobre o número.

Referência: [Modules](https://www.lua.org/manual/5.4/manual.html#6.3) e [Control Structures](https://www.lua.org/manual/5.4/manual.html#3.3.4).
