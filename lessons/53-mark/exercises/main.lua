-- Exercise 53 — Mark
-- Write each prediction before running this file from the repository root.
--
--   lua lessons/53-mark/exercises/main.lua

package.path = "./lessons/53-mark/exercises/?.lua;./projects/lua-rpg-core/?.lua;" .. package.path

local Player = require("player")
local Creature = require("creature")
local Watch = require("watch")
local Battle = require("battle")
local Strike = require("strike")
local Events = require("events")
local Mark = require("mark")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

-- Part A
-- predicted hurt: 3
-- predicted word: hit
-- predicted held: 3
-- predicted missed: miss
-- predicted hits: 1

local hero = Player.new("joy", 15, { x = 2, y = 2, z = 7 })
local foe = Creature.new("rattata", "mouse", 8, { x = 2, y = 2, z = 7 })
local watch = Watch.new(hero, foe)
local battle = Battle.new(5)
local strike = Strike.new(watch, battle)
local events = Events.new()
local mark = Mark.new(strike, events)

print(mark:land())
print(events:last())

hero:move(1, 0)

print(mark:land())
print(events:last())
print(events:count("hit"))

-- Part B
-- In mark.lua, implement Mark:latest().
-- Return the latest recorded word.
-- An empty log returns nil.
-- Do not land, and do not emit another word.
-- Do not create a global.

-- Part C
-- Implement test_mark().
-- Run two checks named "reads the latest blow" and "starts without a blow".
-- Use check and assert.
-- "reads the latest blow" lands once on a ready creature and expects latest "hit".
-- "starts without a blow" expects latest nil.
-- Compare the empty result with == nil.
-- Do not create a global.

local function test_mark()
  check("reads the latest blow", function()
    local hero = Player.new("joy", 15, { x = 2, y = 2, z = 7 })
    local foe = Creature.new("rattata", "mouse", 8, { x = 2, y = 2, z = 7 })
    local eyes = Watch.new(hero, foe)
    local hit = Battle.new(5)
    local blow = Strike.new(eyes, hit)
    local board = Events.new()
    local note = Mark.new(blow, board)
    note:land()
    assert(note:latest() == "hit")
    assert(foe.hp == 3)
  end)

  check("starts without a blow", function()
    local hero = Player.new("joy", 15, { x = 2, y = 2, z = 7 })
    local foe = Creature.new("rattata", "mouse", 8, { x = 2, y = 2, z = 7 })
    local eyes = Watch.new(hero, foe)
    local hit = Battle.new(5)
    local blow = Strike.new(eyes, hit)
    local board = Events.new()
    local note = Mark.new(blow, board)
    assert(note:latest() == nil)
  end)
end

test_mark()
