local util = require("src.utils")
local Actor = require("src.actor")

local Tower = util.inheritsFrom(Actor)
local Vector = require("lib.hump.vector")

Tower.health = 100
Tower.range = 200
Tower.width = 128
Tower.height = 128
Tower.damage = 10
Tower.attackTimer = 0
Tower.attacksPerSecond = 1
rangeWidth = Tower.width + Tower.range
rangeHeight = Tower.height + Tower.range 
Tower.time = 0

function Tower:new(imgPath)
    local twr = self.create()
    self.img = love.graphics.newImage(imgPath)
    self.type = "tower"
    return twr
end

function Tower:setScene(scn)
    self.scene = scn
    scn.world:add(self, self.x, self.y, self.width, self.height)
end

function Tower:draw()
    love.graphics.draw(self.img, self.x, self.y)
    love.graphics.rectangle("line", self.x - self.range/2, self.y - self.range/2, rangeWidth, rangeHeight)
end

function Tower:update(dt)
    self.attackTimer = self.attackTimer + dt
    local items, len = self.scene.world:queryRect(self.x - self.range/2, self.y - self.range/2, rangeWidth, rangeHeight, 
    function(item) 
        if item.type == "enemy" then
            if self.attackTimer > self.attacksPerSecond then
                self.attackTimer = 0
                self:attack(Vector.new(item.x, item.y))
            end
        end
        return false 
    end)
end

function Tower:attack(target)
    self.scene.world:queryPoint(target.x, target.y, 
    function(item)
        if item.type == "enemy" then
        item:takeDamage(self.damage)
        end
    end)
end


function Tower:setX(x)
    self.x = x
end

function Tower:setY(y)
    self.y = y
end

return Tower