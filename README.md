# lua-studies

Study repository for Lua, focused on game systems and MMORPG backend work.

The language baseline is Lua 5.4. Lua 5.1 and LuaJIT compatibility comes later, because that dialect is common in game clients. This repository does not describe the private source, protocol, or architecture of any commercial game.

## Layout

```text
lessons/                 one subject at a time
playground/              local scratch, not committed
projects/lua-rpg-core/   portfolio project, started in phase 5
```

Lesson notes are in Portuguese. Code, commits, and the future `lua-rpg-core` documentation are in English.

## Requirements

- Lua 5.4.6 or another Lua 5.4 release
- [Lua Language Server](https://marketplace.visualstudio.com/items?itemName=sumneko.lua) (`sumneko.lua`)

Check the interpreter:

```powershell
lua -v
```

Run an example:

```powershell
lua lessons/01-syntax-and-types/examples/values.lua
```

## Progress

| Module | Status |
| --- | --- |
| Lua 5.4 environment | Done |
| Lesson 1 — Values and types | Done |
| Lesson 2 — Variables and scope | Done |
| Lesson 3 — Operators and conditionals | Done |
| Lesson 4 — Loops and functions | Done |
| Lesson 5 — Tables | Done |
| Lesson 6 — Strings | Done |
| Lesson 7 — Iterators | Done |
| Lesson 8 — Functions as values | Done |
| Lesson 9 — Modules and require | Done |
| Lesson 10 — Metatables | Done |
| Lesson 11 — Metamethods | Done |
| Lesson 12 — Closures | Done |
| Lesson 13 — Coroutines | Done |
| Lesson 14 — Objects | Done |
| Lesson 15 — Errors | Done |
| Lesson 16 — Files | Done |
| Lesson 17 — Memory | Done |
| Lesson 18 — Lua 5.1 and 5.4 | Done |
| Lesson 19 — LuaJIT | Done |
| Lesson 20 — Modular architecture | Done |
| Lesson 21 — Responsibilities | Done |
| Lesson 22 — Encapsulation | Done |
| Lesson 23 — Composition and inheritance | Done |
| Lesson 24 — Strategy | Done |
| Lesson 25 — Unit tests | Done |
| Lesson 26 — Debugging | Done |
| Lesson 27 — Logging | Done |
