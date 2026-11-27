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
visits.lua      counts shared tiles after a crossing
permit.lua      names a meeting when the visit count is above zero
roster.lua      stores each word the permit grants
presence.lua    reports true only when the roster word is met
welcome.lua     speaks the next line when the presence is true
desk.lua        stores each line the welcome speaks
slip.lua        counts how many times the latest greeting appears
echo.lua        names a first greeting and a repeated one
chime.lua       records a new word and skips a repeat
peal.lua        sounds the chime and returns how many new words it kept
chord.lua       names a rise when the kept count grows
phrase.lua      stores each word the chord plays
refrain.lua     counts how many times the latest word appears
cue.lua         names a first count and a repeated one
spot.lua        records a first word and skips a repeat
pulse.lua       beats the spot and returns how many first words it kept
meter.lua       names a rise when the kept count grows
clef.lua        records a rise and skips a hold
march.lua       names a move when the player's x changes
trail.lua       records a move and skips a still walk
pace.lua        takes a step and returns how many moves the trail kept
stride.lua      names a rise when the kept move count grows
lane.lua        records a rise and skips a hold
bridge.lua      spans the lane and returns how many rises it kept
arch.lua        names a rise when the kept rise count grows
vault.lua       records a rise and skips a hold
roof.lua        covers the vault and returns how many rises it kept
ridge.lua       names a rise when the kept rise count grows
gable.lua       records a rise and skips a hold
eave.lua        hangs the gable and returns how many rises it kept
fascia.lua      names a rise when the kept rise count grows
soffit.lua      records a rise and skips a hold
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
lua lessons/63-visits/examples/main.lua
lua lessons/64-permit/examples/main.lua
lua lessons/65-roster/examples/main.lua
lua lessons/66-presence/examples/main.lua
lua lessons/67-welcome/examples/main.lua
lua lessons/68-desk/examples/main.lua
lua lessons/69-slip/examples/main.lua
lua lessons/70-echo/examples/main.lua
lua lessons/71-chime/examples/main.lua
lua lessons/72-peal/examples/main.lua
lua lessons/73-chord/examples/main.lua
lua lessons/74-phrase/examples/main.lua
lua lessons/75-refrain/examples/main.lua
lua lessons/76-cue/examples/main.lua
lua lessons/77-spot/examples/main.lua
lua lessons/78-pulse/examples/main.lua
lua lessons/79-meter/examples/main.lua
lua lessons/80-clef/examples/main.lua
lua lessons/81-march/examples/main.lua
lua lessons/82-trail/examples/main.lua
lua lessons/83-pace/examples/main.lua
lua lessons/84-stride/examples/main.lua
lua lessons/85-lane/examples/main.lua
lua lessons/86-bridge/examples/main.lua
lua lessons/87-arch/examples/main.lua
lua lessons/88-vault/examples/main.lua
lua lessons/89-roof/examples/main.lua
lua lessons/90-ridge/examples/main.lua
lua lessons/91-gable/examples/main.lua
lua lessons/92-eave/examples/main.lua
lua lessons/93-fascia/examples/main.lua
lua lessons/94-soffit/examples/main.lua
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

## Visits

`Visits.new(threshold, world)` stores the threshold and the world. `step` calls `threshold:cross`, then returns `world:meetings`. An `"apart"` entry stays in the world log and does not increase that count. `total` returns `world:meetings`. It does not cross.

## Permit

`Permit.new(visits)` stores the visits. `grant` calls `visits:step`. When `visits:total` is above zero, it returns `"met"`. When the total is still zero, it returns `"none"`. A later `"apart"` does not erase an earlier meeting. `held` returns `visits:total`. It does not grant.

## Roster

`Roster.new(permit, events)` stores the permit and its own event log. `sign` calls `permit:grant`, emits that exact word, and returns it. The blow log, the speech log, and this log are separate objects. `quiet` returns `events:last`. An empty log returns nil. It does not sign and it does not emit.

## Presence

