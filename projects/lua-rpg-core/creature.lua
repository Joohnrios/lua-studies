local Creature = {}
Creature.__index = Creature

function Creature.new(name, species, hp, position)
  return setmetatable({
    name = name,
    species = species,
    hp = hp,
    max_hp = hp,
    x = position.x,
    y = position.y,
    z = position.z,
  }, Creature)
end

function Creature:alive()
  return self.hp > 0
end

function Creature:damage(amount)
  self.hp = self.hp - amount
  if self.hp < 0 then
    self.hp = 0
  end
  return self.hp
end

function Creature:move(dx, dy)
  self.x = self.x + dx
  self.y = self.y + dy
  return self.x, self.y, self.z
end

function Creature:same_place(other)
  return self.x == other.x and self.y == other.y and self.z == other.z
end

return Creature
