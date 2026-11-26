-- Exercise 42 — Encounter
-- Write each prediction before running this file from the repository root.
--
--   lua lessons/42-encounter/exercises/main.lua

package.path = "./lessons/42-encounter/exercises/?.lua;./projects/lua-rpg-core/?.lua;" .. package.path

local Player = require("player")
local World = require("world")
local Battle = require("battle")
local Encounter = require("encounter")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

-- Part A
-- predicted hit: 7
-- predicted left: 7
-- predicted held: 7
-- predicted notes: 2

local hero = Player.new("joy", 15, { x = 3, y = 3, z = 7 })
local foe = { hp = 12, x = 3, y = 3, z = 7 }
local world = World.new(hero, foe)
local battle = Battle.new(5)
local encounter = Encounter.new(world, battle)

print(encounter:act(foe))
print(foe.hp)

foe.x = 8

print(encounter:act(foe))
print(#world.log)

-- Part B
-- In encounter.lua, implement Encounter:spare().
-- Ask the world to look, and return that word.
-- Leave the target HP unchanged.
-- Do not create a global.

-- Part C
-- Implement test_encounter().
-- Run two checks named "reads the tile" and "reads the gap".
-- Use check and assert.
-- "reads the tile" spares a shared tile, expects "meet", and keeps the HP.
-- "reads the gap" spares a different z and expects "apart".
-- Do not create a global.

local function test_encounter()
  check("reads the tile", function()
    local hero = Player.new("joy", 15, { x = 3, y = 3, z = 7 })
    local foe = { hp = 12, x = 3, y = 3, z = 7 }
    local place = World.new(hero, foe)
    local hit = Battle.new(5)
    local fight = Encounter.new(place, hit)
    assert(fight:spare() == "meet")
    assert(foe.hp == 12)
  end)

  check("reads the gap", function()
    local hero = Player.new("joy", 15, { x = 3, y = 3, z = 7 })
    local foe = { hp = 12, x = 3, y = 3, z = 6 }
    local place = World.new(hero, foe)
    local hit = Battle.new(5)
    local fight = Encounter.new(place, hit)
    assert(fight:spare() == "apart")
  end)
end

test_encounter()
