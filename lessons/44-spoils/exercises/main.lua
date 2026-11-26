-- Exercise 44 — Spoils
-- Write each prediction before running this file from the repository root.
--
--   lua lessons/44-spoils/exercises/main.lua

package.path = "./lessons/44-spoils/exercises/?.lua;./projects/lua-rpg-core/?.lua;" .. package.path

local Player = require("player")
local World = require("world")
local Battle = require("battle")
local Encounter = require("encounter")
local Experience = require("experience")
local Reward = require("reward")
local Spoils = require("spoils")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

-- Part A
-- predicted paid: 2
-- predicted down: 0
-- predicted stored: 15
-- predicted held: 2
-- predicted left: 4

local hero = Player.new("joy", 15, { x = 2, y = 2, z = 7 })
local foe = { hp = 4, x = 2, y = 2, z = 7 }
local world = World.new(hero, foe)
local battle = Battle.new(4)
local encounter = Encounter.new(world, battle)
local progress = Experience.new()
local reward = Reward.new(progress, 25)
local spoils = Spoils.new(encounter, reward)

print(spoils:collect(foe))
print(foe.hp)
print(progress.xp)

foe.x = 9
foe.hp = 4

print(spoils:collect(foe))
print(foe.hp)

-- Part B
-- In spoils.lua, implement Spoils:peek(target).
-- Ask the reward what it would offer, and return that number.
-- Do not strike, and do not change the level or the stored XP.
-- Do not create a global.

-- Part C
-- Implement test_spoils().
-- Run two checks named "names a fainted prize" and "holds a living foe".
-- Use check and assert.
-- "names a fainted prize" peeks at HP 0 with a prize of 10 and expects 10.
-- "holds a living foe" peeks at HP 6 with a prize of 10 and expects 0.
-- Do not create a global.

local function test_spoils()
  check("names a fainted prize", function()
    local hero = Player.new("joy", 15, { x = 1, y = 1, z = 7 })
    local foe = { hp = 0, x = 1, y = 1, z = 7 }
    local place = World.new(hero, foe)
    local hit = Battle.new(4)
    local fight = Encounter.new(place, hit)
    local track = Experience.new()
    local prize = Reward.new(track, 10)
    local drop = Spoils.new(fight, prize)
    assert(drop:peek(foe) == 10)
    assert(track.level == 1)
    assert(foe.hp == 0)
  end)

  check("holds a living foe", function()
    local hero = Player.new("joy", 15, { x = 1, y = 1, z = 7 })
    local foe = { hp = 6, x = 1, y = 1, z = 7 }
    local place = World.new(hero, foe)
    local hit = Battle.new(4)
    local fight = Encounter.new(place, hit)
    local track = Experience.new()
    local prize = Reward.new(track, 10)
    local drop = Spoils.new(fight, prize)
    assert(drop:peek(foe) == 0)
    assert(track.level == 1)
  end)
end

test_spoils()
