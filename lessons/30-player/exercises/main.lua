-- Exercise 30 — Player
-- Write each prediction before running this file from the repository root.
--
--   lua lessons/30-player/exercises/main.lua

package.path = package.path .. ";./lessons/30-player/exercises/?.lua"

local Player = require("player")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

-- Part A
-- predicted move: 3	1	7
-- predicted floor: 7
-- predicted hurt: 20
-- predicted zero: 0

local ash = Player.new("ash", 30, { x = 1, y = 2, z = 7 })

print(ash:move(2, -1))
print(ash.z)
print(ash:damage(10))
print(ash:damage(50))

-- Part B
-- In player.lua, implement Player:heal(amount).
-- Add amount to hp and return the new hp.
-- Never return a value above max_hp.
-- A negative amount leaves hp unchanged.

-- Part C
-- Implement test_player().
-- Run three checks named "heals", "caps", and "ignores a negative".
-- Use check and assert.
-- "heals" starts at 10, max 40, heals 5, and expects 15.
-- "caps" starts at 18, max 20, heals 5, and expects 20.
-- "ignores a negative" starts at 12, max 20, heals -3, and expects 12.
-- Do not create a global.

local function test_player()
  local spot = { x = 0, y = 0, z = 0 }

  check("heals", function()
    local hero = Player.new("hero", 10, spot)
    hero.max_hp = 40
    assert(hero:heal(5) == 15)
  end)

  check("caps", function()
    local hero = Player.new("hero", 18, spot)
    hero.max_hp = 20
    assert(hero:heal(5) == 20)
  end)

  check("ignores a negative", function()
    local hero = Player.new("hero", 12, spot)
    hero.max_hp = 20
    assert(hero:heal(-3) == 12)
  end)
end

test_player()
