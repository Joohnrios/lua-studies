local Combat = {}
Combat.__index = Combat

function Combat.new(power)
  return setmetatable({ power = power }, Combat)
end

function Combat:strike(target)
  if self.power < 1 then
    return target.hp
  end
  target.hp = target.hp - self.power
  if target.hp < 0 then
    target.hp = 0
  end
  return target.hp
end

function Combat:verdict(target)
  self:strike(target)
  if target.hp == 0 then
    return "fainted"
  end
  return "standing"
end

return Combat
