local Pulse = {}
Pulse.__index = Pulse

function Pulse.new(spot)
  return setmetatable({ spot = spot }, Pulse)
end

function Pulse:beat()
  self.spot:mark()
  return self.spot:once()
end

function Pulse:kept()
  return self.spot:once()
end

return Pulse
