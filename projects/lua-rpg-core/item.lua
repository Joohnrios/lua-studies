local Item = {}
Item.__index = Item

function Item.new(name, kind, heal)
  return setmetatable({
    name = name,
    kind = kind,
    heal = heal,
  }, Item)
end

function Item:use(player)
  return player:heal(self.heal)
end

function Item:label()
  return self.name .. " " .. self.kind
end

function Item:full(player)
  return player.hp == player.max_hp
end

return Item
