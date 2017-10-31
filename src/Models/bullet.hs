module Models.Bullet where
  import Graphics.Gloss
  import TypeClasses.Drawable
  import TypeClasses.Movable
  import Models.BulletType

  data Bullet = Bullet {  bulletType :: BulletType
                          , posBullet :: Point
                          , velBullet :: Vector
                       }

  instance Drawable Bullet where
    render (Bullet DefaultBullet (x, y) _) = translate x y $ color green $ circleSolid 5

  instance Movable Bullet where
    move b = b { posBullet = (x + vx, y + vy) }
      where
        (x, y) = posBullet b
        (vx, vy) = velBullet b
