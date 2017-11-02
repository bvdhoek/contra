module Models.Player where
  import TypeClasses.Drawable
  import TypeClasses.Movable
  import Models.Life
  import Models.Weapon
  import Models.Direction
  import Graphics.Gloss.Interface.Pure.Game
  import Graphics.Gloss.Game
  import Graphics.Gloss

  data Player = Player {  playerLife :: Life
                          , lives :: Int
                          , posPlayer :: Point
                          , weapon :: Weapon
                          , velPlayer :: Vector
                          , dirPlayer :: Direction
                       }

  basePlayer :: Player
  basePlayer = Player Alive 4 (0,0) baseWeapon (0,0) Models.Direction.Right

  stopPlayer :: Player -> Player
  stopPlayer p = p { velPlayer = (0, 0) }

  instance Drawable Player where
    render (Player _ _ (x, y)  _ _ Models.Direction.Right) = translate x y $ png "sprites/LanceStandingR.png"
    render (Player _ _ (x, y)  _ _ Models.Direction.Left) = translate x y $ png "sprites/LanceStandingL.png"

  instance Movable Player where
    move p = p { posPlayer = (x + vx, y + vy) }
      where
        (x, y) = posPlayer p
        (vx, vy) = velPlayer p

    moveVertical p vy = p { velPlayer = (vx, vy) }
      where
        (vx, vy') = velPlayer p

    moveHorizontal p vx | vx == 0   = p { velPlayer = (vx, vy) }
                        | vx >= 0   = p { velPlayer = (vx, vy), dirPlayer = Models.Direction.Right }
                        | otherwise = p { velPlayer = (vx, vy), dirPlayer = Models.Direction.Left }
                        where
                          (vx', vy) = velPlayer p
