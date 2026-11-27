local Chime = {}
Chime.__index = Chime

function Chime.new(echo, events)
  return setmetatable({
    echo = echo,
    events = events,
  }, Chime)
end

function Chime:ring()
  local word = self.echo:hear()
  if word == "new" then
    self.events:emit(word)
  end
  return word
end

function Chime:once()
  return self.events:count("new")
end

return Chime
