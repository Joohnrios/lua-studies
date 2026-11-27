local Soffit = {}
Soffit.__index = Soffit

function Soffit.new(fascia, events)
  return setmetatable({
    fascia = fascia,
    events = events,
  }, Soffit)
end

function Soffit:set()
  local word = self.fascia:play()
  if word == "rise" then
    self.events:emit(word)
  end
  return word
end

function Soffit:once()
  return self.events:count("rise")
end

return Soffit
