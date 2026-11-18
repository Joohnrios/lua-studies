print(5 / 2)
print(5 // 2)
print(2 ^ 3)
print(1 ~= 1)
print(not 0)
print(nil or "wild")
print(0 or "wild")

local hp = 12

if hp <= 0 then
  print("fainted")
elseif hp < 30 then
  print("critical")
else
  print("healthy")
end

local title = false
print(title and title or "wild")

if title == nil then
  title = "wild"
end

print(title)
