local util = require("src.utils")
local Actor = require("src.actor")

local Tower = util.inheritsFrom(Actor)

Tower.health = 100
Tower.range = 100
Tower.width = 128
Tower.height = 128 

function Tower:new()
    local twr = self.create()
    self.img = love.graphics.newImage("assets/tower.png")
    return twr
end

function Tower:setScene(scn)
    self.scene = scn
    scn.world:add(self, self.x, self.y, self.width, self.height)
end

function Tower:draw()
    love.graphics.draw(self.img, self.x, self.y)
    local rangeWidth = self.width + self.range
    local rangeHeight = self.height + self.range 
    love.graphics.rectangle("line", self.x - self.range/2, self.y - self.range/2, rangeWidth, rangeHeight)
end

function Tower:update(dt)
    local rangeWidth = self.width + self.range
    local rangeHeight = self.height + self.range 

    local items, len = self.scene.world:queryRect(self.x - self.range/2, self.y - self.range/2, rangeWidth, rangeHeight)
end

function Tower:setX(x)
    self.x = x
end

function Tower:setY(y)
    self.y = y
end

return Tower