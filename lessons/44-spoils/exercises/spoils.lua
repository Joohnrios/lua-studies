local Spoils = {}
Spoils.__index = Spoils

function Spoils.new(encounter, reward)
  return setmetatable({
    encounter = encounter,
    reward = reward,
  }, Spoils)
end

function Spoils:collect(target)
  self.encounter:act(target)
  return self.reward:grant(target)
end

function Spoils:peek(target)
  return self.reward:offer(target)
end

return Spoils
