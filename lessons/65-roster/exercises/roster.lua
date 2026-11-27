local Roster = {}
Roster.__index = Roster

function Roster.new(permit, events)
  return setmetatable({
    permit = permit,
    events = events,
  }, Roster)
end

function Roster:sign()
  local word = self.permit:grant()
  self.events:emit(word)
  return word
end

function Roster:quiet()
  return self.events:last()
end

return Roster
