
local health = {}

-- Part B
function health.state(hp)
    if hp <= 0 then
        return "fainted"
    elseif hp < 30 then
        return "critical"
    else
        return "healthy"
    end
end

-- Private function to prevent negative HP
local function limit_hp(hp)
    if hp < 0 then
        return 0
    end

    return hp
end

-- Part C
function health.damage(creature, amount)
    creature.hp = limit_hp(creature.hp - amount)

    return creature.hp
end

return health
