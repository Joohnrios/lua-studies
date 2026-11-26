local World = {}
World.__index = World

function World.new(player, creature)
  return setmetatable({
    player = player,
    creature = creature,
    log = {},
  }, World)
end

function World:look()
  local same = self.player.x == self.creature.x
    and self.player.y == self.creature.y
    and self.player.z == self.creature.z
  local word = "apart"
  if same then
    word = "meet"
  end
  self.log[#self.log + 1] = word
  return word
end

function World:meetings()
  local total = 0
  for index = 1, #self.log do
    if self.log[index] == "meet" then
      total = total + 1
    end
  end
  return total
end

return World
