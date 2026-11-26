local Turn = {}
Turn.__index = Turn

function Turn.new(player, world)
  return setmetatable({
    player = player,
    world = world,
  }, Turn)
end

function Turn:play(dx, dy)
  self.player:move(dx, dy)
  return self.world:look()
end

function Turn:rest()
  return self.world:look()
end

return Turn
