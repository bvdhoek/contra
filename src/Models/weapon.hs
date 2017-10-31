module Models.Weapon where
  import Models.Bullet

  data Weapon = Weapon {   ammo :: Int
                         , ammoType :: Bullet
                       }

  baseWeapon :: Weapon
  baseWeapon = Weapon 5 baseBullet
