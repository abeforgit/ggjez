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
Tower.constructionSounds = {
    love.audio.newSource("assets/sounds/construction_1.ogg", "static"),
    love.audio.newSource("assets/sounds/construction_2.ogg", "static")
}
Tower.collapseSounds = {
    love.audio.newSource("assets/sounds/tower_collapses_1.ogg", "static"),
    love.audio.newSource("assets/sounds/tower_collapses_2.ogg", "static"),
    love.audio.newSource("assets/sounds/tower_collapses_3.ogg", "static")
}
Tower.shootingSounds = {
    love.audio.newSource("assets/sounds/tower_shooting_1.ogg", "static"),
    love.audio.newSource("assets/sounds/tower_shooting_2.ogg", "static"),
    love.audio.newSource("assets/sounds/tower_shooting_3.ogg", "static")
}

function Tower:new()
    local twr = self.create()
    self.img = love.graphics.newImage(self.imgPath)
    self.type = "tower"
    self.evilTimer = 10
    self.constructionSounds[math.random(1, #self.constructionSounds)]:play()
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
    self.evilTimer = self.evilTimer - dt
    if self.evilTimer < 0 then
        self:turnEvil()
    end
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
    for i = 1,#targets do
        self.shootingSounds[math.random(1, #self.shootingSounds)]:play()
        targets[i]:takeDamage(10)
    end
end

function Tower:turnEvil()
    self.collapseSounds[math.random(1, #self.collapseSounds)]:play()
    local evil = self.evilSide:new()
    self.scene:addActor(evil, self.x, self.y)
    self.scene:removeActor(self)
end

function Tower:setX(x)
    self.x = x
end

function Tower:setY(y)
    self.y = y
end

return Tower