local Player = {}
Player.__index = Player

function Player.new(name, hp, position)
  return setmetatable({
    name = name,
    hp = hp,
    max_hp = hp,
    x = position.x,
    y = position.y,
    z = position.z,
  }, Player)
end

function Player:move(dx, dy)
  self.x = self.x + dx
  self.y = self.y + dy
  return self.x, self.y, self.z
end

function Player:damage(amount)
  self.hp = self.hp - amount
  if self.hp < 0 then
    self.hp = 0
  end
  return self.hp
end

return Player
