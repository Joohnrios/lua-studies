local Purlin = {}
Purlin.__index = Purlin

function Purlin.new(rake, events)
  return setmetatable({
    rake = rake,
    events = events,
  }, Purlin)
end

function Purlin:seat()
  local word = self.rake:play()
  if word == "rise" then
    self.events:emit(word)
  end
  return word
end

function Purlin:once()
  return self.events:count("rise")
end

return Purlin
