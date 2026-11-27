local Payout = {}
Payout.__index = Payout

function Payout.new(verdict, reward, creature)
  return setmetatable({
    verdict = verdict,
    reward = reward,
    creature = creature,
  }, Payout)
end

function Payout:close()
  self.verdict:judge()
  return self.reward:grant(self.creature)
end

function Payout:quote()
  return self.reward:offer(self.creature)
end

return Payout
