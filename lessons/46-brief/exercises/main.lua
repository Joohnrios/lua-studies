-- Exercise 46 — Brief
-- Write each prediction before running this file from the repository root.
--
--   lua lessons/46-brief/exercises/main.lua

package.path = "./lessons/46-brief/exercises/?.lua;./projects/lua-rpg-core/?.lua;" .. package.path

local Player = require("player")
local World = require("world")
local Battle = require("battle")
local Encounter = require("encounter")
local Experience = require("experience")
local Reward = require("reward")
local Spoils = require("spoils")
local Quest = require("quest")
local Hunt = require("hunt")
local Dialogue = require("dialogue")
local Brief = require("brief")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

-- Part A
-- predicted line: search
-- predicted step: 2
-- predicted closed: ranger is done
-- predicted held: 2

local hero = Player.new("joy", 15, { x = 4, y = 4, z = 7 })
local foe = { hp = 5, x = 4, y = 4, z = 7 }
local world = World.new(hero, foe)
local battle = Battle.new(5)
local encounter = Encounter.new(world, battle)
local progress = Experience.new()
local reward = Reward.new(progress, 10)
local spoils = Spoils.new(encounter, reward)
local quest = Quest.new("hunt", 1)
local hunt = Hunt.new(spoils, quest)
local talk = Dialogue.new("ranger", { "search", "return" })
local brief = Brief.new(talk, hunt)

print(brief:say())
print(talk.step)

quest:advance(1)

print(brief:say())
print(talk.step)

-- Part B
-- In brief.lua, implement Brief:waiting().
-- Return true while the hunt report is "open".
-- Return false when the hunt report is "done".
-- Do not speak, and do not change the dialogue step.
-- Do not create a global.

-- Part C
-- Implement test_brief().
-- Run two checks named "waits while open" and "rests when done".
-- Use check and assert.
-- "waits while open" uses a new quest with goal 2, expects true, and keeps step 1.
-- "rests when done" advances a goal of 1 by 1 and expects false.
-- Do not create a global.

local function test_brief()
  check("waits while open", function()
    local hero = Player.new("joy", 15, { x = 4, y = 4, z = 7 })
    local foe = { hp = 5, x = 4, y = 4, z = 7 }
    local place = World.new(hero, foe)
    local hit = Battle.new(5)
    local fight = Encounter.new(place, hit)
    local track = Experience.new()
    local prize = Reward.new(track, 10)
    local drop = Spoils.new(fight, prize)
    local task = Quest.new("hunt", 2)
    local round = Hunt.new(drop, task)
    local speech = Dialogue.new("ranger", { "search", "return" })
    local intro = Brief.new(speech, round)
    assert(intro:waiting() == true)
    assert(speech.step == 1)
  end)

  check("rests when done", function()
    local hero = Player.new("joy", 15, { x = 4, y = 4, z = 7 })
    local foe = { hp = 5, x = 4, y = 4, z = 7 }
    local place = World.new(hero, foe)
    local hit = Battle.new(5)
    local fight = Encounter.new(place, hit)
    local track = Experience.new()
    local prize = Reward.new(track, 10)
    local drop = Spoils.new(fight, prize)
    local task = Quest.new("hunt", 1)
    task:advance(1)
    local round = Hunt.new(drop, task)
    local speech = Dialogue.new("ranger", { "search", "return" })
    local intro = Brief.new(speech, round)
    assert(intro:waiting() == false)
  end)
end

test_brief()
