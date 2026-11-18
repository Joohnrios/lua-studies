for i = 1, 3 do
  print(i)
end

local n = 1

repeat
  print(n)
  n = n + 1
until n == 3

local hp = 10

for _ = 1, 5 do
  hp = hp - 4
  if hp <= 0 then
    hp = 0
    break
  end
end

print(hp)

local function divmod(a, b)
  return a // b, a % b
end

local quotient, remainder = divmod(7, 3)
local only = divmod(7, 3)

print(quotient, remainder)
print(only)

local function heal(hp, amount)
  if amount == nil then
    amount = 1
  end
  return hp + amount
end

print(heal(10))
print(heal(10, 0))
