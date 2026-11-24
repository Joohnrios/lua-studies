local Creature = {}
Creature.__index = Creature

function Creature.new(name, hp)
  return setmetatable({ name = name, hp = hp }, Creature)
end

function Creature:damage(amount)
  self.hp = self.hp - amount
  if self.hp < 0 then
    self.hp = 0
  end
  return self.hp
end

local Pokemon = setmetatable({}, { __index = Creature })
Pokemon.__index = Pokemon

function Pokemon.new(name, hp, species)
  local self = Creature.new(name, hp)
  setmetatable(self, Pokemon)
  self.species = species
  return self
end

function Pokemon:label()
  return self.species
end

local pika = Pokemon.new("pika", 30, "pikachu")

print(pika:damage(5))
print(pika:label())
print(getmetatable(pika) == Pokemon)
