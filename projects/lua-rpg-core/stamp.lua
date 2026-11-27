local Stamp = {}
Stamp.__index = Stamp

function Stamp.new(docket, name)
  return setmetatable({
    docket = docket,
    name = name,
  }, Stamp)
end

function Stamp:press()
  local line = self.docket:hear()
  if line == self.name .. " is done" then
    return "closed"
  end
  return "open"
end

function Stamp:read()
  return self.docket:quiet()
end

return Stamp
