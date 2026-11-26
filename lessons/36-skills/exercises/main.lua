-- Exercise 36 — Skills
-- Write each prediction before running this file from the repository root.
--
--   lua lessons/36-skills/exercises/main.lua

package.path = package.path .. ";./lessons/36-skills/exercises/?.lua"

local Skill = require("skill")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

-- Part A
-- predicted early: 1
-- predicted uses: 3
-- predicted ranked: 2
-- predicted total: 5
-- predicted later: 3
-- predicted kept: 11

local mining = Skill.new("mining")

print(mining:train(3))
print(mining.uses)
print(mining:train(2))
print(mining.uses)
print(mining:train(6))
print(mining.uses)

-- Part B
-- In skill.lua, implement Skill:progress().
-- Return the uses that have not yet completed a step of 5.
-- That remainder is uses % 5.
-- Do not create a global.

-- Part C
-- Implement test_skill().
-- Run two checks named "reports the remainder" and "resets the step".
-- Use check and assert.
-- "reports the remainder" trains 3 and expects progress 3.
-- "resets the step" trains 5 and expects progress 0.
-- Do not create a global.

local function test_skill()
  check("reports the remainder", function()
    local skill = Skill.new("mining")
    skill:train(3)
    assert(skill:progress() == 3)
  end)

  check("resets the step", function()
    local skill = Skill.new("mining")
    skill:train(5)
    assert(skill:progress() == 0)
  end)
end

test_skill()
