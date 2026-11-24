# Aula 13 — Coroutines

Uma coroutine é um `thread`. Ela roda até chamar `coroutine.yield` ou até a função terminar. Outra coroutine só continua quando esta devolve o controle. Não há troca automática de tarefas.

`coroutine.create(funcao)` cria a coroutine em estado `suspended`. `coroutine.resume(co, ...)` começa ou continua a execução. O primeiro resultado é `true` quando a execução não deu erro. Os resultados seguintes são os valores do `yield` ou do `return`.

`coroutine.yield(...)` suspende e entrega esses valores ao `resume` que estava esperando. O valor passado no próximo `resume` vira o resultado do `yield`.

Quando a função termina, o estado fica `dead`. `coroutine.wrap(funcao)` devolve uma função que faz o `resume` e propaga o erro, em vez de devolver `false`.

Referência: [Lua 5.4 — Coroutines](https://www.lua.org/manual/5.4/manual.html#2.6).
