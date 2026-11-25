# Aula 23 — Composição e herança

Herança serve quando o novo objeto é do mesmo tipo. `SuperPotion` fica na cadeia de `Potion` e especializa `apply`. A busca do método passa pelo objeto, pela especialização e pela base.

Composição serve quando o objeto possui outro. O curandeiro guarda uma poção e chama `apply` nela. Ele não entra na cadeia de `Potion`: a metatable dele não é a da poção, e o campo `heal` não aparece nele.

Referência: [Metatables and Metamethods](https://www.lua.org/manual/5.4/manual.html#2.4).
