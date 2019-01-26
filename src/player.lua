util = require("src.utils")
Actor = require("src.actor")

local Player = util.inheritsFrom(Actor)

Player.health = 100
Player.xVel = 0
Player.yVel = 0
Player.speed = 300
Player.target = nil

function Player:new()
    plr = self.create()
    self.image = love.graphics.newImage("assets/player.png")
    return plr
end


function Player:update(dt)
    self:handleKeys(dt)
    if self.target ~= nil then
        actualX, actualY, cols, len = self.scene.world:move(self, self.target.x, self.target.y, "cross")
        self.x = actualX
        self.y = actualY
    end
end

function Player:draw() 
    love.graphics.draw(self.image, self.x, self.y)
end

function Player:handleKeys(dt)
    if love.keyboard.isDown("w") then
        self.target = {x = self.x, y = self.y -(self.speed*dt)}
    elseif(love.keyboard.isDown("s")) then
        self.target =  {x = self.x, y = self.y + (self.speed*dt)}
    elseif(love.keyboard.isDown("a")) then
        self.target = {x = self.x -(self.speed*dt), y = self.y}
    elseif(love.keyboard.isDown("d")) then
        self.target =  {x = self.x +(self.speed*dt), y = self.y}
    else
       self.target = nil
    end

end


return Player
