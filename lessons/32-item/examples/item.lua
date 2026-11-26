local Item = {}
Item.__index = Item

function Item.new(name, kind, heal)
  return setmetatable({
    name = name,
    kind = kind,
    heal = heal,
  }, Item)
end

function Item:apply(creature)
  if self.heal < 1 then
    return creature.hp
  end
  creature.hp = creature.hp + self.heal
  if creature.hp > creature.max_hp then
    creature.hp = creature.max_hp
  end
  return creature.hp
end

return Item
