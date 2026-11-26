local Practice = {}
Practice.__index = Practice

function Practice.new(pack, skill)
  return setmetatable({
    pack = pack,
    skill = skill,
  }, Practice)
end

function Practice:sip(player)
  local before = self.pack:stock()
  local hp = self.pack:drink(player)
  if before > 0 then
    self.skill:train(1)
  end
  return hp
end

function Practice:step()
  return self.skill:progress()
end

return Practice
