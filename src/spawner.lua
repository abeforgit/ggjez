local Class = require("lib.hump.class")


Spawner = Class {
    shortestTimer = 5,
    longestTimer = 10,

    spawningWidth = 70,
    spawningHeight = 70
}

function Spawner:init()

    self.time = math.random(self.shortestTimer, self.longestTimer)
    self.spawnTimer = self.time

    local screenWidth = love.graphics.getWidth()
    local screenHeight = love.graphics.getHeight()
    if math.random() >= 0.5 then 
        print("reeeeeee")
        self.x = - math.random(0, self.spawningWidth) 
    else
        self.x = math.random(screenWidth, screenWidth + self.spawningWidth)
    end 

    if math.random() >= 0.5 then 
        print("reeeeeee")
        self.y = - math.random(0, self.spawningHeight) 
    else 
        self.y = math.random(screenHeight, screenHeight + self.spawningHeight)
    end 
    
end

function Spawner:setScene(scene)
    self.scene = scene
end

function Spawner:update(dt)
    self.spawnTimer = self.spawnTimer - dt
    if (self.spawnTimer < 0) then
        self:spawnEnemy()
        -- restart timer
        self.spawnTimer = self.time
    end
end

function Spawner:spawnEnemy()
    local spawnIndex = math.random(#self.scene.enemies)
    local enemy = self.scene.enemies[spawnIndex]()
    self.scene:addActor(enemy, self.x, self.y)
end

return Spawner