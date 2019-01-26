local Utils = require("src.utils")
local Actor = require("src.actor")

Static = Utils.inheritsFrom(Actor)

function Static:new(imagePath, solid)
  local stat = self.create()
  stat.img = love.graphics.newImage(imagePath)
  stat.h = stat.img:getHeight()
  stat.w = stat.img:getWidth()
  if (solid == nil) then
    stat.solid = true
  else
    stat.solid = solid
  end
  return stat
end

return Static