local util = require("src.utils")
local Class = require("lib.hump.class")

local Actor = Class {
    scene = nil,
    img = nil,
    x = 0,
    y = 0,
    w = 128,
    h = 128,
    type = "actor",
    solid = true,
    range = 300,
    vision = nil,
    seen = nil,
    visionFilter = function () return "cross" end

}

function Actor:init()
    self.vision = {
        x = self.x + self.w/2-self.range/2,
        y = self.y + self.h/2-self.range/2,
        w = self.range,
        h = self.range
    }
end
function Actor:setScene(scn)
    self.scene = scn
    self.scene.world:add(self, self.x, self.y, self.w, self.h)
    self.scene.world:add(self.vision, self.vision.x, self.vision.y, self.vision.w, self.vision.h)
end

function Actor:draw()
    love.graphics.draw(self.img, self.x, self.y)
    if self.vision then
        local x, y, w, h = util.unpackRect(self.vision)
        love.graphics.rectangle("line", x, y, w, h)
    end
end

function Actor:update(dt)
    self.vision.x, self.vision.y, self.seen, len = self.scene.world:move(self.vision, self.x+self.w/2-self.range/2, self.y+self.h/2-self.range/2, self.visionFilter)
end

return Actor