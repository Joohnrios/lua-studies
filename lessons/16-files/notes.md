# Aula 16 — Arquivos

`io.open(nome, modo)` devolve um handle, ou `nil`, uma mensagem e um código numérico. O modo `"r"` lê, `"w"` apaga e escreve, `"a"` acrescenta no fim. Um `"b"` no fim do modo abre o arquivo em binário.

O handle guarda a posição atual. `file:write` aceita strings e números. `file:read("l")` lê a próxima linha sem o fim de linha. `file:read("n")` lê um numeral e devolve um número. `file:read("a")` lê o restante do arquivo. `file:seek("set")` volta para o início. `file:close()` fecha. `io.type` devolve `"file"` enquanto o handle está aberto e `"closed file"` depois do `close`.

Um arquivo aberto por `io.open` tem `__close`. A variável `local arquivo <close> = ...` chama esse metamétodo quando sai do bloco, inclusive quando um erro interrompe o bloco.

Referência: [Lua 5.4 — Input and Output](https://www.lua.org/manual/5.4/manual.html#6.8) e [To-be-closed Variables](https://www.lua.org/manual/5.4/manual.html#3.3.8).
