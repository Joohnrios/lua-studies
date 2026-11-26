-- Exercise 32 — Item
-- Write each prediction before running this file from the repository root.
--
--   lua lessons/32-item/exercises/main.lua

package.path = package.path .. ";./lessons/32-item/exercises/?.lua"

local Item = require("item")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

-- Part A
-- predicted kind: healing
-- predicted healed: 35
-- predicted capped: 50
-- predicted held: 50

local potion = Item.new("super potion", "healing", 15)
local creature = { hp = 20, max_hp = 50 }

print(potion.kind)
print(potion:apply(creature))

creature.hp = 45
print(potion:apply(creature))

local ball = Item.new("ball", "held", 0)

print(ball:apply(creature))

-- Part B
-- In item.lua, implement Item:label().
-- Return name, a space, and kind.

-- Part C
-- Implement test_item().
-- Run two checks named "adds the heal" and "writes the label".
-- Use check and assert.
-- "adds the heal" uses a potion of heal 10 on hp 5, max 40, and expects 15.
-- "writes the label" expects "potion healing" from Item.new("potion", "healing", 10).
-- Do not create a global.

local function test_item()
  check("adds the heal", function()
    local medicine = Item.new("potion", "healing", 10)
    local target = { hp = 5, max_hp = 40 }
    assert(medicine:apply(target) == 15)
  end)

  check("writes the label", function()
    local medicine = Item.new("potion", "healing", 10)
    assert(medicine:label() == "potion healing")
  end)
end

test_item()
