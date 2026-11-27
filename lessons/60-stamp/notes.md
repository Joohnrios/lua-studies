# Aula 60 — Stamp

O carimbo pede ao dossiê para ouvir uma frase. Se essa frase é o nome seguido de `" is done"`, devolve `"closed"`. Nas outras frases, devolve `"open"`. O dossiê continua dono da gravação. O aviso continua dono de montar a frase. O carimbo só reconhece o fechamento.

`Stamp.new` guarda o dossiê e o nome. `press` pede `hear` e compara a frase devolvida.

Em Python, o mesmo teste seria um `if` sobre o texto.

Referência: [Modules](https://www.lua.org/manual/5.4/manual.html#6.3) e [Relational Operators](https://www.lua.org/manual/5.4/manual.html#3.4.4).
