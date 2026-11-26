-- Exercise 41 — Turn
-- Write each prediction before running this file from the repository root.
--
--   lua lessons/41-turn/exercises/main.lua

package.path = "./lessons/41-turn/exercises/?.lua;./projects/lua-rpg-core/?.lua;" .. package.path

local Player = require("player")
local World = require("world")
local Turn = require("turn")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

-- Part A
-- predicted arrived: meet
-- predicted row: 3
-- predicted left: apart
-- predicted column: 5
-- predicted notes: 2

local hero = Player.new("joy", 15, { x = 4, y = 2, z = 7 })
local creature = { name = "pika", x = 4, y = 3, z = 7 }
local world = World.new(hero, creature)
local turn = Turn.new(hero, world)

print(turn:play(0, 1))
print(hero.y)
print(turn:play(1, 0))
print(hero.x)
print(#world.log)

-- Part B
-- In turn.lua, implement Turn:rest().
-- Ask the world to look, and return that word.
-- Leave the player coordinates unchanged.
-- Do not create a global.

-- Part C
-- Implement test_turn().
-- Run two checks named "looks without moving" and "sees a gap".
-- Use check and assert.
-- "looks without moving" rests on a shared tile, expects "meet", and keeps x.
-- "sees a gap" rests with a different x and expects "apart".
-- Do not create a global.

local function test_turn()
  check("looks without moving", function()
    local hero = Player.new("joy", 15, { x = 4, y = 2, z = 7 })
    local creature = { x = 4, y = 2, z = 7 }
    local place = World.new(hero, creature)
    local round = Turn.new(hero, place)
    assert(round:rest() == "meet")
    assert(hero.x == 4)
  end)

  check("sees a gap", function()
    local hero = Player.new("joy", 15, { x = 4, y = 2, z = 7 })
    local creature = { x = 1, y = 2, z = 7 }
    local place = World.new(hero, creature)
    local round = Turn.new(hero, place)
    assert(round:rest() == "apart")
  end)
end

test_turn()
