util = require("src.utils")
Actor = require("src.actor")
Vector = require("lib.hump.vector")
Tower = require("src.tower")
TowerA = require("src.towerA")
TowerB = require("src.towerB")

local Player = util.inheritsFrom(Actor)

local spd = 300

towers = {
    TowerA,
    TowerB
}

Player.health = 100
Player.xVel = 0
Player.yVel = 0
Player.speed = spd
Player.moveVec = Vector.new()
Player.keyspressed = 0
Player.selectedTower = 2
Player.vecs = {
    up = Vector.new(0, -spd),
    down = Vector.new(0, spd),
    left = Vector.new(-spd, 0),
    right = Vector.new(spd, 0)
}

function Player:new()
    plr = self.create()
    self.image = love.graphics.newImage("assets/player.png")
    self.type = "player"
    return plr
end

function Player:update(dt)
    if self.moveVec ~= Vector.new(0, 0) then
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

function Player:mousepressed()
    return function (x, y, button)
        if button == 1 then
            self:spawnTower(x, y)
 
        end
    end
end

function Player:spawnTower(x, y)
    local twr = towers[self.selectedTower]:new()
    upperX = x - twr.w/2
    upperY = y - twr.h/2
    self.scene:addActor(twr, upperX, upperY)
end

function Player:mousereleased()
end

function Player:keypressed()
    return function (key, scancode, isrepeat)
        if util.upKeys[key] then
            self.keyspressed = self.keyspressed + 1
            self.moveVec = self.moveVec + self.vecs.up
        elseif util.downKeys[key] then
            self.keyspressed = self.keyspressed + 1

            self.moveVec = self.moveVec + self.vecs.down
        elseif util.leftKeys[key] then
            self.keyspressed = self.keyspressed + 1
            self.moveVec = self.moveVec + self.vecs.left
        elseif util.rightKeys[key] then
            self.keyspressed = self.keyspressed + 1
            self.moveVec = self.moveVec + self.vecs.right
        end
    end 
end


function Player:keyreleased(key, scancode, isrepeat)
    return function (key, scancode, isrepeat)
        if util.upKeys[key] then
            self.keyspressed = self.keyspressed -1
            self.moveVec = self.moveVec - self.vecs.up
        elseif util.downKeys[key] then
            self.keyspressed = self.keyspressed - 1
            self.moveVec = self.moveVec - self.vecs.down
        elseif util.leftKeys[key] then
            self.keyspressed = self.keyspressed - 1
            self.moveVec = self.moveVec - self.vecs.left
        elseif util.rightKeys[key] then
            self.keyspressed = self.keyspressed - 1
            self.moveVec = self.moveVec - self.vecs.right
        end
    end
end

function Player:wheelmoved(x, y)
    return function (x, y)
        if y > 0 then
            self.selectedTower = self.selectedTower + 1
            if self.selectedTower > #towers then
                self.selectedTower = #towers
            end
        else
            self.selectedTower = self.selectedTower - 1
            if self.selectedTower < 1 then
                self.selectedTower = 1
            end
        end
    end
end



return Player