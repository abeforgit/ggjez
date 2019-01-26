local bump = require("lib.bump")
local Player = require("src.player")
local Enemy = require("src.enemy")
local Hotbar = require("src.hotbar")

local Scene = {
    actors = {},
    world = nil,
    player = nil,
    hotbar = nil
}

function Scene:new() 
    local scn = {}
    setmetatable(scn, self) 
    self.__index = self
    self.world = bump.newWorld()
    self.player = Player:new()
    scn:addActor(self.player)
    return scn
end

function Scene:addActor(actor, x, y)
    actor.x = x or 0
    actor.y = y or 0
    table.insert(self.actors, actor)
    actor:setScene(self)
end


function Scene:draw()
    for _, actor in ipairs(self.actors) do
        actor:draw()
    end
end

function Scene:update(dt)
    for _, actor in ipairs(self.actors) do
        actor:update(dt)
    end
end

function Scene:mousereleased()
    self.player:mousepressed()
    self.player:mousereleased()
    self.player:keypressed()
    self.player:keyreleased()
end

function Scene:mousepressed()
end

function Scene:keypressed()
end

function Scene:keyreleased()
end

return Scene