module Models.Weapon where
  import Models.Bullet
  import Models.BulletType

  baseWeapon :: Weapon
  baseWeapon = Weapon 5 Laser

  data Weapon = Weapon {  ammo :: Int
                          , typeBullet :: BulletType
                       }
