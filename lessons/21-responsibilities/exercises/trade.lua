local trade = {}

function trade.buy(player, price)
  if player.coins < price then
    return {
      coins = player.coins,
      state = "short",
    }
  end
  player.coins = player.coins - price
  return {
    coins = player.coins,
    state = "paid",
  }
end

return trade
