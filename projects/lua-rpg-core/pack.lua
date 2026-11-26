local Pack = {}
Pack.__index = Pack

function Pack.new(inventory, item)
  return setmetatable({
    inventory = inventory,
    item = item,
  }, Pack)
end

function Pack:drink(player)
  if self.inventory:count(self.item.name) < 1 then
    return player.hp
  end
  self.inventory:take(self.item.name, 1)
  return self.item:use(player)
end

function Pack:stock()
  return self.inventory:count(self.item.name)
end

return Pack
