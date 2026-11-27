local Gate = {}
Gate.__index = Gate

function Gate.new(stamp, player)
  return setmetatable({
    stamp = stamp,
    player = player,
  }, Gate)
end

function Gate:pass()
  local word = self.stamp:press()
  if word == "closed" then
    return self.player:move(1, 0)
  end
  return self.player.x, self.player.y, self.player.z
end

function Gate:place()
  return self.player.x, self.player.y, self.player.z
end

return Gate
