local function bite(actor, target)
  target.hp = target.hp - 4
  return target.hp
end

local function scratch(actor, target)
  target.hp = target.hp - actor.level
  return target.hp
end

local function fighter(name, level, behavior)
  local attack = behavior
  local self = { name = name, level = level }

  function self.use(target)
    return attack(self, target)
  end

  function self.change(next_behavior)
    attack = next_behavior
  end

  return self
end

local pika = fighter("pika", 3, bite)
local dummy = { hp = 20 }

print(pika.use(dummy))
pika.change(scratch)
print(pika.use(dummy))
