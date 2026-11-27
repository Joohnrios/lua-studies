Voltar à base foi melhor do que eu esperava.

Passei anos perto do universo de Pokémon. Em algum momento o caminho pediu Lua, e eu fui estudar a linguagem do zero, sem largar o Python do dia a dia.

Deixei o estudo público: https://github.com/Joohnrios/lua-studies

São 100 lições de Lua 5.4, e mais uma no final só para eu conseguir explicar o conjunto. Começa em valor, nil, tabela, função e módulo. Passa por teste e por como separar responsabilidade. Termina num RPG pequeno: jogador, criatura, item, inventário, experiência, combate, quest, diálogo e eventos. Cada coisa ficou no arquivo dela. O próximo arquivo pergunta, em vez de repetir a regra.

Python ajuda nessa leitura. O tipo está no valor, função pode ser passada pra frente, tabela parece dicionário, e require lembra import. Uma função também pode devolver mais de um valor.

Lua cobra outras coisas, e algumas me pegaram no começo. 0 e string vazia são verdadeiros. Só nil e false derrubam um if. Índice de tabela começa em 1. Objeto é tabela com metatable, e método vai com dois-pontos. O require roda o arquivo uma vez e segura o retorno. Local só vale a partir da linha seguinte.

O pedaço que eu mais gostei foi o portão. A criatura tem módulo próprio. O combate não mexe na quest. Quando a ordem fecha, o portão anda um passo. O que vem depois só olha se o jogador saiu do lugar.

Anotação das aulas em português. Código em inglês.
