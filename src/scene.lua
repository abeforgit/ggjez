local Class = require("lib.hump.class")

local Scene = Class {
  main = nil,
  title = "----- NO TITLE -----"
}

function Scene:init(title)
  self.title = title
  love.window.setTitle(title)
end

return Scene