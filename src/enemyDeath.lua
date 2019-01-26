Enemy = require("src.enemy")
Utils = require("src.utils")

EnemyDeath = Utils.inheritsFrom(Enemy)

function EnemyDeath:new(target)
  local ed = self.create()
  Enemy.new(ed, target,"assets/death.png")
  return ed
end

return EnemyDeath