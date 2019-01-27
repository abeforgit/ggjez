local Tower = require("src.tower")
local Utils = require("src.utils")
local EnemyDoubts = require("src.enemyDoubt")
local Class = require("lib.hump.class")


-- TowerConversation = Utils.inheritsFrom(Tower)
local TowerConversation = Class{__includes = Tower}

TowerConversation.imgPath = "assets/images/conversation.png"
TowerConversation.evilSide = EnemyDoubts

function TowerConversation:init()
  self.range = 300
  Tower.init(self)
  self.damage = 100
end

return TowerConversation