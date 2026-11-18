# Aula 9 — Modules e require

Um module é um arquivo que devolve uma table. `require("nome")` procura esse arquivo, executa uma vez e guarda o resultado em `package.loaded`. A segunda chamada devolve a mesma table e não executa o arquivo de novo.

O nome com ponto vira diretório: `require("game.health")` procura `game/health.lua`. O `?` em `package.path` é o lugar do nome. A partir da raiz do repositório, `.\?.lua` acha um arquivo na pasta atual. Para um module dentro de `lessons`, acrescente o diretório ao `package.path`.

O que fica em `local` dentro do arquivo não sai no `require`. Só o que está na table devolvida é público.

Se o arquivo não devolve nada e não preenche `package.loaded`, `require` devolve `true`.

A função `module()`, comum em Lua 5.1, não faz parte do Lua 5.4. Não use.

Referência: [require](https://www.lua.org/manual/5.4/manual.html#pdf-require), [package.path](https://www.lua.org/manual/5.4/manual.html#pdf-package.path) e [package.loaded](https://www.lua.org/manual/5.4/manual.html#pdf-package.loaded).
