-- Exercise 48 — Item
-- Write each prediction before running this file from the repository root.
--
--   lua lessons/48-item/exercises/main.lua

package.path = "./lessons/48-item/exercises/?.lua;./projects/lua-rpg-core/?.lua;" .. package.path

local Player = require("player")
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
-- predicted healed: 17
-- predicted stored: 17
-- predicted capped: 20
-- predicted full: 20

local hero = Player.new("joy", 20, { x = 2, y = 2, z = 7 })
hero:damage(8)

local potion = Item.new("potion", "healing", 5)

print(potion:use(hero))
print(hero.hp)
print(potion:use(hero))
print(hero.hp)

-- Part B
-- In item.lua, implement Item:full(player).
-- Return true when the player HP is already at the maximum.
-- Return false while the player is below that maximum.
-- Do not heal.
-- Do not create a global.

-- Part C
-- Implement test_item().
-- Run two checks named "sees a full bar" and "sees a wound".
-- Use check and assert.
-- "sees a full bar" uses a new player at 20 HP and expects true.
-- "sees a wound" damages that kind of player by 8 and expects false.
-- Do not create a global.

local function test_item()
  check("sees a full bar", function()
    local hero = Player.new("joy", 20, { x = 2, y = 2, z = 7 })
    local potion = Item.new("potion", "healing", 5)
    assert(potion:full(hero) == true)
    assert(hero.hp == 20)
  end)

  check("sees a wound", function()
    local hero = Player.new("joy", 20, { x = 2, y = 2, z = 7 })
    hero:damage(8)
    local potion = Item.new("potion", "healing", 5)
    assert(potion:full(hero) == false)
  end)
end

test_item()
