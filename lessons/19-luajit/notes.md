# Aula 19 — LuaJIT

O `lua` deste repositório continua sendo Lua 5.4. O comando `luajit` é outro interpretador: LuaJIT 2.1, na linguagem Lua 5.1, com extensões próprias.

`_VERSION` vale `Lua 5.1`. `unpack` e `setfenv` existem. `table.unpack` e `math.type` não existem. `//` e `<close>` não são aceitos por `loadstring`. A biblioteca `bit` faz operações bit a bit; `bit.band` é o E bit a bit. `require("ffi")` devolve a biblioteca de chamada a C.

O `for` numérico desta instalação cria um local por volta. As closures medidas devolvem o índice da própria volta.

Referência: [LuaJIT extensions](https://luajit.org/extensions.html).
