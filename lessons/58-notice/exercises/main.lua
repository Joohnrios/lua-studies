-- Exercise 58 — Notice
-- Write each prediction before running this file from the repository root.
--
--   lua lessons/58-notice/exercises/main.lua

package.path = "./lessons/58-notice/exercises/?.lua;./projects/lua-rpg-core/?.lua;" .. package.path

local Player = require("player")
local Creature = require("creature")
local Watch = require("watch")
local Battle = require("battle")
local Strike = require("strike")
local Events = require("events")
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

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

-- Part A
-- predicted line: watch the den
-- predicted step: 2
-- predicted word: open

local hero = Player.new("joy", 15, { x = 3, y = 3, z = 7 })
local foe = Creature.new("rattata", "mouse", 9, { x = 3, y = 3, z = 7 })
local watch = Watch.new(hero, foe)
local battle = Battle.new(3)
local strike = Strike.new(watch, battle)
local events = Events.new()
local mark = Mark.new(strike, events)
local round = Round.new(mark, foe, 5)
local verdict = Verdict.new(round)
local experience = Experience.new()
local reward = Reward.new(experience, 25)
local payout = Payout.new(verdict, reward, foe)
local quest = Quest.new("clear the den", 3)
local order = Order.new(payout, quest)
local talk = Dialogue.new("clerk", { "watch the den", "count three" })
local notice = Notice.new(talk, order)

print(notice:say())
print(talk.step)
print(order:report())

-- Part B
-- In notice.lua, implement Notice:waiting().
-- Return whether the order report is "open".
-- Ask the order.
-- Do not speak.
-- Do not create a global.

-- Part C
-- Implement test_notice().
-- Run two checks named "waits while open" and "rests when done".
-- Use check and assert.
-- "waits while open" uses a quest with goal 3 before any speech.
-- It expects waiting true, and the dialogue step stays 1.
-- "rests when done" fills a creature with HP 9, power 3, prize 25, and goal 1.
-- It expects waiting false.
-- say returns "clerk is done", and the dialogue step stays 1.
-- Do not create a global.

local function test_notice()
  check("waits while open", function()
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
    assert(intro:waiting() == true)
    assert(speech.step == 1)
  end)

  check("rests when done", function()
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
    local job = Quest.new("clear the den", 1)
    local task = Order.new(bill, job)
    local speech = Dialogue.new("clerk", { "watch the den" })
    local intro = Notice.new(speech, task)
    task:fill()
    assert(intro:waiting() == false)
    assert(intro:say() == "clerk is done")
    assert(speech.step == 1)
  end)
end

test_notice()
