local Tower = require("src.tower")
local Utils = require("src.utils")

TowerB = Utils.inheritsFrom(Tower)

function TowerB:new()
  local tb = self.create()
  Tower.new(tb, "assets/borb.png")
  return tb
end

return TowerB