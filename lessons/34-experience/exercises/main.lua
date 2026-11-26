-- Exercise 34 — Experience
-- Write each prediction before running this file from the repository root.
--
--   lua lessons/34-experience/exercises/main.lua

package.path = package.path .. ";./lessons/34-experience/exercises/?.lua"

local Experience = require("experience")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

-- Part A
-- predicted short: 1
-- predicted stored: 4
-- predicted raised: 2
-- predicted cleared: 0
-- predicted crossed: 3
-- predicted left: 1

local progress = Experience.new()

print(progress:gain(4))
print(progress.xp)
print(progress:gain(6))
print(progress.xp)
print(progress:gain(21))
print(progress.xp)

-- Part B
-- In experience.lua, implement Experience:room().
-- Return how much XP is still missing before the next level.
-- That gap is the current cost minus the stored XP.
-- Do not create a global.

-- Part C
-- Implement test_experience().
-- Run two checks named "reports the gap" and "opens the next cost".
-- Use check and assert.
-- "reports the gap" gains 4 and expects room 6.
-- "opens the next cost" gains 10 and expects room 20.
-- Do not create a global.

local function test_experience()
  check("reports the gap", function()
    local track = Experience.new()
    track:gain(4)
    assert(track:room() == 6)
  end)

  check("opens the next cost", function()
    local track = Experience.new()
    track:gain(10)
    assert(track:room() == 20)
  end)
end

test_experience()
