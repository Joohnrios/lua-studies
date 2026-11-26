local Battle = {}
Battle.__index = Battle

function Battle.new(power)
  return setmetatable({ power = power }, Battle)
end

function Battle:swing(target)
  if self.power < 1 then
    return target.hp
  end
  target.hp = target.hp - self.power
  if target.hp < 0 then
    target.hp = 0
  end
  return target.hp
end

return Battle
