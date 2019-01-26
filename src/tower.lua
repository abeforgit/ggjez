local util = require("src.utils")
local Actor = require("src.actor")

local Tower = util.inheritsFrom(Actor)

Tower.health = 100
Tower.range = 20
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
end

function Tower:update(dt)
    --  love.mouse.setX(math.random(100))
    --  love.mouse.setY(math.random(100))
    local rangeX = self.x + self.range
    local rangeY = self.y + self.range

    local items, len = self.scene.world:queryRect(self.x, self.y, rangeX, rangeY)

    for i = 1, len do
        print(items[1])
    end
end

return Tower