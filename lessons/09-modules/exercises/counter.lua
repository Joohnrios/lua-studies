local counter = { loads = 0 }

counter.loads = counter.loads + 1

local function hidden()
  return "private"
end

function counter.hidden_result()
  return hidden()
end

return counter
