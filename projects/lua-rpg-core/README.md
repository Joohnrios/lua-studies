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
events.lua      records names in the order they happen
ledger.lua      stores each line the brief speaks
item.lua        asks the player to heal, and keeps its own label
inventory.lua   stacks items by name and removes an empty stack
pack.lua        drinks one potion when the bag still holds one
skill.lua       rank rises by one step for every five uses
practice.lua    trains one use when a drink leaves the bag
creature.lua    owns hit points, place, and whether it still stands
watch.lua       asks the creature whether it shares the player's tile
strike.lua      swings only when the creature is ready
mark.lua        records hit when the HP drops, and miss when it stays
round.lua       repeats a blow until the creature faints or the limit ends
verdict.lua     names a faint or a creature that is still standing
payout.lua      asks for the verdict, then asks the reward to grant
order.lua       counts one quest step when a living creature faints
notice.lua      speaks while the order is open, and closes it when done
docket.lua      stores each line the notice speaks
stamp.lua       names a closing line and leaves the other lines open
gate.lua        steps forward only when the stamp is closed
threshold.lua   asks the gate to pass, then asks the world to look
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
lua lessons/47-ledger/examples/main.lua
lua lessons/48-item/examples/main.lua
lua lessons/49-pack/examples/main.lua
lua lessons/50-practice/examples/main.lua
lua lessons/51-creature/examples/main.lua
lua lessons/52-strike/examples/main.lua
lua lessons/53-mark/examples/main.lua
lua lessons/54-round/examples/main.lua
lua lessons/55-verdict/examples/main.lua
lua lessons/56-payout/examples/main.lua
lua lessons/57-order/examples/main.lua
lua lessons/58-notice/examples/main.lua
lua lessons/59-docket/examples/main.lua
lua lessons/60-stamp/examples/main.lua
lua lessons/61-gate/examples/main.lua
lua lessons/62-threshold/examples/main.lua
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

## Events

`Events.new` starts with an empty log. `emit` appends a name and returns the log length. `count` returns how many times that name appears. A missing name counts `0`. `last` returns the name at the end of the log. An empty log returns nil.

## Ledger

`Ledger.new(brief, events)` stores the two modules. `hear` calls `brief:say`, emits that string, and returns it. `quiet` returns `events:last`. An empty log returns nil. It does not speak and it does not emit.

## Item

`Item.new(name, kind, heal)` stores the name, the kind, and the heal amount. `use` calls `player:heal` and returns the hit points from the player. `label` returns the name, a space, and the kind. `full` is true when `hp` equals `max_hp`. It does not heal.

## Inventory

`Inventory.new` starts with no slots. `add` increases the stack of the same name, or appends a new stack. `count` returns that stack, or `0` when the name is missing. `take` subtracts from the stack. At zero it removes the slot and returns `0`.

## Pack

`Pack.new(inventory, item)` stores the two modules. `drink` returns the current HP when `count` for the item name is below 1. Otherwise it takes 1 and calls `item:use`. `stock` returns that count. It does not drink.

## Skill

`Skill.new(name)` starts at rank `1` with `0` uses. `train` adds the amount and sets the rank to `1 + uses // 5`. An amount below 1 leaves the rank unchanged. `progress` returns `uses % 5`.

## Practice

`Practice.new(pack, skill)` stores the two modules. `sip` reads `stock`, calls `drink`, and calls `skill:train(1)` when the stock was above zero. It returns the hit points from the pack. An empty bag does not train. `step` returns `skill:progress`. It does not sip and it does not train.

## Creature

`Creature.new(name, species, hp, position)` stores the name, the species, the hit points, the maximum, and `x`, `y`, `z`. The maximum starts equal to `hp`. `alive` is true while `hp` is above zero. `damage` subtracts and stops at zero. `move` adds `dx` and `dy` and returns the three coordinates. `z` stays. `same_place` compares `x`, `y`, and `z` with the other actor.

## Watch

`Watch.new(player, creature)` stores the two actors. `share` calls `creature:same_place`. The same tile returns `"meet"`. A different tile returns `"apart"`. `ready` is true when that tile is shared and the creature is alive. It does not move and it does not damage.

## Strike

`Strike.new(watch, battle)` stores the two modules. `hit` returns the creature HP when `watch:ready` is false. Otherwise it calls `battle:swing` and returns the hit points that remain. `hold` returns the creature HP. It does not swing.

## Mark

`Mark.new(strike, events)` stores the two modules. `land` calls `strike:hit`. When the HP drops, it emits `"hit"`. When the HP stays, it emits `"miss"`. It returns the hit points from the strike. `latest` returns `events:last`. An empty log returns nil. It does not land.

## Round

`Round.new(mark, creature, limit)` stores the mark, the creature, and the step limit. `fight` calls `mark:land` while the step count is below the limit and `creature:alive` is true. It returns how many steps ran. `hits` returns how many `"hit"` words the mark recorded. It does not fight.

## Verdict

`Verdict.new(round)` stores the round. `judge` calls `round:fight`. A creature that is still alive returns `"stand"`. A creature that fainted returns `"faint"`. `tally` returns `round:hits`. It does not judge.

## Payout

`Payout.new(verdict, reward, creature)` stores the verdict, the reward, and the creature. `close` calls `verdict:judge`, then returns `reward:grant`. A living creature leaves the level unchanged. A faint pays the prize. `quote` returns `reward:offer`. It does not judge and it does not grant.

## Order

`Order.new(payout, quest)` stores the payout and the quest. `fill` calls `payout:close`. It asks the quest to advance by one only when the creature was alive before that close and is not alive after it. It returns the level from the payout. `report` returns `quest:status`. It does not fill.

## Notice

`Notice.new(dialogue, order)` stores the dialogue and the order. `say` calls `order:report`. While that report is `"open"`, it returns `dialogue:next`. When the report is `"done"`, it returns the speaker name followed by `" is done"` and leaves the step unchanged. `waiting` returns whether `order:report` is `"open"`. It does not speak.

## Docket

`Docket.new(notice, events)` stores the notice and the event log. `hear` calls `notice:say`, emits that exact string, and returns it. The blow log and the speech log are separate objects. `quiet` returns `events:last`. An empty log returns nil. It does not speak and it does not emit.

## Stamp

`Stamp.new(docket, name)` stores the docket and the speaker name. `press` calls `docket:hear`. When that line is the name followed by `" is done"`, it returns `"closed"`. Any other line returns `"open"`. `read` returns `docket:quiet`. An empty log returns nil. It does not press.

## Gate

`Gate.new(stamp, player)` stores the stamp and the player. `pass` calls `stamp:press`. When the word is `"closed"`, it calls `player:move(1, 0)` and returns `x`, `y`, and `z`. When the word is `"open"`, it returns the current coordinates and does not move. `place` returns those three coordinates. It does not pass.

## Threshold

`Threshold.new(gate, world)` stores the gate and the world. `cross` calls `gate:pass`, then returns `world:look`. The world records `"meet"` or `"apart"`. `glance` returns `world:look`. It does not cross.
