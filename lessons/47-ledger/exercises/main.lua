-- Exercise 47 — Ledger
-- Write each prediction before running this file from the repository root.
--
--   lua lessons/47-ledger/exercises/main.lua

package.path = "./lessons/47-ledger/exercises/?.lua;./projects/lua-rpg-core/?.lua;" .. package.path

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
local Events = require("events")
local Ledger = require("ledger")

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
-- predicted latest: search
-- predicted closed: ranger is done
-- predicted heard: 1
-- predicted size: 2

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
local events = Events.new()
local ledger = Ledger.new(brief, events)

print(ledger:hear())
print(events:last())

quest:advance(1)

print(ledger:hear())
print(events:count("search"))
print(#events.log)

-- Part B
-- In ledger.lua, implement Ledger:quiet().
-- Return the latest recorded line.
-- An empty log returns nil.
-- Do not speak, and do not emit another line.
-- Do not create a global.

-- Part C
-- Implement test_ledger().
-- Run two checks named "reads the latest line" and "starts without a line".
-- Use check and assert.
-- "reads the latest line" hears once on an open hunt and expects quiet to match that line.
-- "starts without a line" expects quiet nil.
-- Compare the empty result with == nil.
-- Do not create a global.

local function test_ledger()
  check("reads the latest line", function()
    local hero = Player.new("joy", 15, { x = 4, y = 4, z = 7 })
    local foe = { hp = 5, x = 4, y = 4, z = 7 }
    local place = World.new(hero, foe)
    local hit = Battle.new(5)
    local fight = Encounter.new(place, hit)
    local track = Experience.new()
    local prize = Reward.new(track, 10)
    local drop = Spoils.new(fight, prize)
    local task = Quest.new("hunt", 1)
    local round = Hunt.new(drop, task)
    local speech = Dialogue.new("ranger", { "search", "return" })
    local intro = Brief.new(speech, round)
    local board = Events.new()
    local book = Ledger.new(intro, board)
    assert(book:hear() == "search")
    assert(book:quiet() == "search")
    assert(speech.step == 2)
  end)

  check("starts without a line", function()
    local hero = Player.new("joy", 15, { x = 4, y = 4, z = 7 })
    local foe = { hp = 5, x = 4, y = 4, z = 7 }
    local place = World.new(hero, foe)
    local hit = Battle.new(5)
    local fight = Encounter.new(place, hit)
    local track = Experience.new()
    local prize = Reward.new(track, 10)
    local drop = Spoils.new(fight, prize)
    local task = Quest.new("hunt", 1)
    local round = Hunt.new(drop, task)
    local speech = Dialogue.new("ranger", { "search" })
    local intro = Brief.new(speech, round)
    local board = Events.new()
    local book = Ledger.new(intro, board)
    assert(book:quiet() == nil)
  end)
end

test_ledger()
