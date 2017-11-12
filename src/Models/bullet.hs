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
    render (Bullet DefaultBullet (x, y) _) = translate x y $ color green $ circleSolid 3
    render b@(Bullet Laser (x, y) _) | snd (velBullet b) > 0 = translate x y $ color (light red) $ rectangleSolid 2 10
                                     | otherwise             = translate x y $ color (light red) $ rectangleSolid 10 2

  instance Movable Bullet where
    move b = b { posBullet = (x + vx, y + vy) }
      where
        (x, y) = posBullet b
        (vx, vy) = velBullet b

    moveVertical b vy = b { velBullet = (vx, vy) }
      where
        (vx, vy') = velBullet b

    moveHorizontal b vx = b { velBullet = (vx, vy) }
      where
        (vx', vy) = velBullet b
