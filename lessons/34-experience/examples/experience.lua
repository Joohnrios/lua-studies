local Experience = {}
Experience.__index = Experience

function Experience.new()
  return setmetatable({
    level = 1,
    xp = 0,
  }, Experience)
end

function Experience:needed()
  return self.level * 10
end

function Experience:gain(amount)
  if amount < 1 then
    return self.level
  end
  self.xp = self.xp + amount
  while self.xp >= self:needed() do
    self.xp = self.xp - self:needed()
    self.level = self.level + 1
  end
  return self.level
end

return Experience
