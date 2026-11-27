-- Exercise 63 — Visits
-- Write each prediction before running this file from the repository root.
--
--   lua lessons/63-visits/exercises/main.lua

package.path = "./lessons/63-visits/exercises/?.lua;./projects/lua-rpg-core/?.lua;" .. package.path

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

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

-- Part A
-- predicted count: 1
-- predicted x: 3
-- predicted y: 3

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

print(visits:step())
print(hero.x)
print(hero.y)

-- Part B
-- In visits.lua, implement Visits:total().
-- Return how many meetings the world has recorded.
-- Ask the world.
-- Do not cross.
-- Do not create a global.

-- Part C
-- Implement test_visits().
-- Run two checks named "counts a shared tile" and "starts at zero".
-- Use check and assert.
-- "counts a shared tile" steps once on a quest with goal 3.
-- The player and the creature start at x 3, y 3, z 7.
-- It expects step 1 and total 1.
-- Calling total again still expects 1.
-- The player's x stays 3.
-- "starts at zero" expects total 0 before any step.
-- The player's x stays 3.
-- Do not create a global.

local function test_visits()
  check("counts a shared tile", function()
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
    assert(roll:step() == 1)
    assert(roll:total() == 1)
    assert(roll:total() == 1)
    assert(hero.x == 3)
  end)

  check("starts at zero", function()
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
    assert(roll:total() == 0)
    assert(hero.x == 3)
  end)
end

test_visits()
