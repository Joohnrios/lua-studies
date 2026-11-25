local function damage(hp, amount)
  local next_hp = hp - amount
  if next_hp < 0 then
    next_hp = 0
  end
  return next_hp
end

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

check("subtracts", function()
  assert(damage(30, 10) == 20)
end)

check("floors at zero", function()
  assert(damage(5, 12) == 0)
end)
