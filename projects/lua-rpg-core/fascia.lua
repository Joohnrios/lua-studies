local Fascia = {}
Fascia.__index = Fascia

function Fascia.new(eave)
  return setmetatable({ eave = eave }, Fascia)
end

function Fascia:play()
  local before = self.eave:kept()
  local after = self.eave:hang()
  if after > before then
    return "rise"
  end
  return "hold"
end

function Fascia:open()
  return self.eave:kept() > 0
end

return Fascia
