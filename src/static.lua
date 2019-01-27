local Utils = require("src.utils")
local Actor = require("src.actor")
local Class = require("lib.hump.class")

-- Static = Utils.inheritsFrom(Actor)

local Static = Class{__includes = Actor}
Static.type = "static"

function Static:init(imagePath, solid)
  Actor.init(self)
  self.img = love.graphics.newImage(imagePath)
  self.h = self.img:getHeight()
  self.w = self.img:getWidth()
  if (solid == nil) then
    self.solid = true
  else
    self.solid = solid
  end
end

return Static