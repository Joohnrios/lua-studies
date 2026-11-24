# Aula 14 — Orientação a objetos

Lua não tem classe na linguagem. Um objeto é uma table. Os métodos ficam em outra table, ligada por `__index`. O construtor devolve a table do objeto com essa metatable.

`Conta.__index = Conta` faz a própria table de métodos servir de metatable. `objeto:metodo(x)` equivale a `objeto.metodo(objeto, x)`.

Uma especialização é outra table. A metatable dela aponta `__index` para a table base, e o objeto aponta `__index` para a especialização. A busca passa pelo objeto, depois pela especialização, depois pela base.

Para chamar o método da base com o mesmo nome, use `Base.metodo(self, ...)`. Os dois pontos nesse ponto chamariam de novo o método da especialização.

Referência: [Lua 5.4 — Metatables and Metamethods](https://www.lua.org/manual/5.4/manual.html#2.4).
