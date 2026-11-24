local co = coroutine.create(function(start)
  local received = coroutine.yield(start)
  return received + 1
end)

print(coroutine.resume(co, 10))
print(coroutine.status(co))
print(coroutine.resume(co, 20))
print(coroutine.status(co))
print(type(co))
