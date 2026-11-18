# Aula 4 — Laços e funções

O `for` numérico inclui o limite. `for i = 1, 3` passa por 1, 2 e 3. O passo fica no terceiro valor: `for i = 3, 1, -1`. Se o início já passou do limite, o corpo não executa. A variável do `for` é local ao laço. Alterá-la dentro do corpo não muda a sequência.

`while condição do ... end` testa antes. `repeat ... until condição` executa pelo menos uma vez e para quando a condição é verdadeira. Um `local` declarado no `repeat` continua visível na condição do `until`.

Lua 5.4 tem `break`, que sai do laço mais interno. Não tem `continue`.

`local function` cria uma função visível no bloco, inclusive dentro dela mesma. Argumentos que faltam valem `nil`. Argumentos sobrando são ignorados. `return` pode devolver vários valores. Numa atribuição, cada variável recebe um valor e o que sobra é descartado. Se a chamada não está no fim da lista, só o primeiro valor permanece.

Para um argumento ausente, compare com `nil`. `amount or 1` também troca `false`, e não serve quando `false` é um valor válido. `0` é verdadeiro, então `0 or 1` continua `0`.

O `for` genérico, no formato `for x in ...`, fica para a aula de iteradores.

Referência: [Lua 5.4 — Statements](https://www.lua.org/manual/5.4/manual.html#3.3) e [Expressions](https://www.lua.org/manual/5.4/manual.html#3.4).
