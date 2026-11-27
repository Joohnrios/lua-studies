-- Exercise 57 — Order
-- Write each prediction before running this file from the repository root.
--
--   lua lessons/57-order/exercises/main.lua

package.path = "./lessons/57-order/exercises/?.lua;./projects/lua-rpg-core/?.lua;" .. package.path

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

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

-- Part A
-- predicted level: 2
-- predicted step: 1
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

print(order:fill())
print(quest.progress)
print(quest:status())

-- Part B
-- In order.lua, implement Order:report().
-- Return the quest status.
-- Ask the quest.
-- Do not fill.
-- Do not create a global.

-- Part C
-- Implement test_order().
-- Run two checks named "names an open order" and "names a finished order".
-- Use check and assert.
-- "names an open order" fills a creature with HP 9, power 3, prize 25, and goal 3.
-- It expects report "open" and progress 1.
-- Calling report again still expects "open".
-- "names a finished order" fills a creature with HP 9, power 3, prize 25, and goal 1.
-- It expects report "done", and calling report again still expects "done".
-- Do not create a global.

local function test_order()
  check("names an open order", function()
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
    task:fill()
    assert(task:report() == "open")
    assert(job.progress == 1)
    assert(task:report() == "open")
  end)

  check("names a finished order", function()
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
    task:fill()
    assert(task:report() == "done")
    assert(task:report() == "done")
  end)
end

test_order()
