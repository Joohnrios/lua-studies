local name = "Pikachu"

print(#name)
print(string.sub(name, 1, 3))
print(string.sub(name, -3))

local upper = string.upper(name)

print(upper)
print(name)
print(string.format("%s Lv%d", name, 5))
print(1 .. 2)
print("10" + 1)

local accent = string.char(0xC3, 0xA1)

print(#accent)
print(string.match("lv 5", "%d+"))
