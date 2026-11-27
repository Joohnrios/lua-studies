local Verdict = {}
Verdict.__index = Verdict

function Verdict.new(round)
  return setmetatable({ round = round }, Verdict)
end

function Verdict:judge()
  self.round:fight()
  if self.round.creature:alive() then
    return "stand"
  end
  return "faint"
end

function Verdict:tally()
  return self.round:hits()
end

return Verdict
