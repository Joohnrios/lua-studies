-- Exercise 35 — Combat
-- Write each prediction before running this file from the repository root.
--
--   lua lessons/35-combat/exercises/main.lua

package.path = package.path .. ";./lessons/35-combat/exercises/?.lua"

local Combat = require("combat")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

-- Part A
-- predicted first: 9
-- predicted second: 3
-- predicted floored: 0
-- predicted held: 0

local blow = Combat.new(6)
local target = { hp = 15 }

print(blow:strike(target))
print(blow:strike(target))
print(blow:strike(target))

local tap = Combat.new(0)
print(tap:strike(target))

-- Part B
-- In combat.lua, implement Combat:verdict(target).
-- Strike once.
-- Return "fainted" when the target HP is 0.
-- Return "standing" when the target still has HP.
-- Do not create a global.

-- Part C
-- Implement test_combat().
-- Run two checks named "names a survivor" and "names a faint".
-- Use check and assert.
-- "names a survivor" uses power 4 on HP 10 and expects "standing".
-- "names a faint" uses power 5 on HP 5 and expects "fainted".
-- Do not create a global.

local function test_combat()
  check("names a survivor", function()
    local hit = Combat.new(4)
    local foe = { hp = 10 }
    assert(hit:verdict(foe) == "standing")
  end)

  check("names a faint", function()
    local hit = Combat.new(5)
    local foe = { hp = 5 }
    assert(hit:verdict(foe) == "fainted")
  end)
end

test_combat()
