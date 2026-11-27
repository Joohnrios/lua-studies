local Threshold = {}
Threshold.__index = Threshold

function Threshold.new(gate, world)
  return setmetatable({
    gate = gate,
    world = world,
  }, Threshold)
end

function Threshold:cross()
  self.gate:pass()
  return self.world:look()
end

function Threshold:glance()
  return self.world:look()
end

return Threshold
