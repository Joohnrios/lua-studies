local Slip = {}
Slip.__index = Slip

function Slip.new(desk, events)
  return setmetatable({
    desk = desk,
    events = events,
  }, Slip)
end

function Slip:file()
  local line = self.desk:receive()
  return self.events:count(line)
end

function Slip:copies()
  return self.events:count(self.desk:quiet())
end

return Slip
