local Reward = {}
Reward.__index = Reward

function Reward.new(experience, amount)
  return setmetatable({
    experience = experience,
    amount = amount,
  }, Reward)
end

function Reward:grant(target)
  if target.hp > 0 then
    return self.experience.level
  end
  return self.experience:gain(self.amount)
end

function Reward:offer(target)
  if target.hp == 0 then
    return self.amount
  end
  return 0
end

return Reward
