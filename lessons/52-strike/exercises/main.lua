-- Exercise 52 — Strike
-- Write each prediction before running this file from the repository root.
--
--   lua lessons/52-strike/exercises/main.lua

package.path = "./lessons/52-strike/exercises/?.lua;./projects/lua-rpg-core/?.lua;" .. package.path

local Player = require("player")
local Creature = require("creature")
local Watch = require("watch")
local Battle = require("battle")
local Strike = require("strike")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

-- Part A
-- predicted first: 6
-- predicted stored: 6
-- predicted held: 6
-- predicted left: 6

local hero = Player.new("joy", 15, { x = 3, y = 2, z = 7 })
local foe = Creature.new("rattata", "mouse", 9, { x = 3, y = 2, z = 7 })
local watch = Watch.new(hero, foe)
local battle = Battle.new(3)
local strike = Strike.new(watch, battle)

print(strike:hit())
print(foe.hp)

hero:move(0, 1)

print(strike:hit())
print(foe.hp)

-- Part B
-- In strike.lua, implement Strike:hold().
-- Return the creature HP.
-- Do not swing.
-- Do not create a global.

-- Part C
-- Implement test_strike().
-- Run two checks named "reads the hp" and "reads a faint".
-- Use check and assert.
-- "reads the hp" holds a creature with HP 9 and expects 9.
-- "reads a faint" damages that creature to 0 and expects 0.
-- Do not create a global.

local function test_strike()
  check("reads the hp", function()
    local hero = Player.new("joy", 15, { x = 3, y = 2, z = 7 })
    local foe = Creature.new("rattata", "mouse", 9, { x = 3, y = 2, z = 7 })
    local eyes = Watch.new(hero, foe)
    local hit = Battle.new(3)
    local blow = Strike.new(eyes, hit)
    assert(blow:hold() == 9)
    assert(foe.hp == 9)
  end)

  check("reads a faint", function()
    local hero = Player.new("joy", 15, { x = 3, y = 2, z = 7 })
    local foe = Creature.new("rattata", "mouse", 9, { x = 3, y = 2, z = 7 })
    foe:damage(9)
    local eyes = Watch.new(hero, foe)
    local hit = Battle.new(3)
    local blow = Strike.new(eyes, hit)
    assert(blow:hold() == 0)
  end)
end

test_strike()
