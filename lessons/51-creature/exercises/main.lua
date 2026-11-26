-- Exercise 51 — Creature
-- Write each prediction before running this file from the repository root.
--
--   lua lessons/51-creature/exercises/main.lua

package.path = "./lessons/51-creature/exercises/?.lua;./projects/lua-rpg-core/?.lua;" .. package.path

local Player = require("player")
local Creature = require("creature")
local Watch = require("watch")

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
-- predicted living: true
-- predicted down: false
-- predicted left: 0
-- predicted moved: apart

local hero = Player.new("joy", 15, { x = 4, y = 1, z = 7 })
local foe = Creature.new("rattata", "mouse", 8, { x = 4, y = 1, z = 7 })
local watch = Watch.new(hero, foe)

print(watch:share())
print(foe:alive())

foe:damage(8)

print(foe:alive())
print(foe.hp)

hero:move(0, 2)

print(watch:share())

-- Part B
-- In watch.lua, implement Watch:ready().
-- Return true when the two share a tile and the creature is alive.
-- Return false when the tile differs or the creature has no HP.
-- Do not move, and do not damage.
-- Do not create a global.

-- Part C
-- Implement test_watch().
-- Run two checks named "stands together" and "faints in place".
-- Use check and assert.
-- "stands together" uses the same tile and HP above 0, and expects true.
-- "faints in place" uses the same tile and damages the creature to 0, and expects false.
-- Do not create a global.

local function test_watch()
  check("stands together", function()
    local hero = Player.new("joy", 15, { x = 4, y = 1, z = 7 })
    local foe = Creature.new("rattata", "mouse", 8, { x = 4, y = 1, z = 7 })
    local eyes = Watch.new(hero, foe)
    assert(eyes:ready() == true)
    assert(foe.hp == 8)
  end)

  check("faints in place", function()
    local hero = Player.new("joy", 15, { x = 4, y = 1, z = 7 })
    local foe = Creature.new("rattata", "mouse", 8, { x = 4, y = 1, z = 7 })
    foe:damage(8)
    local eyes = Watch.new(hero, foe)
    assert(eyes:ready() == false)
  end)
end

test_watch()
