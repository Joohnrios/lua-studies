local Echo = {}
Echo.__index = Echo

function Echo.new(slip)
  return setmetatable({ slip = slip }, Echo)
end

function Echo:hear()
  if self.slip:file() > 1 then
    return "again"
  end
  return "new"
end

function Echo:fresh()
  return self.slip:copies() == 1
end

return Echo
