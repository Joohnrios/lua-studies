-- Exercise 31 — Creature
-- Write each prediction before running this file from the repository root.
--
--   lua lessons/31-creature/exercises/main.lua

package.path = package.path .. ";./lessons/31-creature/exercises/?.lua"

local Creature = require("creature")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

-- Part A
-- predicted species: rattata
-- predicted alive: true
-- predicted move: 2	7	3
-- predicted floor: 3
-- predicted hurt: 5
-- predicted zero: 0
-- predicted fainted: false

local rat = Creature.new("rat", "rattata", 8, { x = 2, y = 5, z = 3 })

print(rat.species)
print(rat:alive())
print(rat:move(0, 2))
print(rat.z)
print(rat:damage(3))
print(rat:damage(20))
print(rat:alive())

-- Part B
-- In creature.lua, implement Creature:same_place(other).
-- Return true when x, y, and z are the same on both creatures.
-- Return false when any axis differs.

-- Part C
-- Implement test_creature().
-- Run two checks named "shares a place" and "rejects another floor".
-- Use check and assert.
-- "shares a place" builds two creatures at x 1, y 1, z 7 and expects true.
-- "rejects another floor" builds one at z 7 and another at z 6 and expects false.
-- Do not create a global.

local function test_creature()
  check("shares a place", function()
    local first = Creature.new("a", "one", 10, { x = 1, y = 1, z = 7 })
    local second = Creature.new("b", "two", 10, { x = 1, y = 1, z = 7 })
    assert(first:same_place(second) == true)
  end)

  check("rejects another floor", function()
    local first = Creature.new("a", "one", 10, { x = 1, y = 1, z = 7 })
    local second = Creature.new("b", "two", 10, { x = 1, y = 1, z = 6 })
    assert(first:same_place(second) == false)
  end)
end

test_creature()
