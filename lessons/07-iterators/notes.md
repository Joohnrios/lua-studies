# Aula 7 — Iteradores

O `for` genérico chama uma função até o primeiro resultado ser `nil`.

```lua
for variável in iterador, estado, valor_inicial do
end
```

A chamada é `iterador(estado, valor_anterior)`. Na primeira volta, o valor anterior é o `valor_inicial`.

`ipairs(lista)` percorre a sequência a partir de 1 e para no primeiro `nil`. Um buraco esconde o restante da lista. `pairs(tabela)` visita todas as chaves, inclusive nomes e índices depois do buraco. A ordem de `pairs` não é garantida.

Um iterador próprio devolve esses três valores: a função, o estado e o valor inicial. `string.gmatch` também devolve um iterador.

Durante um `pairs`, não crie chaves novas na tabela. Alterar ou apagar uma chave que já existe é permitido.

Referência: [Lua 5.4 — For Statement](https://www.lua.org/manual/5.4/manual.html#3.3.5), [pairs](https://www.lua.org/manual/5.4/manual.html#pdf-pairs) e [ipairs](https://www.lua.org/manual/5.4/manual.html#pdf-ipairs).
