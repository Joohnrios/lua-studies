local Docket = {}
Docket.__index = Docket

function Docket.new(notice, events)
  return setmetatable({
    notice = notice,
    events = events,
  }, Docket)
end

function Docket:hear()
  local line = self.notice:say()
  self.events:emit(line)
  return line
end

function Docket:quiet()
  return self.events:last()
end

return Docket
