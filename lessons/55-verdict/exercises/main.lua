-- Exercise 55 — Verdict
-- Write each prediction before running this file from the repository root.
--
--   lua lessons/55-verdict/exercises/main.lua

package.path = "./lessons/55-verdict/exercises/?.lua;./projects/lua-rpg-core/?.lua;" .. package.path

local Player = require("player")
local Creature = require("creature")
local Watch = require("watch")
local Battle = require("battle")
local Strike = require("strike")
local Events = require("events")
local Mark = require("mark")
local Round = require("round")
local Verdict = require("verdict")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

-- Part A
-- predicted word: faint
-- predicted down: 0
-- predicted hits: 3

local hero = Player.new("joy", 15, { x = 3, y = 3, z = 7 })
local foe = Creature.new("rattata", "mouse", 9, { x = 3, y = 3, z = 7 })
local watch = Watch.new(hero, foe)
local battle = Battle.new(3)
local strike = Strike.new(watch, battle)
local events = Events.new()
local mark = Mark.new(strike, events)
local round = Round.new(mark, foe, 5)
local verdict = Verdict.new(round)

print(verdict:judge())
print(foe.hp)
print(events:count("hit"))

-- Part B
-- In verdict.lua, implement Verdict:tally().
-- Return how many hits the round recorded.
-- Ask the round for that count.
-- Do not judge.
-- Do not create a global.

-- Part C
-- Implement test_verdict().
-- Run two checks named "counts a faint" and "starts at zero".
-- Use check and assert.
-- "counts a faint" judges a creature with HP 9 and power 3, and expects "faint".
-- The same check expects tally 3, and calling tally again still expects 3.
-- "starts at zero" expects tally 0.
-- Do not create a global.

local function test_verdict()
  check("counts a faint", function()
    local hero = Player.new("joy", 15, { x = 3, y = 3, z = 7 })
    local foe = Creature.new("rattata", "mouse", 9, { x = 3, y = 3, z = 7 })
    local eyes = Watch.new(hero, foe)
    local hit = Battle.new(3)
    local blow = Strike.new(eyes, hit)
    local board = Events.new()
    local note = Mark.new(blow, board)
    local bout = Round.new(note, foe, 5)
    local word = Verdict.new(bout)
    assert(word:judge() == "faint")
    assert(word:tally() == 3)
    assert(word:tally() == 3)
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
    assert(word:tally() == 0)
  end)
end

test_verdict()
