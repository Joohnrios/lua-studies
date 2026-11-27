# Aula 55 — Verdict

O veredito pede a luta e depois pergunta à criatura se ela ainda está viva. A rodada continua dona dos passos e dos acertos. A criatura continua dona do HP.

`Verdict.new` guarda a rodada. `judge` pede `fight`. Se `alive` ainda é verdadeiro, devolve `"stand"`. Se a criatura desmaiou, devolve `"faint"`.

Em Python, o mesmo teste seria um `if`.

Referência: [Modules](https://www.lua.org/manual/5.4/manual.html#6.3) e [Control Structures](https://www.lua.org/manual/5.4/manual.html#3.3.4).
