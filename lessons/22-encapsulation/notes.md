# Aula 22 — Encapsulamento

O estado fica numa variável local da função que constrói o objeto. A table devolvida só recebe funções. Essas funções leem e alteram a variável porque são closures.

Quem recebe a table chama as funções. A variável local não vira campo da table, então uma leitura desse campo devolve `nil`. A regra de negócio permanece dentro das funções.

Referência: [Visibility Rules](https://www.lua.org/manual/5.4/manual.html#3.5).