`Presence.new(roster)` stores the roster. `mark` calls `roster:sign`. It returns true when that word is `"met"`, and false when the word is `"none"`. `seen` returns whether `roster:quiet` is `"met"`. It does not mark. A missing word makes that comparison false.

## Welcome

`Welcome.new(presence, dialogue)` stores the presence and its own dialogue. `greet` calls `presence:mark`. When that result is true, it returns `dialogue:next`. When the result is false, it returns the speaker name followed by `" is away"` and leaves the step unchanged. `status` returns `"here"` when `presence:seen` is true, and `"away"` when it is false. It does not greet.

## Desk

`Desk.new(welcome, events)` stores the welcome and its own event log. `receive` calls `welcome:greet`, emits that exact line, and returns it. The blow log, the speech log, the permit log, and this log are separate objects. `quiet` returns `events:last`. An empty log returns nil. It does not receive and it does not emit.

## Slip

`Slip.new(desk, events)` stores the desk and the same event log. `file` calls `desk:receive`, then returns `events:count` for that line. A new line starts its own count at `1`. `copies` returns that count for the latest line. It does not file. An empty log returns `0`.

## Echo

`Echo.new(slip)` stores the slip. `hear` calls `slip:file`. A count of `1` returns `"new"`. A count above `1` returns `"again"`. A different line starts again at `"new"`. `fresh` returns whether `slip:copies` is `1`. It does not hear. Before any line, that comparison is false.

## Chime

`Chime.new(echo, events)` stores the echo and its own event log. `ring` calls `echo:hear`. When the word is `"new"`, it emits that word. When the word is `"again"`, it returns the word and does not emit. `once` returns `events:count` for `"new"`. It does not ring. An empty log returns `0`.

## Peal

`Peal.new(chime)` stores the chime. `sound` calls `chime:ring`, then returns `chime:once`. A repeated word leaves that count unchanged. `kept` returns `chime:once`. It does not sound. Before any sound, the count is `0`.

## Chord

`Chord.new(peal)` stores the peal. `play` reads `peal:kept`, then calls `peal:sound`. When the count grows, it returns `"rise"`. When the count stays the same, it returns `"hold"`. `open` returns whether `peal:kept` is above `0`. It does not play. Before any sound, that comparison is false.

## Phrase

`Phrase.new(chord, events)` stores the chord and its own event log. `say` calls `chord:play`, emits that exact word, and returns it. Both `"rise"` and `"hold"` are recorded. `latest` returns `events:last`. It does not say. An empty log returns nil.

## Refrain

`Refrain.new(phrase, events)` stores the phrase and the same event log. `sing` calls `phrase:say`, then returns `events:count` for that word. The same word adds up. A different word starts again at `1`. `copies` returns `events:count` for `phrase:latest`. It does not sing. Before any word, that count is `0`.

## Cue

`Cue.new(refrain)` stores the refrain. `call` calls `refrain:sing`. A count of `1` returns `"first"`. A count above `1` returns `"more"`. A different word starts again at `"first"`. `fresh` returns whether `refrain:copies` is `1`. It does not call. Before any word, that comparison is false.

## Spot

`Spot.new(cue, events)` stores the cue and its own event log. `mark` calls `cue:call`. When the word is `"first"`, it emits that word. When the word is `"more"`, it returns the word and does not emit. `once` returns `events:count` for `"first"`. It does not mark. An empty log returns `0`.

## Pulse

`Pulse.new(spot)` stores the spot. `beat` calls `spot:mark`, then returns `spot:once`. A `"more"` word leaves that count unchanged. `kept` returns `spot:once`. It does not beat. Before any beat, the count is `0`.

## Meter

`Meter.new(pulse)` stores the pulse. `play` reads `pulse:kept`, then calls `pulse:beat`. When the count grows, it returns `"rise"`. When the count stays the same, it returns `"hold"`. `open` returns whether `pulse:kept` is above `0`. It does not play. Before any beat, that comparison is false.

## Clef

`Clef.new(meter, events)` stores the meter and its own event log. `mark` calls `meter:play`. When the word is `"rise"`, it emits that word. When the word is `"hold"`, it returns the word and does not emit. `once` returns `events:count` for `"rise"`. It does not mark. An empty log returns `0`.

