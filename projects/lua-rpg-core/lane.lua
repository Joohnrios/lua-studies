local Lane = {}
Lane.__index = Lane

function Lane.new(stride, events)
  return setmetatable({
    stride = stride,
    events = events,
  }, Lane)
end

function Lane:cross()
  local word = self.stride:play()
  if word == "rise" then
    self.events:emit(word)
  end
  return word
end

function Lane:once()
  return self.events:count("rise")
end

return Lane
