local Order = {}
Order.__index = Order

function Order.new(payout, quest)
  return setmetatable({
    payout = payout,
    quest = quest,
  }, Order)
end

function Order:fill()
  local before = self.payout.creature:alive()
  local level = self.payout:close()
  if before and not self.payout.creature:alive() then
    self.quest:advance(1)
  end
  return level
end

function Order:report()
  return self.quest:status()
end

return Order
