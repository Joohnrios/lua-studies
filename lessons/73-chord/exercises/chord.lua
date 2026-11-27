local Chord = {}
Chord.__index = Chord

function Chord.new(peal)
  return setmetatable({ peal = peal }, Chord)
end

function Chord:play()
  local before = self.peal:kept()
  local after = self.peal:sound()
  if after > before then
    return "rise"
  end
  return "hold"
end

function Chord:open()
  return self.peal:kept() > 0
end

return Chord
