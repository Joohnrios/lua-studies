local Phrase = {}
Phrase.__index = Phrase

function Phrase.new(chord, events)
  return setmetatable({
    chord = chord,
    events = events,
  }, Phrase)
end

function Phrase:say()
  local word = self.chord:play()
  self.events:emit(word)
  return word
end

function Phrase:latest()
  return self.events:last()
end

return Phrase
