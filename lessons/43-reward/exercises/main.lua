-- Exercise 43 — Reward
-- Write each prediction before running this file from the repository root.
--
--   lua lessons/43-reward/exercises/main.lua

package.path = "./lessons/43-reward/exercises/?.lua;./projects/lua-rpg-core/?.lua;" .. package.path

local Experience = require("experience")
local Reward = require("reward")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

-- Part A
-- predicted alive: 1
-- predicted raised: 2
-- predicted stored: 15
-- predicted crossed: 3
-- predicted left: 20

local progress = Experience.new()
local reward = Reward.new(progress, 25)
local foe = { hp = 8 }

print(reward:grant(foe))

foe.hp = 0

print(reward:grant(foe))
print(progress.xp)
print(reward:grant(foe))
print(progress.xp)

-- Part B
-- In reward.lua, implement Reward:offer(target).
-- Return the prize amount when the target HP is 0.
-- Return 0 while the target still has HP.
-- Leave the level and the stored XP unchanged.
-- Do not create a global.

-- Part C
-- Implement test_reward().
-- Run two checks named "names the prize" and "holds the prize".
-- Use check and assert.
-- "names the prize" offers 10 to a target with HP 0 and expects 10.
-- "holds the prize" offers 10 to a target with HP 4 and expects 0.
-- Do not create a global.

local function test_reward()
  check("names the prize", function()
    local track = Experience.new()
    local prize = Reward.new(track, 10)
    local target = { hp = 0 }
    assert(prize:offer(target) == 10)
    assert(track.level == 1)
  end)

  check("holds the prize", function()
    local track = Experience.new()
    local prize = Reward.new(track, 10)
    local target = { hp = 4 }
    assert(prize:offer(target) == 0)
    assert(track.level == 1)
  end)
end

test_reward()
