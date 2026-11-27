local Presence = {}
Presence.__index = Presence

function Presence.new(roster)
  return setmetatable({ roster = roster }, Presence)
end

function Presence:mark()
  return self.roster:sign() == "met"
end

function Presence:seen()
  return self.roster:quiet() == "met"
end

return Presence
