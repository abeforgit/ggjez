util = require("src.utils")
Actor = require("src.actor")

local Tower = util.inheritsFrom(Actor)

Tower.health = 100

function Tower:new()
    twr = self.create()
    self.img = love.graphics.newImage("assets/tower.png")
    return twr
end

function Tower:setScene(scn)
    self.scene = scn
    scn.world:add(self, self.x, self.y, 128, 128)
end

function Tower:update(dt)
    
end

function Tower:draw()
    love.graphics.draw(self.img, self.x, self.y)
end

return Tower