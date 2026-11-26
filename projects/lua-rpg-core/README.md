# lua-rpg-core

Small RPG systems. Each module owns one rule. A caller loads that module with `require` and asks for the rule.

## Layout

```text
world.lua       records whether two actors share a tile
```

## Run an example

From the repository root:

```powershell
lua lessons/40-rpg-core/examples/main.lua
```

## World

`World.new(player, creature)` stores the two actors and an empty log.

`look` compares `x`, `y`, and `z`. The same tile appends `"meet"` and returns that word. A different tile appends `"apart"` and returns that word. `meetings` counts the `"meet"` entries.

The actors keep their own coordinates. The world only reads them and writes the result.
