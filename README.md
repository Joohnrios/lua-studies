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
