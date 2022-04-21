local M = {}

function M.clearCachedPackage()
  for name,_ in pairs(package.loaded) do
    if name:match('^user') then
      package.loaded[name] = nil
    end
  end
end

function M.check()
  for name,_ in pairs(package.loaded) do
    if name:match('^user') then
      print(name)
    end
  end
end

return M