## March

`March.new(clef, player)` stores the clef and the player. `walk` saves `player.x`, calls `clef:mark`, and compares the coordinate. When `x` changes, it returns `"moved"`. When `x` stays the same, it returns `"still"`. The gate is the one that moves the player. `place` returns `player.x`. It does not walk.

## Trail

`Trail.new(march, events)` stores the march and its own event log. `step` calls `march:walk`. When the word is `"moved"`, it emits that word. When the word is `"still"`, it returns the word and does not emit. `moves` returns `events:count` for `"moved"`. It does not step. An empty log returns `0`.

## Pace

`Pace.new(trail)` stores the trail. `take` calls `trail:step`, then returns `trail:moves`. A `"still"` word leaves that count unchanged. `kept` returns `trail:moves`. It does not take. Before any take, the count is `0`.

## Stride

`Stride.new(pace)` stores the pace. `play` reads `pace:kept`, then calls `pace:take`. When the count grows, it returns `"rise"`. When the count stays the same, it returns `"hold"`. `open` returns whether `pace:kept` is above `0`. It does not play. Before any take, that comparison is false.

## Lane

`Lane.new(stride, events)` stores the stride and its own event log. `cross` calls `stride:play`. When the word is `"rise"`, it emits that word. When the word is `"hold"`, it returns the word and does not emit. `once` returns `events:count` for `"rise"`. It does not cross. An empty log returns `0`.

## Bridge

`Bridge.new(lane)` stores the lane. `span` calls `lane:cross`, then returns `lane:once`. A `"hold"` word leaves that count unchanged. `kept` returns `lane:once`. It does not span. Before any span, the count is `0`.

## Arch

`Arch.new(bridge)` stores the bridge. `play` reads `bridge:kept`, then calls `bridge:span`. When the count grows, it returns `"rise"`. When the count stays the same, it returns `"hold"`. `open` returns whether `bridge:kept` is above `0`. It does not play. Before any span, that comparison is false.

## Vault

`Vault.new(arch, events)` stores the arch and its own event log. `lay` calls `arch:play`. When the word is `"rise"`, it emits that word. When the word is `"hold"`, it returns the word and does not emit. `once` returns `events:count` for `"rise"`. It does not lay. An empty log returns `0`.

## Roof

`Roof.new(vault)` stores the vault. `cover` calls `vault:lay`, then returns `vault:once`. A `"hold"` word leaves that count unchanged. `kept` returns `vault:once`. It does not cover. Before any cover, the count is `0`.

## Ridge

`Ridge.new(roof)` stores the roof. `play` reads `roof:kept`, then calls `roof:cover`. When the count grows, it returns `"rise"`. When the count stays the same, it returns `"hold"`. `open` returns whether `roof:kept` is above `0`. It does not play. Before any cover, that comparison is false.

## Gable

`Gable.new(ridge, events)` stores the ridge and its own event log. `fit` calls `ridge:play`. When the word is `"rise"`, it emits that word. When the word is `"hold"`, it returns the word and does not emit. `once` returns `events:count` for `"rise"`. It does not fit. An empty log returns `0`.

## Eave

`Eave.new(gable)` stores the gable. `hang` calls `gable:fit`, then returns `gable:once`. A `"hold"` word leaves that count unchanged. `kept` returns `gable:once`. It does not hang. Before any hang, the count is `0`.

## Fascia

`Fascia.new(eave)` stores the eave. `play` reads `eave:kept`, then calls `eave:hang`. When the count grows, it returns `"rise"`. When the count stays the same, it returns `"hold"`. `open` returns whether `eave:kept` is above `0`. It does not play. Before any hang, that comparison is false.

## Soffit

`Soffit.new(fascia, events)` stores the fascia and its own event log. `set` calls `fascia:play`. When the word is `"rise"`, it emits that word. When the word is `"hold"`, it returns the word and does not emit. `once` returns `events:count` for `"rise"`. It does not set. An empty log returns `0`.
