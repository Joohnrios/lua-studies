local Desk = {}
Desk.__index = Desk

function Desk.new(welcome, events)
  return setmetatable({
    welcome = welcome,
    events = events,
  }, Desk)
end

function Desk:receive()
  local line = self.welcome:greet()
  self.events:emit(line)
  return line
end

function Desk:quiet()
  return self.events:last()
end

return Desk
