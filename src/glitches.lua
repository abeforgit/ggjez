local Glitches = {
  glitchSoundTimeout = 300
}
Glitches.glitchSounds = {
    love.audio.newSource("assets/sounds/glitch_1.ogg", "static"),
    love.audio.newSource("assets/sounds/glitch_2.ogg", "static"),
    love.audio.newSource("assets/sounds/glitch_3.ogg", "static"),
    love.audio.newSource("assets/sounds/glitch_4.ogg", "static"),
    love.audio.newSource("assets/sounds/glitch_5.ogg", "static"),
    love.audio.newSource("assets/sounds/glitch_6.ogg", "static"),
    love.audio.newSource("assets/sounds/glitch_7.ogg", "static"),
    love.audio.newSource("assets/sounds/glitch_8.ogg", "static"),
    love.audio.newSource("assets/sounds/glitch_9.ogg", "static")
}

function Glitches.screenShake(severity)
  local dx = math.random(severity * 2) - severity
  local dy = math.random(severity * 2) - severity
  love.graphics.translate(dx, dy)
end

function Glitches.glitchOverlay(severity)
  local r, g, b, a = love.graphics.getColor()
  local amount = math.random(100)
  local x = math.random(love.graphics.getWidth() - 128)
  local y = math.random(love.graphics.getHeight() - 128)
  love.graphics.setColor(math.random(255) / 255, math.random(255) / 255, math.random(255) / 255)
  if amount <= severity then
    for i = 0, math.log(severity) do
      love.graphics.rectangle("fill", math.random(love.graphics.getWidth()), math.random(love.graphics.getHeight()), math.random(severity), math.random(severity))
    end
  end
  love.graphics.setColor(r,g,b,a)
end

function Glitches.setBackground(severity)
  love.graphics.setBackgroundColor((95 / 255) * (1 + severity/100), (205 / 255) * (1 + severity/100), (228 / 255) * (1 + severity/100))
end

function Glitches:sounds(severity)
  local amount = math.random(100)
  if (amount < severity) then
    self.glitchSounds[math.random(1, #self.glitchSounds)]:play()
  end
end

function Glitches:draw(severity)
  self.setBackground(severity)
  self.screenShake(severity)
  self.glitchOverlay(severity)

  self.glitchSoundTimeout = self.glitchSoundTimeout - severity/10

  if (self.glitchSoundTimeout <= 0) then
    self:sounds(severity)
    self.glitchSoundTimeout = 300
  end
end

return Glitches