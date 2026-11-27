# Aula 101 — O que construímos

Esta aula fecha o roteiro. Ela não adiciona módulo. Ela organiza o que as cem lições anteriores já fizeram, para você conseguir contar isso em voz alta.

O repositório é um estudo de Lua 5.4. As anotações estão em português. O código está em inglês. A base da linguagem é a 5.4 desta máquina. A aula 18 comparou 5.1 e 5.4. A aula 19 mediu o LuaJIT. O manual de referência da 5.4 é a fonte das regras da linguagem.

## As seis fases

1. Linguagem, lições 1 a 9. Valor, escopo, operador, laço, tabela, string, iterador, função como valor e módulo.
2. Linguagem, lições 10 a 19. Metatable, closure, corrotina, objeto, erro, arquivo, memória, diferença entre 5.1 e 5.4, LuaJIT.
3. Engenharia, lições 20 a 29. Módulo, responsabilidade, encapsulamento, composição, Strategy, teste, debug, log, desempenho e Git.
4. Sistemas, lições 30 a 39. Os dez sistemas do núcleo: jogador, criatura, item, inventário, experiência, combate, skill, quest, diálogo e eventos.
5. Portfólio, lições 40 a 100. Um caller por vez. Quem precisa de uma regra carrega o dono com `require` e pergunta. A fase fecha no caibro.
6. Esta aula. O mapa para explicar o conjunto.

## O núcleo que vale contar

O jogo pequeno cabe em uma cena.

O jogador tem nome, vida e posição. `move` soma `x` e `y` e devolve os três eixos. `z` fica. Dano para em 0. Cura negativa não muda a vida. Cura positiva para no máximo.

A criatura é outro módulo. Ela tem vida, lugar e `alive`. Ela não herda o jogador. Quem quer saber se os dois estão no mesmo tile pergunta à criatura.

O mundo só lê as coordenadas. O mesmo `x`, `y` e `z` viram `"meet"`. Tiles diferentes viram `"apart"`. Cada olhar entra no registro.

O combate tira `power` da vida e para em 0. O encontro só golpeia quando o mundo disse `"meet"`. A recompensa só dá experiência quando a vida chegou a 0. A quest sobe um passo quando o alvo estava vivo antes e ficou em 0 depois. Um alvo que já estava em 0 não conta de novo.

O item não escreve a vida sozinho. Ele pede `heal` ao jogador. O inventário empilha pelo nome. A poção só sai da bolsa se a contagem era maior que 0, e o treino sobe nesse caso.

A fala guarda o passo. A linha seguinte existe enquanto a chave ainda tem texto. O registro guarda as palavras na ordem. Um registro vazio devolve `nil` na última entrada e `0` numa contagem.

## A cena do portão

Esta é a história concreta.

A ordem ainda aberta faz o aviso devolver uma fala comum. O carimbo lê essa fala e responde `"open"`. O portão, com `"open"`, devolve as coordenadas e não chama `move`.

A quest de meta `1` e prêmio `10` fecha a ordem num `fill`. O aviso então devolve `"clerk is done"`. O carimbo responde `"closed"`. O portão chama `player:move(1, 0)`. O `x` sai de `1` e vai para `2`.

No exercício, a meta é `3`. A ordem continua aberta, o portão não anda e o `x` fica em `3`.

Quem vem depois do portão não move o jogador. Marcha, trilha, telhado, caibro: todos só observam se aquele passo aconteceu.

## O que as lições 70 a 100 treinam

São quatro perguntas, repetidas com nomes novos.

1. Escolher uma palavra, `"rise"` ou `"hold"`, comparando a contagem de antes com a de depois.
2. Gravar só `"rise"`. `"hold"` volta sem entrar no registro.
3. Devolver quantas vezes `"rise"` já foi gravado. Antes da primeira gravação, a contagem é `0`.
4. Ler essa contagem sem repetir a ação.

O telhado, a cumeeira, o frontão, o beiral, a cimalha, o sofito, a testeira, o caimento, a terça, o espigão, o rincão e o caibro são essa prática. O conceito novo tinha acabado quando o portão passou a ser o dono do movimento.

## Como falar disso

Uma versão curta, para abrir a conversa:

"Estudei Lua 5.4 do valor até um núcleo de RPG. Cada regra ficou no módulo dono dela. O caller só pergunta. Jogador e criatura são módulos separados. O portão só anda quando a quest fecha."

Uma versão média, se pedirem um exemplo:

"Com a ordem aberta, o carimbo responde open e o jogador fica no lugar. Com a quest de meta 1 concluída, o carimbo responde closed, o portão chama move(1, 0) e o x sobe de 1 para 2. Os módulos de depois não movem ninguém. Eles só leem se o x mudou."

Uma versão sobre Python, se a comparação aparecer:

"O tipo fica no valor, a função é um valor, a tabela faz o papel do dicionário e o require lembra o import. Ao mesmo tempo, só nil e false são falsos, a tabela começa em 1, o objeto é uma tabela com metatable chamada com dois-pontos, e o require executa o arquivo uma vez."

## Onde ler de novo

- O progresso das fases está no `README.md` da raiz.
- A lista de cada módulo e a regra que ele guarda está em `projects/lua-rpg-core/README.md`.
- O texto para o LinkedIn está em `lessons/101-what-we-built/linkedin.md`.
