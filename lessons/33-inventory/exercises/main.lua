-- Exercise 33 — Inventory
-- Write each prediction before running this file from the repository root.
--
--   lua lessons/33-inventory/exercises/main.lua

package.path = package.path .. ";./lessons/33-inventory/exercises/?.lua"

local Inventory = require("inventory")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

-- Part A
-- predicted first: 4
-- predicted stacked: 5
-- predicted other: 2
-- predicted missing: 0
-- predicted slots: 2

local bag = Inventory.new()

print(bag:add({ name = "berry", count = 4 }))
print(bag:add({ name = "berry", count = 1 }))
print(bag:add({ name = "antidote", count = 2 }))
print(bag:count("berry"))
print(bag:count("stone"))
print(#bag.slots)

-- Part B
-- In inventory.lua, implement Inventory:take(name, amount).
-- Subtract amount from the matching stack and return the remaining count.
-- When the remaining count reaches 0, remove that stack and return 0.
-- A missing name returns 0.
-- Do not create a global.

-- Part C
-- Implement test_inventory().
-- Run two checks named "leaves a remainder" and "drops an empty stack".
-- Use check and assert.
-- "leaves a remainder" adds 5 berries, takes 2, and expects count 3.
-- "drops an empty stack" adds 2 berries, takes 2, and expects count 0 and no slots.
-- Do not create a global.

local function test_inventory()
  check("leaves a remainder", function()
    local held = Inventory.new()
    held:add({ name = "berry", count = 5 })
    held:take("berry", 2)
    assert(held:count("berry") == 3)
  end)

  check("drops an empty stack", function()
    local held = Inventory.new()
    held:add({ name = "berry", count = 2 })
    held:take("berry", 2)
    assert(held:count("berry") == 0)
    assert(#held.slots == 0)
  end)
end

test_inventory()
