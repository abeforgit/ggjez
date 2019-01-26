Enemy = require("src.enemy")
Utils = require("src.utils")

EnemyError = Utils.inheritsFrom(Enemy)

function EnemyError:new(target)
  local ee = self.create()
  Enemy.new(ee, 200, 200, target,"assets/err.png")
  ee.speed = 200
  return ee
end

return EnemyError