local Clef = {}
Clef.__index = Clef

function Clef.new(meter, events)
  return setmetatable({
    meter = meter,
    events = events,
  }, Clef)
end

function Clef:mark()
  local word = self.meter:play()
  if word == "rise" then
    self.events:emit(word)
  end
  return word
end

function Clef:once()
  return self.events:count("rise")
end

return Clef
