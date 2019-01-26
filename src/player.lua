util = require("src.utils")
Actor = require("src.actor")

local Player = util.inheritsFrom(Actor)

Player.health = 100
Player.xVel = 0
Player.yVel = 0
Player.speed = 300

function Player:new()
    plr = self.create()
    self.image = love.graphics.newImage("assets/player.png")
    return plr
end

function Player:update(dt)
    self:handleKeys()
    self.x = self.x + self.xVel * dt
    self.y = self.y + self.yVel * dt
    self.scene.world:update(self, self.x, self.y)
end

function Player:draw() 
    love.graphics.draw(self.image, self.x, self.y)
end

function Player:handleKeys()
    if love.keyboard.isDown("w") then
        self.yVel = - self.speed
    elseif(love.keyboard.isDown("s")) then
        self.yVel =  self.speed
    elseif(love.keyboard.isDown("a")) then
        self.xVel = - self.speed
    elseif(love.keyboard.isDown("d")) then
        self.xVel =  self.speed
    else
        self.xVel = 0
        self.yVel = 0
    end

end

function Player:setScene(scn)
    self.scene = scn
    scn.world:add(self, self.x, self.y, 128, 128)
end



return Player
