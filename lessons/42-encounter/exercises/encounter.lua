local Encounter = {}
Encounter.__index = Encounter

function Encounter.new(world, battle)
  return setmetatable({
    world = world,
    battle = battle,
  }, Encounter)
end

function Encounter:act(target)
  local word = self.world:look()
  if word == "apart" then
    return target.hp
  end
  return self.battle:swing(target)
end

function Encounter:spare()
  return self.world:look()
end

return Encounter
