local March = {}
March.__index = March

function March.new(clef, player)
  return setmetatable({
    clef = clef,
    player = player,
  }, March)
end

function March:walk()
  local before = self.player.x
  self.clef:mark()
  if self.player.x ~= before then
    return "moved"
  end
  return "still"
end

function March:place()
  return self.player.x
end

return March
