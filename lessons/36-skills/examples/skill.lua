local Skill = {}
Skill.__index = Skill

function Skill.new(name)
  return setmetatable({
    name = name,
    rank = 1,
    uses = 0,
  }, Skill)
end

function Skill:train(amount)
  if amount < 1 then
    return self.rank
  end
  self.uses = self.uses + amount
  self.rank = 1 + self.uses // 5
  return self.rank
end

return Skill
