Player = require("src.player")
Enemy = require("src.enemy")

Scene = {
    actors = {}
}

function Scene:new() 
    local scn = {}
    setmetatable(scn, self) 
    self.__index = self
    self.actors[1] = Player:new()
    self.actors[2] = Enemy:new(0,0, self.actors[1])
    return scn
end

function Scene:addActor(actor)
    table.insert( self.actors, actor )
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

return Scene