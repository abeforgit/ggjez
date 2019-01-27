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

function Tower:new()
    local twr = self.create()
    self.img = love.graphics.newImage(self.imgPath)
    self.type = "tower"
    return twr
end

function Tower:setScene(scn)
    Actor.setScene(self, scn)
    self.scene = scn
    self.visionRect = {
        l = self.x - self.range/2,
        t = self.y - self.range/2,
        w = self.w + self.range,
        h = self.h + self.range
    }
end

function Tower:update(dt)
    self.attackTimer = self.attackTimer + dt
    local l, t, w, h = util.unpackRect(self.visionRect)
    local items, len = self.scene.world:queryRect(l, t, w, h,
    function(item) 
        if item.type == "enemy" then
            return "cross"
        end
        return false 
    end)
    if(len > 0) then
        if self.attackTimer > self.attacksPerSecond then
            self:attack(items)
            self.attackTimer = 0
        end
    end
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