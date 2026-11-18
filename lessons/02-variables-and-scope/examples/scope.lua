local hp = 100

if hp > 0 then
  local bonus = 5
  hp = hp + bonus
end

print(hp)
print(bonus)

local name = "ash"

do
  local name = "misty"
  print(name)
end

print(name)

local count = 0

local function add()
  count = count + 1
  return count
end

print(add())
print(add())
print(count)

local n = 10

local function heal()
  local n = n + 5
  return n
end

print(heal())
print(n)
