local Class = require("lib.hump.class")

local Scene = Class {
  main = nil,
  title = "----- NO TITLE -----"
}

function Scene:init(main, title)
  print(main)
  self.main = main
  self.title = title
  love.window.setTitle(title)
end

function Scene:mousepressed(key)
end

function Scene:mousereleased(key)
end

function Scene:wheelmoved(key)
end

function Scene:keypressed()
end

function Scene:keyreleased()
end

function Scene:wheelmoved(key)
end

function Scene:update(dt)
end

function Scene:setScene(scn)
  self.main:setScene(scn)
end

return Scene