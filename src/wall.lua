local Actor = require("src.actor")
local Class = require("lib.hump.class")

local Wall = Class{__includes = Actor}

Wall.type = "wall"

function Wall:init(w, h)
  Actor.init(self)
  self.w = w
  self.h = h
end

function Wall:draw()
end

return Wall