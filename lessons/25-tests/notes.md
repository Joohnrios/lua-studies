# Aula 25 — Testes unitários

Um teste unitário chama uma regra com valores conhecidos e confere o retorno. `assert` interrompe quando o valor é `nil` ou `false`. `pcall` captura essa interrupção, então a suíte segue para o próximo teste.

Cada teste cobre uma regra. O nome impresso diz qual regra passou.

Referência: [assert](https://www.lua.org/manual/5.4/manual.html#pdf-assert) e [pcall](https://www.lua.org/manual/5.4/manual.html#pdf-pcall).
