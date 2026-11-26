local Events = {}
Events.__index = Events

function Events.new()
  return setmetatable({ log = {} }, Events)
end

function Events:emit(name)
  self.log[#self.log + 1] = name
  return #self.log
end

function Events:count(name)
  local total = 0
  for index = 1, #self.log do
    if self.log[index] == name then
      total = total + 1
    end
  end
  return total
end

function Events:last()
  return self.log[#self.log]
end

return Events
