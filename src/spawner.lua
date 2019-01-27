Spawner = {
    shortestTimer = 5,
    longestTimer = 10,

    spawningWidth = 70,
    spawningHeight = 70
}

function Spawner:new()
    local spwnr = {}
    setmetatable(spwnr, self)
    self.__index = self
    self.time = math.random(self.shortestTimer, self.longestTimer)
    self.spawnTimer = self.time

    local screenWidth = love.graphics.getWidth()
    local screenHeight = love.graphics.getHeight()
    self.x = math.random() >= 0.5 and math.random(0 - self.spawningWidth, 0) or math.random(screenWidth, screenWidth + self.spawningWidth)
    self.y = math.random() >= 0.5 and math.random(0 - self.spawningHeight, 0) or math.random(screenHeight, screenHeight + self.spawningHeight)

    return spwnr
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
    local enemy = self.scene.enemies[spawnIndex]:new()
    self.scene:addActor(enemy, self.x, self.y)
end

return Spawner
    