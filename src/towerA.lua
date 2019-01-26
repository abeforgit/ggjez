local Tower = require("src.tower")
local Utils = require("src.utils")

TowerA = Utils.inheritsFrom(Tower)

function TowerA:new()
  local ta = self.create()
  Tower.new(ta, "assets/tower.png")
  return ta
end

return TowerA