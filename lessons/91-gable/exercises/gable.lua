local Gable = {}
Gable.__index = Gable

function Gable.new(ridge, events)
  return setmetatable({
    ridge = ridge,
    events = events,
  }, Gable)
end

function Gable:fit()
  local word = self.ridge:play()
  if word == "rise" then
    self.events:emit(word)
  end
  return word
end

function Gable:once()
  return self.events:count("rise")
end

return Gable
