# Aula 54 — Round

A rodada repete o golpe enquanto duas coisas continuam verdadeiras: o número de passos ainda é menor que o limite, e a criatura está viva. O `while` testa isso antes de cada passo. A marca grava `"hit"` ou `"miss"`. A criatura responde `alive`.

`Round.new` guarda a marca, a criatura e o limite. `fight` pede `land` e soma um passo. Quando a criatura desmaia, ou quando os passos alcançam o limite, devolve quantos passos rodaram.

Referência: [Modules](https://www.lua.org/manual/5.4/manual.html#6.3) e [Control Structures](https://www.lua.org/manual/5.4/manual.html#3.3.4).
