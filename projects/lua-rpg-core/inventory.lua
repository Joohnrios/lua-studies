local Inventory = {}
Inventory.__index = Inventory

function Inventory.new()
  return setmetatable({ slots = {} }, Inventory)
end

function Inventory:add(item)
  for index = 1, #self.slots do
    local slot = self.slots[index]
    if slot.name == item.name then
      slot.count = slot.count + item.count
      return slot.count
    end
  end
  self.slots[#self.slots + 1] = {
    name = item.name,
    count = item.count,
  }
  return item.count
end

function Inventory:count(name)
  for index = 1, #self.slots do
    local slot = self.slots[index]
    if slot.name == name then
      return slot.count
    end
  end
  return 0
end

function Inventory:take(name, amount)
  for index = 1, #self.slots do
    local slot = self.slots[index]
    if slot.name == name then
      slot.count = slot.count - amount
      if slot.count <= 0 then
        table.remove(self.slots, index)
        return 0
      end
      return slot.count
    end
  end
  return 0
end

return Inventory
