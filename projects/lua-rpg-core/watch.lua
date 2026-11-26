local Watch = {}
Watch.__index = Watch

function Watch.new(player, creature)
  return setmetatable({
    player = player,
    creature = creature,
  }, Watch)
end

function Watch:share()
  if self.creature:same_place(self.player) then
    return "meet"
  end
  return "apart"
end

function Watch:ready()
  return self:share() == "meet" and self.creature:alive()
end

return Watch
