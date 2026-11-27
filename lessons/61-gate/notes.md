# Aula 61 — Gate

O portão pede a palavra ao carimbo. Quando a palavra é `"closed"`, pede ao jogador para andar `1` em `x`. Quando a palavra é `"open"`, devolve o lugar atual. O carimbo continua dono da palavra. O jogador continua dono do passo.

`Gate.new` guarda o carimbo e o jogador. `pass` devolve três números: `x`, `y` e `z`. `move` também devolve esses três. No caminho aberto, o portão lê as coordenadas e não chama `move`.

`print` mostra os três porque a chamada é o único argumento. Em Python, o mesmo retorno seria uma tupla desempacotada.

Referência: [Modules](https://www.lua.org/manual/5.4/manual.html#6.3) e [Control Structures](https://www.lua.org/manual/5.4/manual.html#3.3.4).
