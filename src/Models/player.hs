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
                          , onPlatform :: Bool
                       }

  basePlayer :: Player
  basePlayer = Player Alive 4 (0,0) baseWeapon (0,0) Models.Direction.Right True

  stopPlayer :: Player -> Player
  stopPlayer p = p { velPlayer = (0, 0) }

  platformCheck :: Player -> Bool
  platformCheck p | snd (posPlayer p) <= (-150) = True
                  | otherwise = False

  instance Drawable Player where
    render (Player _ _ (x, y)  _ _ Models.Direction.Right _) = translate x y $ png "sprites/LanceStandingR.png"
    render (Player _ _ (x, y)  _ _ Models.Direction.Left _) = translate x y $ png "sprites/LanceStandingL.png"

  instance Movable Player where
    move p | vy > (-4) && onPlatform p == False = p { posPlayer = (x + vx, y + vy), velPlayer = (vx, (vy - 2)), onPlatform = platformCheck p }
           | vy < 0 && onPlatform p = p { posPlayer = (x + vx, y + vy), velPlayer = (vx, 0), onPlatform = platformCheck p }
           | otherwise = p { posPlayer = (x + vx, y + vy), onPlatform = platformCheck p }
      where
        (x, y) = posPlayer p
        (vx, vy) = velPlayer p

    moveVertical p vy | onPlatform p = p { velPlayer = (vx, vy) }
                      | otherwise = p { velPlayer = (vx, vy') }
      where
        (vx, vy') = velPlayer p

    moveHorizontal p vx | vx == 0   = p { velPlayer = (vx, vy) }
                        | vx >= 0   = p { velPlayer = (vx, vy), dirPlayer = Models.Direction.Right }
                        | otherwise = p { velPlayer = (vx, vy), dirPlayer = Models.Direction.Left }
                        where
                          (vx', vy) = velPlayer p
