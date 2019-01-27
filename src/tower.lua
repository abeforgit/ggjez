local util = require("src.utils")
local Actor = require("src.actor")
local Class = require("lib.hump.class")


-- local Tower = util.inheritsFrom(Actor)
local Vector = require("lib.hump.vector")

local Tower = Class{__includes = Actor}

Tower.health = 100
Tower.range = 200
Tower.attackTimer = 0
Tower.attacksPerSecond = 1
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

function Tower:init()
    Actor.init(self)
    self.img = love.graphics.newImage(self.imgPath)
    self.type = "tower"
    self.evilTimer = 10
    self.constructionSounds[math.random(1, #self.constructionSounds)]:play()
    self.visionFilter =  function(item, other) 
        if other.type == "enemy" then
            return "cross"
        end
        return false 
    end
    self.damage = 0
end


function Tower:update(dt)
    Actor.update(self, dt)
    self.evilTimer = self.evilTimer - dt
    if self.evilTimer < 0 then
        self:turnEvil()
    end
    self.attackTimer = self.attackTimer + dt

    print(#self.seen)

    if(#self.seen > 0) then
        if self.attackTimer > self.attacksPerSecond then
            self:attack()
            self.attackTimer = 0
        end
    end
end

function Tower:attack()
    for i = 1,#self.seen do
        self.shootingSounds[math.random(1, #self.shootingSounds)]:play()
        self.seen[i].other:takeDamage(self.damage)
    end
end



function Tower:turnEvil()
    self.collapseSounds[math.random(1, #self.collapseSounds)]:play()
    local evil = self.evilSide()
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