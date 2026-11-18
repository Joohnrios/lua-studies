local bag = { "potion", "ball" }
bag[4] = "berry"
bag.name = "ash"

for index, item in ipairs(bag) do
  print(index, item)
end

for key, value in pairs(bag) do
  print(key, value)
end

local function next_number(last, current)
  current = current + 1
  if current > last then
    return nil
  end
  return current
end

local function range(first, last)
  return next_number, last, first - 1
end

for n in range(1, 3) do
  print(n)
end

for word in string.gmatch("hp 30", "%d+") do
  print(word)
end
