# Aula 79 — Meter

O compasso lê quantas palavras `"first"` o pulso guarda, pede uma batida e compara os dois números. Quando a contagem sobe, devolve `"rise"`. Quando a contagem fica igual, devolve `"hold"`. O pulso continua dono do número. O compasso só escolhe a palavra.

`Meter.new` guarda o pulso. `play` pede `kept`, depois `beat`.

Em Python, a mesma comparação seria um `if` entre o valor de antes e o valor de depois.

Referência: [Modules](https://www.lua.org/manual/5.4/manual.html#6.3) e [Control Structures](https://www.lua.org/manual/5.4/manual.html#3.3.4).
