local Utils = require("src.utils")
local Actor = require("src.actor")
local Class = require("lib.hump.class")

local Static = Class{__includes = Actor}
Static.type = "static"

function Static:init(imagePath, solid, r)
  Actor.init(self)
  self.img = love.graphics.newImage(imagePath)
  self.h = self.img:getHeight()
  self.w = self.img:getWidth()
  self.range = 0
  if r == nil then
    self.r = 0
  else
    self.r = r
  end
  if (solid == nil) then
    self.solid = true
  else
    self.solid = solid
  end
end

function Static:update(dt)
  self.vision = {
    x = self.x,
    y = self.y,
    w = self.w,
    h = self.h
  }
  self.seen = {}
end


return Static