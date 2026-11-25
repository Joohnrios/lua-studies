print(_VERSION)
print(jit.version)
print(type(unpack))
print(type(table.unpack))
print(type(setfenv))
print(type(math.type))
print(bit.band(5, 1))
print(type(require("ffi")))

local division = loadstring("return 7 // 2")

print(type(division))

local slot = {}

for n = 1, 3 do
  slot[n] = function()
    return n
  end
end

print(slot[1]())
print(slot[3]())
