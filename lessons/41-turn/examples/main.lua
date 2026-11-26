package.path = "./projects/lua-rpg-core/?.lua;" .. package.path

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

local hero = Player.new("ash", 20, { x = 1, y = 1, z = 7 })
local creature = { name = "pika", x = 2, y = 1, z = 7 }
local world = World.new(hero, creature)
local turn = Turn.new(hero, world)

print(turn:play(1, 0))
print(hero.x)
print(turn:play(0, 1))
print(hero.y)
print(#world.log)

check("meets after one step", function()
  local mover = Player.new("ash", 20, { x = 1, y = 1, z = 7 })
  local other = { x = 2, y = 1, z = 7 }
  local place = World.new(mover, other)
  local round = Turn.new(mover, place)
  assert(round:play(1, 0) == "meet")
end)
