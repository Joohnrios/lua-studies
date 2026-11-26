local Ledger = {}
Ledger.__index = Ledger

function Ledger.new(brief, events)
  return setmetatable({
    brief = brief,
    events = events,
  }, Ledger)
end

function Ledger:hear()
  local line = self.brief:say()
  self.events:emit(line)
  return line
end

function Ledger:quiet()
  return self.events:last()
end

return Ledger
