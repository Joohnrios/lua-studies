local Potion = {}
Potion.__index = Potion

function Potion.new(heal)
  return setmetatable({ heal = heal }, Potion)
end

function Potion:apply(creature)
  creature.hp = creature.hp + self.heal
  return creature.hp
end

local SuperPotion = setmetatable({}, { __index = Potion })
SuperPotion.__index = SuperPotion

function SuperPotion.new(heal)
  local self = Potion.new(heal)
  return setmetatable(self, SuperPotion)
end

function SuperPotion:apply(creature)
  creature.hp = creature.hp + self.heal + 5
  return creature.hp
end

local strong = SuperPotion.new(10)
local creature = { hp = 30 }

print(strong:apply(creature))
print(getmetatable(strong) == SuperPotion)

local function healer(name, item)
  local self = { name = name }

  function self.treat(target)
    return item:apply(target)
  end

  return self
end

local joy = healer("joy", Potion.new(20))
local patient = { hp = 10 }

print(joy.treat(patient))
print(getmetatable(joy) == Potion)
print(joy.heal)
