local slots = { "potion", "ball" }

print(slots[1])
print(#slots)
print(slots[0])

local creature = { name = "pikachu", hp = 30 }

print(creature.name)
print(creature["hp"])

local alias = creature
alias.hp = 20
print(creature.hp)

local bag = {}

table.insert(bag, "potion")
bag[#bag + 1] = "ball"

print(#bag)
print(bag[1])
print(bag[2])
