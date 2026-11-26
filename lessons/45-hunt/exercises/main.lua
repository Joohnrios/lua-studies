-- Exercise 45 — Hunt
-- Write each prediction before running this file from the repository root.
--
--   lua lessons/45-hunt/exercises/main.lua

package.path = "./lessons/45-hunt/exercises/?.lua;./projects/lua-rpg-core/?.lua;" .. package.path

local Player = require("player")
local World = require("world")
local Battle = require("battle")
local Encounter = require("encounter")
local Experience = require("experience")
local Reward = require("reward")
local Spoils = require("spoils")
local Quest = require("quest")
local Hunt = require("hunt")

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
-- predicted step: 1
-- predicted open: false
-- predicted again: 2
-- predicted steps: 2

local hero = Player.new("joy", 15, { x = 4, y = 4, z = 7 })
local foe = { hp = 5, x = 4, y = 4, z = 7 }
local world = World.new(hero, foe)
local battle = Battle.new(5)
local encounter = Encounter.new(world, battle)
local progress = Experience.new()
local reward = Reward.new(progress, 10)
local spoils = Spoils.new(encounter, reward)
local quest = Quest.new("hunt", 3)
local hunt = Hunt.new(spoils, quest)

print(hunt:finish(foe))
print(quest.progress)
print(quest:done())

foe.hp = 5

print(hunt:finish(foe))
print(quest.progress)

-- Part B
-- In hunt.lua, implement Hunt:report().
-- Return the quest status, "done" or "open".
-- Do not collect, and do not advance the quest.
-- Do not create a global.

-- Part C
-- Implement test_hunt().
-- Run two checks named "names an open hunt" and "names a finished hunt".
-- Use check and assert.
-- "names an open hunt" reports a new quest with goal 2 and expects "open".
-- "names a finished hunt" advances a goal of 1 by 1, then expects "done".
-- Do not create a global.

local function test_hunt()
  check("names an open hunt", function()
    local hero = Player.new("joy", 15, { x = 1, y = 1, z = 7 })
    local foe = { hp = 5, x = 1, y = 1, z = 7 }
    local place = World.new(hero, foe)
    local hit = Battle.new(5)
    local fight = Encounter.new(place, hit)
    local track = Experience.new()
    local prize = Reward.new(track, 10)
    local drop = Spoils.new(fight, prize)
    local task = Quest.new("hunt", 2)
    local round = Hunt.new(drop, task)
    assert(round:report() == "open")
    assert(task.progress == 0)
  end)

  check("names a finished hunt", function()
    local hero = Player.new("joy", 15, { x = 1, y = 1, z = 7 })
    local foe = { hp = 5, x = 1, y = 1, z = 7 }
    local place = World.new(hero, foe)
    local hit = Battle.new(5)
    local fight = Encounter.new(place, hit)
    local track = Experience.new()
    local prize = Reward.new(track, 10)
    local drop = Spoils.new(fight, prize)
    local task = Quest.new("hunt", 1)
    task:advance(1)
    local round = Hunt.new(drop, task)
    assert(round:report() == "done")
  end)
end

test_hunt()
