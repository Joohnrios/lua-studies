local Mark = {}
Mark.__index = Mark

function Mark.new(strike, events)
  return setmetatable({
    strike = strike,
    events = events,
  }, Mark)
end

function Mark:land()
  local before = self.strike.watch.creature.hp
  local hp = self.strike:hit()
  if hp < before then
    self.events:emit("hit")
  else
    self.events:emit("miss")
  end
  return hp
end

function Mark:latest()
  return self.events:last()
end

return Mark
