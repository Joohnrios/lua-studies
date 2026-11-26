local Quest = {}
Quest.__index = Quest

function Quest.new(name, goal)
  return setmetatable({
    name = name,
    goal = goal,
    progress = 0,
  }, Quest)
end

function Quest:advance(amount)
  if amount < 1 then
    return self.progress
  end
  self.progress = self.progress + amount
  if self.progress > self.goal then
    self.progress = self.goal
  end
  return self.progress
end

function Quest:done()
  return self.progress >= self.goal
end

function Quest:status()
  if self:done() then
    return "done"
  end
  return "open"
end

return Quest
