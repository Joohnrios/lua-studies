-- Exercise 37 — Quest
-- Write each prediction before running this file from the repository root.
--
--   lua lessons/37-quest/exercises/main.lua

package.path = package.path .. ";./lessons/37-quest/exercises/?.lua"

local Quest = require("quest")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

-- Part A
-- predicted partial: 3
-- predicted open: false
-- predicted capped: 8
-- predicted finished: true
-- predicted held: 8

local quest = Quest.new("shells", 8)

print(quest:advance(3))
print(quest:done())
print(quest:advance(6))
print(quest:done())
print(quest:advance(0))

-- Part B
-- In quest.lua, implement Quest:status().
-- Return "done" when the quest is done.
-- Return "open" while the goal is still ahead.
-- Do not create a global.

-- Part C
-- Implement test_quest().
-- Run two checks named "names an open quest" and "names a finished quest".
-- Use check and assert.
-- "names an open quest" advances 2 toward a goal of 5 and expects "open".
-- "names a finished quest" advances 5 toward a goal of 5 and expects "done".
-- Do not create a global.

local function test_quest()
  check("names an open quest", function()
    local shells = Quest.new("shells", 5)
    shells:advance(2)
    assert(shells:status() == "open")
  end)

  check("names a finished quest", function()
    local shells = Quest.new("shells", 5)
    shells:advance(5)
    assert(shells:status() == "done")
  end)
end

test_quest()
