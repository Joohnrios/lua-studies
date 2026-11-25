local notice = {}

function notice.line(name, result)
  return name .. " " .. result.state .. " " .. result.hp
end

return notice
