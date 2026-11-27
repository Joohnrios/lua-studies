local Rafter = {}
Rafter.__index = Rafter

function Rafter.new(valley, events)
  return setmetatable({
    valley = valley,
    events = events,
  }, Rafter)
end

function Rafter:place()
  local word = self.valley:play()
  if word == "rise" then
    self.events:emit(word)
  end
  return word
end

function Rafter:once()
  return self.events:count("rise")
end

return Rafter
