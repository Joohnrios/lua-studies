# lua-rpg-core

Small RPG systems. Each module owns one rule. A caller loads that module with `require` and asks for the rule.

## Layout

```text
player.lua      name, hit points, and movement
world.lua       records whether two actors share a tile
turn.lua        asks the player to move, then asks the world to look
battle.lua      subtracts power from a target and stops at zero
encounter.lua   swings only when the world reports a shared tile
experience.lua  level and the XP still short of the next level
reward.lua      grants XP only when the target HP is zero
spoils.lua      strikes through the encounter, then asks the reward
quest.lua       goal, progress, and whether the quest is done
hunt.lua        counts one quest step when a living target faints
dialogue.lua    speaks the next line and remembers the step
brief.lua       speaks while the hunt is open, and closes it when done
```

## Run an example

From the repository root:

```powershell
lua lessons/40-rpg-core/examples/main.lua
lua lessons/41-turn/examples/main.lua
lua lessons/42-encounter/examples/main.lua
lua lessons/43-reward/examples/main.lua
lua lessons/44-spoils/examples/main.lua
lua lessons/45-hunt/examples/main.lua
lua lessons/46-brief/examples/main.lua
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

## Battle

`Battle.new(power)` stores the power. `swing` subtracts it from `target.hp` and stops at zero. Power below 1 leaves the hit points unchanged.

## Encounter

`Encounter.new(world, battle)` stores the two modules. `act` calls `world:look`. The word `"apart"` returns `target.hp` unchanged. The word `"meet"` calls `battle:swing` and returns the hit points that remain. `spare` calls `world:look` and returns that word. The target HP stays unchanged.

## Experience

`Experience.new` starts at level `1` with `0` XP. The next level costs `level * 10`. `gain` adds the amount, spends that cost while the XP reaches it, and returns the level. An amount below 1 leaves the level unchanged. `room` returns the current cost minus the stored XP.

## Reward

`Reward.new(experience, amount)` stores the experience module and the prize. `grant` returns the current level while `target.hp` is above zero. At zero it calls `experience:gain` and returns that level. `offer` returns the prize when `target.hp` is zero, and `0` otherwise. It leaves the level and the stored XP unchanged.

## Spoils

`Spoils.new(encounter, reward)` stores the two modules. `collect` calls `encounter:act` and then `reward:grant`. It returns the level from the reward. `peek` calls `reward:offer` and returns that number. It does not strike, and it leaves the level and the stored XP unchanged.

## Quest

`Quest.new(name, goal)` starts at progress `0`. `advance` adds the amount and stops at the goal. An amount below 1 leaves the progress unchanged. `done` is true when the progress reaches the goal. `status` returns `"done"` or `"open"`.

## Hunt

`Hunt.new(spoils, quest)` stores the two modules. `finish` calls `spoils:collect`. When the target HP was above zero and the call leaves it at zero, the hunt calls `quest:advance(1)`. It returns the level from the spoils. `report` returns the quest status, `"done"` or `"open"`.

## Dialogue

`Dialogue.new(name, lines)` starts at step `1`. `next` returns the line at that step and then advances it. Past the last line, it returns the name followed by ` is done` and leaves the step where it is. `finished` is true when the current step has no line.

## Brief

`Brief.new(dialogue, hunt)` stores the two modules. `say` calls `hunt:report`. The word `"done"` returns the dialogue name followed by ` is done` and leaves the step unchanged. The word `"open"` calls `dialogue:next` and returns that line. `waiting` is true while the report is `"open"`, and false when it is `"done"`. It does not speak.
