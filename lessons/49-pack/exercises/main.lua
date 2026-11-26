-- Exercise 49 — Pack
-- Write each prediction before running this file from the repository root.
--
--   lua lessons/49-pack/exercises/main.lua

package.path = "./lessons/49-pack/exercises/?.lua;./projects/lua-rpg-core/?.lua;" .. package.path

local Player = require("player")
local Item = require("item")
local Inventory = require("inventory")
local Pack = require("pack")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

-- Part A
-- predicted healed: 24
-- predicted stored: 24
-- predicted left: 0
-- predicted held: 24

local hero = Player.new("joy", 30, { x = 3, y = 3, z = 7 })
hero:damage(10)

local potion = Item.new("potion", "healing", 4)
local bag = Inventory.new()
bag:add({ name = "potion", count = 1 })

local pack = Pack.new(bag, potion)

print(pack:drink(hero))
print(hero.hp)
print(bag:count("potion"))
print(pack:drink(hero))

-- Part B
-- In pack.lua, implement Pack:stock().
-- Return how many of this item the inventory holds.
-- Do not drink, and do not change the player HP.
-- Do not create a global.

-- Part C
-- Implement test_pack().
-- Run two checks named "counts a stack" and "counts a miss".
-- Use check and assert.
-- "counts a stack" adds 2 potions, expects stock 2, and keeps the HP.
-- "counts a miss" expects stock 0.
-- Do not create a global.

local function test_pack()
  check("counts a stack", function()
    local hero = Player.new("joy", 30, { x = 3, y = 3, z = 7 })
    local potion = Item.new("potion", "healing", 4)
    local bag = Inventory.new()
    bag:add({ name = "potion", count = 2 })
    local pack = Pack.new(bag, potion)
    assert(pack:stock() == 2)
    assert(hero.hp == 30)
  end)

  check("counts a miss", function()
    local potion = Item.new("potion", "healing", 4)
    local bag = Inventory.new()
    local pack = Pack.new(bag, potion)
    assert(pack:stock() == 0)
  end)
end

test_pack()
