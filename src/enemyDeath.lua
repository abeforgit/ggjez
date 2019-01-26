Enemy = require("src.enemy")
Utils = require("src.utils")

EnemyDeath = Utils.inheritsFrom(Enemy)

function EnemyDeath:new()
  local ed = self.create()
  Enemy.new(ed,"assets/death.png")
  return ed
end

return EnemyDeath