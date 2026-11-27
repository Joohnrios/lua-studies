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

Finished lessons sit on one row per phase.

| Phase | Lessons | Status |
| --- | --- | --- |
| 1 · Language | 1 Values and types · 2 Variables and scope · 3 Operators and conditionals · 4 Loops and functions · 5 Tables · 6 Strings · 7 Iterators · 8 Functions as values · 9 Modules and require | Done |
| 2 · Language | 10 Metatables · 11 Metamethods · 12 Closures · 13 Coroutines · 14 Objects · 15 Errors · 16 Files · 17 Memory · 18 Lua 5.1 and 5.4 · 19 LuaJIT | Done |
| 3 · Engineering | 20 Modular architecture · 21 Responsibilities · 22 Encapsulation · 23 Composition and inheritance · 24 Strategy · 25 Unit tests · 26 Debugging · 27 Logging · 28 Performance · 29 Git practice | Done |
| 4 · Systems | 30 Player · 31 Creature · 32 Item · 33 Inventory · 34 Experience · 35 Combat · 36 Skills · 37 Quest · 38 NPC dialogue · 39 Events | Done |
| 5 · Portfolio | 40 RPG core · 41 Turn · 42 Encounter · 43 Reward · 44 Spoils · 45 Hunt · 46 Brief · 47 Ledger · 48 Item · 49 Pack · 50 Practice · 51 Creature · 52 Strike · 53 Mark · 54 Round · 55 Verdict · 56 Payout · 57 Order · 58 Notice · 59 Docket · 60 Stamp · 61 Gate · 62 Threshold · 63 Visits · 64 Permit · 65 Roster · 66 Presence · 67 Welcome · 68 Desk · 69 Slip · 70 Echo · 71 Chime · 72 Peal · 73 Chord · 74 Phrase · 75 Refrain · 76 Cue | Done |
