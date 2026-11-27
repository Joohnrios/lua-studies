local Meter = {}
Meter.__index = Meter

function Meter.new(pulse)
  return setmetatable({ pulse = pulse }, Meter)
end

function Meter:play()
  local before = self.pulse:kept()
  local after = self.pulse:beat()
  if after > before then
    return "rise"
  end
  return "hold"
end

function Meter:open()
  return self.pulse:kept() > 0
end

return Meter
