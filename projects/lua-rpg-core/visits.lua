local Visits = {}
Visits.__index = Visits

function Visits.new(threshold, world)
  return setmetatable({
    threshold = threshold,
    world = world,
  }, Visits)
end

function Visits:step()
  self.threshold:cross()
  return self.world:meetings()
end

function Visits:total()
  return self.world:meetings()
end

return Visits
