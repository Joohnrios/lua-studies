-- Exercise 56 — Payout
-- Write each prediction before running this file from the repository root.
--
--   lua lessons/56-payout/exercises/main.lua

package.path = "./lessons/56-payout/exercises/?.lua;./projects/lua-rpg-core/?.lua;" .. package.path

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
-- predicted down: 0
-- predicted xp: 15

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

print(payout:close())
print(foe.hp)
print(experience.xp)

-- Part B
-- In payout.lua, implement Payout:quote().
-- Return the prize the reward would offer for this creature.
-- Ask the reward.
-- Do not judge, and do not grant.
-- Do not create a global.

-- Part C
-- Implement test_payout().
-- Run two checks named "names a fainted prize" and "holds a living prize".
-- Use check and assert.
-- "names a fainted prize" closes a creature with HP 9, power 3, and prize 25.
-- It expects level 2. It expects quote 25, and calling quote again still expects 25.
-- "holds a living prize" expects quote 0 and level 1.
-- Do not create a global.

local function test_payout()
  check("names a fainted prize", function()
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
    assert(bill:close() == 2)
    assert(bill:quote() == 25)
    assert(bill:quote() == 25)
    assert(foe.hp == 0)
  end)

  check("holds a living prize", function()
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
    assert(bill:quote() == 0)
    assert(growth.level == 1)
  end)
end

test_payout()
