local util = require("src.utils")
local Actor = require("src.actor")

local Tower = util.inheritsFrom(Actor)
local Vector = require("lib.hump.vector")

Tower.health = 100
Tower.range = 200
Tower.damage = 10
Tower.attackTimer = 0
Tower.attacksPerSecond = 1
Tower.visionRect = nil
Tower.time = 0

function Tower:new(imgPath)
    local twr = self.create()
    self.img = love.graphics.newImage(imgPath)
    self.type = "tower"
    self.visionRect = {
        l = self.x - self.range/2,
        t = self.y - self.range/2,
        w = self.w + self.range,
        h = self.h + self.range
    }
    return twr
end

function Tower:setScene(scn)
    self.scene = scn
    scn.world:add(self, self.x, self.y, self.w, self.h)
end

function Tower:draw()
    love.graphics.draw(self.img, self.x, self.y)
end

function Tower:update(dt)
    self.attackTimer = self.attackTimer + dt
    l, t, w, h = util.unpackRect(self.visionRect)
    local items, len = self.scene.world:queryRect(l, t, w, h,
    function(item) 
        if item.type == "enemy" then
            return "cross"
        end
        return false 
    end)
    self.attack(items)
end

function Tower:attack(targets)
end


function Tower:setX(x)
    self.x = x
end

function Tower:setY(y)
    self.y = y
end

return Tower