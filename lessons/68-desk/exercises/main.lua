-- Exercise 68 — Desk
-- Write each prediction before running this file from the repository root.
--
--   lua lessons/68-desk/exercises/main.lua

package.path = "./lessons/68-desk/exercises/?.lua;./projects/lua-rpg-core/?.lua;" .. package.path

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
local Welcome = require("welcome")
local Desk = require("desk")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

-- Part A
-- predicted line: step inside
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
local door = Dialogue.new("clerk", { "step inside", "wait here" })
local welcome = Welcome.new(presence, door)
local greeted = Events.new()
local desk = Desk.new(welcome, greeted)

print(desk:receive())
print(greeted:count("step inside"))
print(hero.x)

-- Part B
-- In desk.lua, implement Desk:quiet().
-- Return the latest recorded line.
-- An empty log returns nil.
-- Do not receive, and do not emit another line.
-- Compare the empty result with == nil.
-- Do not create a global.

-- Part C
-- Implement test_desk().
-- Run two checks named "reads the latest greeting" and "starts without a greeting".
-- Use check and assert.
-- "reads the latest greeting" receives once on a quest with goal 3.
-- The player and the creature start at x 3, y 3, z 7.
-- The welcome line is "step inside".
-- It expects quiet "step inside", and calling quiet again still expects that line.
-- The dialogue step is 2, and the player's x stays 3.
-- "starts without a greeting" expects quiet nil.
-- The dialogue step stays 1, and the player's x stays 3.
-- Do not create a global.

local function test_desk()
  check("reads the latest greeting", function()
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
    local entry = Gate.new(seal, hero)
    local place = World.new(hero, foe)
    local edge = Threshold.new(entry, place)
    local roll = Visits.new(edge, place)
    local card = Permit.new(roll)
    local names = Events.new()
    local list = Roster.new(card, names)
    local here = Presence.new(list)
    local lines = Dialogue.new("clerk", { "step inside", "wait here" })
    local front = Welcome.new(here, lines)
    local greeted = Events.new()
    local counter = Desk.new(front, greeted)
    counter:receive()
    assert(counter:quiet() == "step inside")
    assert(counter:quiet() == "step inside")
    assert(lines.step == 2)
    assert(hero.x == 3)
  end)

  check("starts without a greeting", function()
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
    local entry = Gate.new(seal, hero)
    local place = World.new(hero, foe)
    local edge = Threshold.new(entry, place)
    local roll = Visits.new(edge, place)
    local card = Permit.new(roll)
    local names = Events.new()
    local list = Roster.new(card, names)
    local here = Presence.new(list)
    local lines = Dialogue.new("clerk", { "step inside", "wait here" })
    local front = Welcome.new(here, lines)
    local greeted = Events.new()
    local counter = Desk.new(front, greeted)
    assert(counter:quiet() == nil)
    assert(lines.step == 1)
    assert(hero.x == 3)
  end)
end

test_desk()
