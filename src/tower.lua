local util = require("src.utils")
local Actor = require("src.actor")

local Tower = util.inheritsFrom(Actor)

Tower.health = 100
Tower.range = 100
Tower.width = 128
Tower.height = 128
Tower.time = 0

function Tower:new(imgPath)
    local twr = self.create()
    self.img = love.graphics.newImage(imgPath)
    self.type = "tower"
    return twr
end

function Tower:update(dt)
    local rangeWidth = self.width + self.range
    local rangeHeight = self.height + self.range 

    local items, len = self.scene.world:queryRect(self.x - self.range/2, self.y - self.range/2, rangeWidth, rangeHeight)
end

return Tower