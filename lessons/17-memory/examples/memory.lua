local cache = setmetatable({}, { __mode = "v" })
local pokemon = { name = "pika" }

cache.slot = pokemon
print(cache.slot.name)

pokemon = nil
collectgarbage("collect")
print(cache.slot)

local kept = { name = "bulba" }

cache.slot = kept
collectgarbage("collect")
print(cache.slot.name)

local names = setmetatable({}, { __mode = "v" })

names[1] = "ash"
collectgarbage("collect")
print(names[1])

local labels = setmetatable({}, { __mode = "k" })
local creature = {}

labels[creature] = "starter"
creature = nil
collectgarbage("collect")

local count = 0

for _ in pairs(labels) do
  count = count + 1
end

print(count)
print(type(collectgarbage("count")))

local seen = {}
local finalizer = {
  __gc = function()
    seen[#seen + 1] = "released"
  end,
}
local item = setmetatable({}, finalizer)

item = nil
collectgarbage("collect")
print(seen[1])
