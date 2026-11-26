local Strike = {}
Strike.__index = Strike

function Strike.new(watch, battle)
  return setmetatable({
    watch = watch,
    battle = battle,
  }, Strike)
end

function Strike:hit()
  if not self.watch:ready() then
    return self.watch.creature.hp
  end
  return self.battle:swing(self.watch.creature)
end

function Strike:hold()
  return self.watch.creature.hp
end

return Strike
