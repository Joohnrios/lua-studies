-- Exercise 14 — Objects
-- Write each prediction before running this file.
--
--   lua lessons/14-objects/exercises/objects.lua

-- Part A
-- predicted hp: 30
-- predicted label: nurse

local Actor = {}
Actor.__index = Actor

function Actor.new(name, hp)
  return setmetatable({ name = name, hp = hp }, Actor)
end

function Actor:damage(amount)
  self.hp = self.hp - amount
  return self.hp
end

local Npc = setmetatable({}, { __index = Actor })
Npc.__index = Npc

function Npc.new(name, hp, title)
  local self = Actor.new(name, hp)
  setmetatable(self, Npc)
  self.title = title
  return self
end

function Npc:label()
  return self.title
end

local nurse = Npc.new("joy", 40, "nurse")

print(nurse:damage(10))
print(nurse:label())

-- Part B
-- Implement Potion.new(name, heal) and Potion:apply(creature).
-- apply adds heal to creature.hp and returns the new hp.
-- Do not create a global.

local Potion = {}
Potion.__index = Potion

function Potion.new(name, heal)
  return setmetatable({ name = name, heal = heal }, Potion)
end

function Potion:apply(creature)
  creature.hp = creature.hp + self.heal
  return creature.hp
end

-- Part C
-- Implement SuperPotion as a specialization of Potion.
-- SuperPotion:apply adds the stored heal plus 5.
-- A SuperPotion created with heal 10 adds 15.
-- Do not create a global.

local SuperPotion = setmetatable({}, { __index = Potion })
SuperPotion.__index = SuperPotion

function SuperPotion.new(name, heal)
  local self = Potion.new(name, heal)
  return setmetatable(self, SuperPotion)
end

function SuperPotion:apply(creature)
  creature.hp = creature.hp + self.heal + 5
  return creature.hp
end

local potion = Potion.new("potion", 20)
local creature = { hp = 30 }

print(potion:apply(creature))

local strong = SuperPotion.new("super potion", 10)

print(strong:apply(creature))
