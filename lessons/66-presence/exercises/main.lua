-- Exercise 66 — Presence
-- Write each prediction before running this file from the repository root.
--
--   lua lessons/66-presence/exercises/main.lua

package.path = "./lessons/66-presence/exercises/?.lua;./projects/lua-rpg-core/?.lua;" .. package.path

local Player = require("player")
local Creature = require("creature")
local Watch = require("watch")
local Battle = require("battle")
local Strike = require("strike")
local Mark = require("mark")
local Round = require("round")
local Verdict = require("verdict")
local Experience = require("experience")
local Reward = require("reward")
local Payout = require("payout")
local Quest = require("quest")
local Order = require("order")
local Dialogue = require("dialogue")
local Notice = require("notice")
local Events = require("events")
local Docket = require("docket")
local Stamp = require("stamp")
local Gate = require("gate")
local World = require("world")
local Threshold = require("threshold")
local Visits = require("visits")
local Permit = require("permit")
local Roster = require("roster")
local Presence = require("presence")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

-- Part A
-- predicted here: true
-- predicted copies: 1
-- predicted x: 3

local hero = Player.new("joy", 15, { x = 3, y = 3, z = 7 })
local foe = Creature.new("rattata", "mouse", 9, { x = 3, y = 3, z = 7 })
local watch = Watch.new(hero, foe)
local battle = Battle.new(3)
local strike = Strike.new(watch, battle)
local blows = Events.new()
local mark = Mark.new(strike, blows)
local round = Round.new(mark, foe, 5)
local verdict = Verdict.new(round)
local experience = Experience.new()
local reward = Reward.new(experience, 25)
local payout = Payout.new(verdict, reward, foe)
local quest = Quest.new("clear the den", 3)
local order = Order.new(payout, quest)
local talk = Dialogue.new("clerk", { "watch the den", "count three" })
local notice = Notice.new(talk, order)
local spoken = Events.new()
local docket = Docket.new(notice, spoken)
local stamp = Stamp.new(docket, "clerk")
local gate = Gate.new(stamp, hero)
local world = World.new(hero, foe)
local threshold = Threshold.new(gate, world)
local visits = Visits.new(threshold, world)
local permit = Permit.new(visits)
local signed = Events.new()
local roster = Roster.new(permit, signed)
local presence = Presence.new(roster)

print(presence:mark())
print(signed:count("met"))
print(hero.x)

-- Part B
-- In presence.lua, implement Presence:seen().
-- Return whether the latest recorded word is "met".
-- Ask the roster.
-- Do not mark.
-- A missing word makes the comparison false.
-- Compare that result with == false, because assert fails on false.
-- Do not create a global.

-- Part C
-- Implement test_presence().
-- Run two checks named "sees a meeting" and "starts unseen".
-- Use check and assert.
-- "sees a meeting" marks once on a quest with goal 3.
-- The player and the creature start at x 3, y 3, z 7.
-- It expects seen true, and calling seen again still expects true.
-- The player's x stays 3.
-- "starts unseen" expects seen false before any mark.
-- Compare that result with == false.
-- The player's x stays 3.
-- Do not create a global.

local function test_presence()
  check("sees a meeting", function()
    local hero = Player.new("joy", 15, { x = 3, y = 3, z = 7 })
    local foe = Creature.new("rattata", "mouse", 9, { x = 3, y = 3, z = 7 })
    local eyes = Watch.new(hero, foe)
    local hit = Battle.new(3)
    local blow = Strike.new(eyes, hit)
    local board = Events.new()
    local note = Mark.new(blow, board)
    local bout = Round.new(note, foe, 5)
    local word = Verdict.new(bout)
    local growth = Experience.new()
    local prize = Reward.new(growth, 25)
    local bill = Payout.new(word, prize, foe)
    local job = Quest.new("clear the den", 3)
    local task = Order.new(bill, job)
    local speech = Dialogue.new("clerk", { "watch the den", "count three" })
    local intro = Notice.new(speech, task)
    local spoken = Events.new()
    local book = Docket.new(intro, spoken)
    local seal = Stamp.new(book, "clerk")
    local door = Gate.new(seal, hero)
    local place = World.new(hero, foe)
    local edge = Threshold.new(door, place)
    local roll = Visits.new(edge, place)
    local card = Permit.new(roll)
    local names = Events.new()
    local list = Roster.new(card, names)
    local here = Presence.new(list)
    here:mark()
    assert(here:seen() == true)
    assert(here:seen() == true)
    assert(hero.x == 3)
  end)

  check("starts unseen", function()
    local hero = Player.new("joy", 15, { x = 3, y = 3, z = 7 })
    local foe = Creature.new("rattata", "mouse", 9, { x = 3, y = 3, z = 7 })
    local eyes = Watch.new(hero, foe)
    local hit = Battle.new(3)
    local blow = Strike.new(eyes, hit)
    local board = Events.new()
    local note = Mark.new(blow, board)
    local bout = Round.new(note, foe, 5)
    local word = Verdict.new(bout)
    local growth = Experience.new()
    local prize = Reward.new(growth, 25)
    local bill = Payout.new(word, prize, foe)
    local job = Quest.new("clear the den", 3)
    local task = Order.new(bill, job)
    local speech = Dialogue.new("clerk", { "watch the den", "count three" })
    local intro = Notice.new(speech, task)
    local spoken = Events.new()
    local book = Docket.new(intro, spoken)
    local seal = Stamp.new(book, "clerk")
    local door = Gate.new(seal, hero)
    local place = World.new(hero, foe)
    local edge = Threshold.new(door, place)
    local roll = Visits.new(edge, place)
    local card = Permit.new(roll)
    local names = Events.new()
    local list = Roster.new(card, names)
    local here = Presence.new(list)
    assert(here:seen() == false)
    assert(hero.x == 3)
  end)
end

test_presence()
