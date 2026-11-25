local health = {}

local function limit(hp)
  if hp < 0 then
    return 0
  end
  return hp
end

function health.apply(creature, amount)
  creature.hp = limit(creature.hp - amount)
  local state = "alive"
  if creature.hp == 0 then
    state = "fainted"
  end
  return {
    hp = creature.hp,
    state = state,
  }
end

return health
