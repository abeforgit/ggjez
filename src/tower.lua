util = require("src.utils")
Actor = require("src.actor")

local Tower = util.inheritsFrom(Actor)

Tower.health = 100

function Tower:new(scene)
    local twr = {}
    setmetatable(twr, self)
    self.__index = self
    self.img = love.graphics.newImage("assets/tower.png")
    
    return twr
end

function Tower:update(dt)
    
end

function Tower:draw()
    love.graphics.draw(self.img, self.x, self.y)
end

return Tower