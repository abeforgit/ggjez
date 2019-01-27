local bump = require("lib.bump")
local Player = require("src.player")
local EnemyDoubt = require("src.enemyDoubt")
local EnemyDrugs = require("src.enemyDrugs")
local EnemyDeath = require("src.enemyDeath")
local TowerConversation = require("src.towerConversation")
local TowerMedication = require("src.towerMedication")
local TowerPet = require("src.towerPet")
local Hotbar = require("src.hotbar")
local Healthbar = require("src.healthbar")
local Glitches = require("src.glitches")
local Static = require("src.static")
local Spawner = require("src.spawner")
local Class = require("lib.hump.class")
local SceneLeave = require("src.sceneLeave")
local Scene = require("src.scene")


local SceneGame = Class{__includes = Scene}

SceneGame.actors = {}
SceneGame.world = nil
SceneGame.player = nil
SceneGame.hotbar = nil
SceneGame.healthbar = nil
SceneGame.cursorSwitched = false
SceneGame.spawnerAmount = 10
SceneGame.spawners = {}

SceneGame.towers = {
        TowerConversation,
        TowerMedication,
        TowerPet
    }
SceneGame.enemies = {
        EnemyDeath,
        EnemyDoubt,
        EnemyDrugs
    }

function SceneGame:init(main)
    Scene.init(self, main, "Bastion of sanity")
    self.world = bump.newWorld()

    self:initBackground()

    self:addActor(EnemyDeath(), 628, 100)
    self:addActor(TowerConversation(), 500, 300)

    self.player = Player()
    self:addActor(self.player)

    self.hotbar = Hotbar()
    self.hotbar:setScene(self)

    self.healthbar = Healthbar()
    self.healthbar:setScene(self)

    for i = 1, self.spawnerAmount do
        local spwn = Spawner()
        spwn:setScene(self)
        table.insert(self.spawners, spwn)
    end

    love.mouse.setCursor(love.mouse.newCursor("assets/images/cursor-good.png"))
end

function SceneGame:initBackground()
    local bedRight = Static("assets/images/bed-right.png", true)    
    local bedRightX = love.graphics.getWidth() - bedRight.w
    self:addActor(bedRight, bedRightX, 0)

    local bedLeft = Static("assets/images/bed-left.png", true)
    local bedLeftX = bedRightX - bedLeft.w
    self:addActor(bedLeft, bedLeftX, 0)
    self:addActor(Static("assets/images/carpet.png", false), 200, 100)

end

function SceneGame:addActor(actor, x, y)
    actor.x = x or 0
    actor.y = y or 0
    table.insert(self.actors, actor)
    actor:setScene(self)
end

function SceneGame:removeActor(actor)
    local ind = nil
    for i, v in ipairs(self.actors) do
        if v == actor then
            ind = i
            break
        end
    end
    table.remove( self.actors, ind)
    self.world:remove(actor)
end

function SceneGame:draw()
    local severity = 100 - self.player.health

    if (not (self.cursorSwitched) and severity >= 100) then
        self:stopSong()
        self:playSong(true)
        love.mouse.setCursor(love.mouse.newCursor("assets/images/cursor-bad.png"))
        self.cursorSwitched = true
    elseif (self.cursorSwitched and severity < 100) then
        self:stopSong()
        self:playSong(false)
        love.mouse.setCursor(love.mouse.newCursor("assets/images/cursor-good.png"))
        self.cursorSwitched = false
    end
    Glitches:draw(severity)
    for _, actor in ipairs(self.actors) do
        actor:draw()
    end

    self.hotbar:draw()
    self.healthbar:draw()
end

function SceneGame:update(dt)
    for _, actor in ipairs(self.actors) do
        actor:update(dt)
    end

    for _, spawner in ipairs(self.spawners) do
        spawner:update(dt)
    end
end

function SceneGame:mousereleased()
    return self.player:mousereleased()
end

function SceneGame:mousepressed()
    return self.player:mousepressed()
end

function SceneGame:keypressed()
    return function (key, scancode, isrepeat)
        if key == "escape" then 
            local menu = SceneLeave(self.main)
            menu.currentProgress = self
            self:setScene(menu)
        else 
            self.player:keypressed()(key, scancode, isrepeat)
        end 
    end
end

function SceneGame:keyreleased()
    return self.player:keyreleased()
end

function SceneGame:wheelmoved()
    return self.player:wheelmoved()
end

return SceneGame