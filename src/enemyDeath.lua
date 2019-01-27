local Enemy = require("src.enemy")
local Utils = require("src.utils")

EnemyDeath = Utils.inheritsFrom(Enemy)

function EnemyDeath:new()
  local ed = self.create()
  Enemy.new(ed,"assets/images/death.png")
  return ed
end

return EnemyDeath