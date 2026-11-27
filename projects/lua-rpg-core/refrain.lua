local Refrain = {}
Refrain.__index = Refrain

function Refrain.new(phrase, events)
  return setmetatable({
    phrase = phrase,
    events = events,
  }, Refrain)
end

function Refrain:sing()
  local word = self.phrase:say()
  return self.events:count(word)
end

function Refrain:copies()
  return self.events:count(self.phrase:latest())
end

return Refrain
