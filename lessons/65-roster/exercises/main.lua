-- Exercise 65 — Roster
-- Write each prediction before running this file from the repository root.
--
--   lua lessons/65-roster/exercises/main.lua

package.path = "./lessons/65-roster/exercises/?.lua;./projects/lua-rpg-core/?.lua;" .. package.path

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

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

-- Part A
-- predicted word: met
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

print(roster:sign())
print(signed:count("met"))
print(hero.x)

-- Part B
-- In roster.lua, implement Roster:quiet().
-- Return the latest recorded word.
-- An empty log returns nil.
-- Do not sign, and do not emit another word.
-- Compare the empty result with == nil.
-- Do not create a global.

-- Part C
-- Implement test_roster().
-- Run two checks named "reads the latest word" and "starts without a word".
-- Use check and assert.
-- "reads the latest word" signs once on a quest with goal 3.
-- The player and the creature start at x 3, y 3, z 7.
-- It expects quiet "met", and calling quiet again still expects "met".
-- The player's x stays 3.
-- "starts without a word" expects quiet nil.
-- The player's x stays 3.
-- Do not create a global.

local function test_roster()
  check("reads the latest word", function()
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
    list:sign()
    assert(list:quiet() == "met")
    assert(list:quiet() == "met")
    assert(hero.x == 3)
  end)

  check("starts without a word", function()
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
    assert(list:quiet() == nil)
    assert(hero.x == 3)
  end)
end

test_roster()
