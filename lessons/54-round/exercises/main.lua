-- Exercise 54 — Round
-- Write each prediction before running this file from the repository root.
--
--   lua lessons/54-round/exercises/main.lua

package.path = "./lessons/54-round/exercises/?.lua;./projects/lua-rpg-core/?.lua;" .. package.path

local Player = require("player")
local Creature = require("creature")
local Watch = require("watch")
local Battle = require("battle")
local Strike = require("strike")
local Events = require("events")
local Mark = require("mark")
local Round = require("round")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

-- Part A
-- predicted steps: 3
-- predicted down: 0
-- predicted hits: 3

local hero = Player.new("joy", 15, { x = 3, y = 3, z = 7 })
local foe = Creature.new("rattata", "mouse", 9, { x = 3, y = 3, z = 7 })
local watch = Watch.new(hero, foe)
local battle = Battle.new(3)
local strike = Strike.new(watch, battle)
local events = Events.new()
local mark = Mark.new(strike, events)
local round = Round.new(mark, foe, 5)

print(round:fight())
print(foe.hp)
print(events:count("hit"))

-- Part B
-- In round.lua, implement Round:hits().
-- Return how many "hit" words the log holds.
-- Do not fight.
-- Do not create a global.

-- Part C
-- Implement test_round().
-- Run two checks named "counts the blows" and "starts at zero".
-- Use check and assert.
-- "counts the blows" fights a creature with HP 9 and power 3, and expects hits 3.
-- Calling hits again still expects 3.
-- "starts at zero" expects hits 0.
-- Do not create a global.

local function test_round()
  check("counts the blows", function()
    local hero = Player.new("joy", 15, { x = 3, y = 3, z = 7 })
    local foe = Creature.new("rattata", "mouse", 9, { x = 3, y = 3, z = 7 })
    local eyes = Watch.new(hero, foe)
    local hit = Battle.new(3)
    local blow = Strike.new(eyes, hit)
    local board = Events.new()
    local note = Mark.new(blow, board)
    local bout = Round.new(note, foe, 5)
    bout:fight()
    assert(bout:hits() == 3)
    assert(bout:hits() == 3)
    assert(foe.hp == 0)
  end)

  check("starts at zero", function()
    local hero = Player.new("joy", 15, { x = 3, y = 3, z = 7 })
    local foe = Creature.new("rattata", "mouse", 9, { x = 3, y = 3, z = 7 })
    local eyes = Watch.new(hero, foe)
    local hit = Battle.new(3)
    local blow = Strike.new(eyes, hit)
    local board = Events.new()
    local note = Mark.new(blow, board)
    local bout = Round.new(note, foe, 5)
    assert(bout:hits() == 0)
  end)
end

test_round()
