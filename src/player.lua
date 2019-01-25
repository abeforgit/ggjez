Player = {
    health = 100,
    image = nil,
    x = 100,
    y = 100,
    xVel = 0,
    yVel = 0,
    speed = 300
}
function Player:new()
    local plr = {}
    setmetatable(plr, self)
    self.__index = self
    self.image = love.graphics.newImage("assets/player.png")
    return plr
end

function Player:print()
    print("Player: "..self.health)
end

function Player:update(dt)
    self:handleKeys()
    self.x = self.x + self.xVel * dt
    self.y = self.y + self.yVel * dt
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


return Player
