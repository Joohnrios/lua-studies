-- Exercise 40 — RPG core
-- Write each prediction before running this file from the repository root.
--
--   lua lessons/40-rpg-core/exercises/main.lua

package.path = package.path .. ";./lessons/40-rpg-core/exercises/?.lua"

local World = require("world")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

-- Part A
-- predicted same: meet
-- predicted size: 1
-- predicted moved: apart
-- predicted word: apart
-- predicted kept: 2

local world = World.new(
  { name = "joy", x = 1, y = 4, z = 7 },
  { name = "pika", x = 1, y = 4, z = 7 }
)

print(world:look())
print(#world.log)

world.creature.y = 5

print(world:look())
print(world.log[#world.log])
print(#world.log)

-- Part B
-- In world.lua, implement World:meetings().
-- Return how many log entries are "meet".
-- Do not create a global.

-- Part C
-- Implement test_world().
-- Run two checks named "counts a shared tile" and "ignores a different floor".
-- Use check and assert.
-- "counts a shared tile" calls look once on the same tile and expects 1.
-- "ignores a different floor" calls look once with a different z and expects 0.
-- Do not create a global.

local function test_world()
  check("counts a shared tile", function()
    local place = World.new(
      { x = 1, y = 1, z = 7 },
      { x = 1, y = 1, z = 7 }
    )
    place:look()
    assert(place:meetings() == 1)
  end)

  check("ignores a different floor", function()
    local place = World.new(
      { x = 1, y = 1, z = 7 },
      { x = 1, y = 1, z = 6 }
    )
    place:look()
    assert(place:meetings() == 0)
  end)
end

test_world()
