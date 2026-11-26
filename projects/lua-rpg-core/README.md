# lua-rpg-core

Small RPG systems. Each module owns one rule. A caller loads that module with `require` and asks for the rule.

## Layout

```text
player.lua      name, hit points, and movement
world.lua       records whether two actors share a tile
turn.lua        asks the player to move, then asks the world to look
```

## Run an example

From the repository root:

```powershell
lua lessons/40-rpg-core/examples/main.lua
lua lessons/41-turn/examples/main.lua
```

## Player

`Player.new(name, hp, position)` stores the name, the hit points, the maximum, and `x`, `y`, `z`. The maximum starts equal to `hp`.

`move` adds `dx` and `dy` and returns the three coordinates. `z` stays. `damage` subtracts and stops at zero. `heal` adds, stops at the maximum, and leaves the total unchanged when `amount` is negative.

## World

`World.new(player, creature)` stores the two actors and an empty log.

`look` compares `x`, `y`, and `z`. The same tile appends `"meet"` and returns that word. A different tile appends `"apart"` and returns that word. `meetings` counts the `"meet"` entries.

The actors keep their own coordinates. The world only reads them and writes the result.

## Turn

`Turn.new(player, world)` stores the two modules. `play(dx, dy)` calls `player:move` and then `world:look`. It returns the word from the world. `rest` calls `world:look` and returns that word. The player does not move.
