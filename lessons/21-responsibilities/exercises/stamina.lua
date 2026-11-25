local stamina = {}

local function limit(value)
  if value < 0 then
    return 0
  end
  return value
end

function stamina.spend(actor, amount)
  actor.stamina = limit(actor.stamina - amount)
  local state = "ready"
  if actor.stamina < 10 then
    state = "tired"
  end
  return {
    stamina = actor.stamina,
    state = state,
  }
end

return stamina
