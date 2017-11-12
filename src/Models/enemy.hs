module Models.Enemy where
  import Models.Life
  import Graphics.Gloss
  import Models.Item
  import TypeClasses.Drawable
  import TypeClasses.Movable
  import System.Random
  import Graphics.Gloss.Game

  data Enemy = Enemy {  posEnemy :: Point
                        , item :: Maybe Item
                        , velEnemy :: Vector
                        , eOnPlatform :: Bool
                     }

  platformCheck :: Enemy -> Bool
  platformCheck p = snd (posEnemy p) <= (-150)

  instance Drawable Enemy where
    render (Enemy (x, y) _ _ _) = translate x y $ png "sprites/LanceStandingR.png"

  instance Movable Enemy where
    move p | vy > (-4) && eOnPlatform p == False = p { posEnemy = (x + vx, y + vy), velEnemy = (vx, (vy - 2)), eOnPlatform = platformCheck p }
           | vy < 0 && eOnPlatform p = p { posEnemy = (x + vx, y + vy), velEnemy = (vx, 0), eOnPlatform = platformCheck p }
           | otherwise = p { posEnemy = (x + vx, y + vy), eOnPlatform = platformCheck p }
      where
        (x, y) = posEnemy p
        (vx, vy) = velEnemy p

    moveVertical p vy | eOnPlatform p = p { velEnemy = (vx, vy) }
                      | otherwise = p { velEnemy = (vx, vy') }
      where
        (vx, vy') = velEnemy p

    moveHorizontal p vx | vx == 0   = p { velEnemy = (vx, vy) }
                        | vx >= 0   = p { velEnemy = (vx, vy) }
                        | otherwise = p { velEnemy = (vx, vy) }
                        where
                          (vx', vy) = velEnemy p
