local Class = require("lib.hump.class")

local Scene = Class {
  main = nil,
  title = "----- NO TITLE -----",
  soundTrackNormal = love.audio.newSource("assets/sounds/normal_theme.wav", "stream"),
  soundTrackDark = love.audio.newSource("assets/sounds/dark_theme.wav", "stream")
}

function Scene:init(main, title, song)
  print(main)
  self.main = main
  self.title = title
  love.window.setTitle(title)
end

function Scene:playSong(dark)
  if dark then
    self.soundTrackDark:play()
  else
    self.soundTrackNormal:play()
  end
end

function Scene:stopSong()
  love.audio.stop(self.soundTrackDark, self.soundTrackNormal)
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