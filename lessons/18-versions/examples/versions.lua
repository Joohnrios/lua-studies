print(_VERSION)
print(math.type(4))
print(math.type(4 / 2))
print(7 // 2)
print(type(table.unpack))
print(type(unpack))
print(type(setfenv))
print(type(loadstring))
print(type(bit32))
print(type(utf8))

local counted = setmetatable({ 10, 20, 30 }, {
  __len = function()
    return 1
  end,
})

print(#counted)

local slot = {}

for n = 1, 3 do
  slot[n] = function()
    return n
  end
end

print(slot[1]())
print(slot[3]())
