local Permit = {}
Permit.__index = Permit

function Permit.new(visits)
  return setmetatable({ visits = visits }, Permit)
end

function Permit:grant()
  self.visits:step()
  if self.visits:total() > 0 then
    return "met"
  end
  return "none"
end

function Permit:held()
  return self.visits:total()
end

return Permit
