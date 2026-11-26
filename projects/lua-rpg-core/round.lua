local Round = {}
Round.__index = Round

function Round.new(mark, creature, limit)
  return setmetatable({
    mark = mark,
    creature = creature,
    limit = limit,
  }, Round)
end

function Round:fight()
  local steps = 0
  while steps < self.limit and self.creature:alive() do
    self.mark:land()
    steps = steps + 1
  end
  return steps
end

function Round:hits()
  return self.mark.events:count("hit")
end

return Round
