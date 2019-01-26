util = require("src.utils")
Actor = require("src.actor")

local Player = util.inheritsFrom(Actor)

local spd = 300


Player.health = 100
Player.xVel = 0
Player.yVel = 0
Player.speed = spd
Player.moveVec = nil
Player.vecs = {
    up = {x = 0, y = -spd},
    down = {x = 0, y = spd},
    left = {x = -spd, y = 0},
    right = {x = spd, y = 0}
}
function Player:new()
    plr = self.create()
    self.image = love.graphics.newImage("assets/player.png")
    return plr
end

function Player:update(dt)
    if self.moveVec ~= nil then
        actualX, actualY, cols, len = self.scene.world:move(self, self.x + self.moveVec.x * dt, self.y + self.moveVec.y * dt, 
        function(item, other)
            return "cross"
        end)
        self.x = actualX
        self.y = actualY
    end
end

function Player:draw() 
    love.graphics.draw(self.image, self.x, self.y)
end

function Player.mousepressed()
    print("click")
end

function Player.mousereleased()
end

function Player:keypressed()
    return function (key, scancode, isrepeat)
        if util.upKeys[key] then
            self.moveVec = self.vecs.up
        elseif util.downKeys[key] then
            self.moveVec = self.vecs.down
        elseif util.leftKeys[key] then
            self.moveVec = self.vecs.left
        elseif util.rightKeys[key] then
            self.moveVec = self.vecs.right
        end
    end 
end


function Player:keyreleased(key, scancode, isrepeat)
    return function (key, scancode, isrepeat)
                self.moveVec = nil
    end
end



return Player
