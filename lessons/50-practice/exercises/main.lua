-- Exercise 50 — Practice
-- Write each prediction before running this file from the repository root.
--
--   lua lessons/50-practice/exercises/main.lua

package.path = "./lessons/50-practice/exercises/?.lua;./projects/lua-rpg-core/?.lua;" .. package.path

local Player = require("player")
local Item = require("item")
local Inventory = require("inventory")
local Pack = require("pack")
local Skill = require("skill")
local Practice = require("practice")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

-- Part A
-- predicted healed: 30
-- predicted uses: 1
-- predicted held: 30
-- predicted rank: 1

local hero = Player.new("joy", 40, { x = 2, y = 2, z = 7 })
hero:damage(15)

local potion = Item.new("potion", "healing", 5)
local bag = Inventory.new()
bag:add({ name = "potion", count = 1 })

local pack = Pack.new(bag, potion)
local skill = Skill.new("medicine")
local practice = Practice.new(pack, skill)

print(practice:sip(hero))
print(skill.uses)
print(practice:sip(hero))
print(skill.rank)

-- Part B
-- In practice.lua, implement Practice:step().
-- Return the uses that have not yet completed a step of 5.
-- Do not sip, and do not train.
-- Do not create a global.

-- Part C
-- Implement test_practice().
-- Run two checks named "reports the remainder" and "resets the step".
-- Use check and assert.
-- "reports the remainder" sips once from one potion and expects step 1.
-- Calling step again still expects 1.
-- "resets the step" sips five times from five potions and expects step 0.
-- Do not create a global.

local function test_practice()
  check("reports the remainder", function()
    local hero = Player.new("joy", 40, { x = 2, y = 2, z = 7 })
    local potion = Item.new("potion", "healing", 5)
    local bag = Inventory.new()
    bag:add({ name = "potion", count = 1 })
    local pack = Pack.new(bag, potion)
    local trade = Skill.new("medicine")
    local drill = Practice.new(pack, trade)
    drill:sip(hero)
    assert(drill:step() == 1)
    assert(drill:step() == 1)
    assert(trade.uses == 1)
  end)

  check("resets the step", function()
    local hero = Player.new("joy", 40, { x = 2, y = 2, z = 7 })
    local potion = Item.new("potion", "healing", 5)
    local bag = Inventory.new()
    bag:add({ name = "potion", count = 5 })
    local pack = Pack.new(bag, potion)
    local trade = Skill.new("medicine")
    local drill = Practice.new(pack, trade)
    drill:sip(hero)
    drill:sip(hero)
    drill:sip(hero)
    drill:sip(hero)
    drill:sip(hero)
    assert(drill:step() == 0)
  end)
end

test_practice()
