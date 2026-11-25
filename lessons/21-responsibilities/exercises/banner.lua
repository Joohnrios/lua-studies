local banner = {}

function banner.line(name, result)
  return name .. " " .. result.state
end

return banner
