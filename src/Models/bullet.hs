module Models.Bullet where
  import Graphics.Gloss

  data BulletType = DefaultBullet

  data Bullet = Bullet {   bulletType :: BulletType
                         , bulletWidth :: Int
                         , length :: Int
                         , bulletPosition :: Point
                         , bulletMove :: Vector
                       }

  baseBullet :: Bullet
  baseBullet = Bullet DefaultBullet 2 2 (0,0) (0,0)
