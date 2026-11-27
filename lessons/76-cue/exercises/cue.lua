local Cue = {}
Cue.__index = Cue

function Cue.new(refrain)
  return setmetatable({ refrain = refrain }, Cue)
end

function Cue:call()
  if self.refrain:sing() == 1 then
    return "first"
  end
  return "more"
end

function Cue:fresh()
  return self.refrain:copies() == 1
end

return Cue
