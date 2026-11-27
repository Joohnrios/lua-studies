local Pace = {}
Pace.__index = Pace

function Pace.new(trail)
  return setmetatable({ trail = trail }, Pace)
end

function Pace:take()
  self.trail:step()
  return self.trail:moves()
end

function Pace:kept()
  return self.trail:moves()
end

return Pace
