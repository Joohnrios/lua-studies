local Spot = {}
Spot.__index = Spot

function Spot.new(cue, events)
  return setmetatable({
    cue = cue,
    events = events,
  }, Spot)
end

function Spot:mark()
  local word = self.cue:call()
  if word == "first" then
    self.events:emit(word)
  end
  return word
end

function Spot:once()
  return self.events:count("first")
end

return Spot
