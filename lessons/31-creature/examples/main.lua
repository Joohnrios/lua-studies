package.path = "./lessons/31-creature/examples/?.lua;" .. package.path

local Creature = require("creature")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

local pika = Creature.new("pika", "pikachu", 30, { x = 4, y = 2, z = 7 })

print(pika.species)
print(pika:alive())

local x, y, z = pika:move(1, 0)

print(x)
print(y)
print(z)
print(pika:damage(10))
print(pika:damage(40))
print(pika:alive())

check("faints at zero", function()
  local rat = Creature.new("rat", "rattata", 4, { x = 0, y = 0, z = 1 })
  rat:damage(4)
  assert(rat:alive() == false)
end)
