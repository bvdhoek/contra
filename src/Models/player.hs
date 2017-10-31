module Models.Player where
  import TypeClasses.Drawable
  import TypeClasses.Movable
  import Models.Life
  import Models.Weapon
  import Graphics.Gloss

  data Player = Player {  playerLife :: Life
                          , lives :: Int
                          , posPlayer :: Point
                          , firing :: Bool
                          , weapon :: Weapon
                          , velPlayer :: Vector
                       }

  basePlayer :: Player
  basePlayer = Player Alive 4 (0,0) False baseWeapon (0,0)

  stopPlayer :: Player -> Player
  stopPlayer p = p { velPlayer = (0, 0) }

  instance Drawable Player where
    render (Player _ _ (x, y) _ _ _) = translate x y $ color blue $ rectangleSolid 10 50

  instance Movable Player where
    move p = p { posPlayer = (x + vx, y + vy) }
      where
        (x, y) = posPlayer p
        (vx, vy) = velPlayer p

    moveVertical p vy = p { velPlayer = (vx, vy) }
      where
        (vx, vy') = velPlayer p

    moveHorizontal p vx = p { velPlayer = (vx, vy) }
      where
        (vx', vy) = velPlayer p
