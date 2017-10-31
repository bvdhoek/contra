module Models.Enemy where
  import Models.Life
  import Graphics.Gloss
  import Models.Item
  import TypeClasses.Drawable
  import TypeClasses.Movable

  data Enemy = Enemy {  nameEnemy :: String
                        , lifeEnemy :: Life
                        , posEnemy :: Point
                        , item :: Maybe Item
                        , velEnemy :: Vector
                     }

  instance Drawable Enemy where
    render e = undefined

  instance Movable Enemy where
    move e = e { posEnemy = (x + vx, y + vy) }
      where
        (x, y) = posEnemy e
        (vx, vy) = velEnemy e

    moveVertical e vy = e { velEnemy = (vx, vy) }
      where
        (vx, vy') = velEnemy e

    moveHorizontal e vx = e { velEnemy = (vx, vy) }
      where
        (vx', vy) = velEnemy e
