local steps = {}

local function reject(amount)
  return amount < 0
end

function steps.gain(player, amount)
  if reject(amount) then
    return player.steps
  end
  player.steps = player.steps + amount
  return player.steps
end

return steps
