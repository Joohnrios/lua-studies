-- Exercise 23 — Composition and inheritance
-- Write each prediction before running this file.
--
--   lua lessons/23-composition/exercises/composition.lua

local Weapon = {}
Weapon.__index = Weapon

function Weapon.new(damage)
  return setmetatable({ damage = damage }, Weapon)
end

function Weapon:hit()
  return self.damage
end

local Sword = setmetatable({}, { __index = Weapon })
Sword.__index = Sword

function Sword.new(damage)
  local self = Weapon.new(damage)
  return setmetatable(self, Sword)
end

function Sword:hit()
  return self.damage + 2
end

local function hunter(name, weapon)
  local self = { name = name }

  function self.attack()
    return weapon:hit()
  end

  return self
end

-- Part A
-- predicted hit: 7
-- predicted attack: 7
-- predicted field: nil
-- predicted chain: false

local blade = Sword.new(5)

print(blade:hit())

local ash = hunter("ash", blade)

print(ash.attack())
print(ash.damage)
print(getmetatable(ash) == Sword)

-- Part B
-- Implement Shield as a specialization of Armor.
-- Shield:absorb returns the stored defense plus 3.
-- Do not create a global.

local Armor = {}
Armor.__index = Armor

function Armor.new(defense)
  return setmetatable({ defense = defense }, Armor)
end

function Armor:absorb()
  return self.defense
end

local Shield = setmetatable({}, { __index = Armor })
Shield.__index = Shield

function Shield.new(defense)
  local self = Armor.new(defense)
  return setmetatable(self, Shield)
end

function Shield:absorb()
  return self.defense + 3
end

-- Part C
-- Implement guard(name, armor).
-- guard.block calls absorb on the armor it holds.
-- A guard is not an Armor and not a Shield.
-- Do not create a global.

local function guard(name, armor)
  local self = { name = name }

  function self.block()
    return armor:absorb()
  end

  return self
end

local shield = Shield.new(4)

print(shield:absorb())

local joy = guard("joy", shield)

print(joy.block())
print(getmetatable(joy) == Shield)
print(joy.defense)
