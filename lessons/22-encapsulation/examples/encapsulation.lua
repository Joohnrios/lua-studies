local function pouch(initial)
  local coins = initial
  local self = {}

  function self.pay(price)
    if coins < price then
      return false
    end
    coins = coins - price
    return true
  end

  function self.balance()
    return coins
  end

  return self
end

local bag = pouch(20)

print(bag.pay(5))
print(bag.balance())
print(bag.coins)
print(bag.pay(100))
print(bag.balance())
