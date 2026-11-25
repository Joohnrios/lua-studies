# Aula 20 — Arquitetura modular

Um module é uma fronteira. O arquivo devolve só as operações que outro arquivo pode chamar. Quem usa a regra faz `require` de quem é dono dela. O module da regra não faz `require` de quem o usa.

`travel` pede o passo a `position`. A conta da distância fica em `position`. A função `same_floor` permanece local, então não aparece na table devolvida.

Se dois modules fazem `require` um do outro, o carregamento entra de novo no arquivo que ainda não terminou. Nesta instalação, isso estoura a stack.

Referência: [require](https://www.lua.org/manual/5.4/manual.html#pdf-require).
