module Models.Player where
  import TypeClasses.Drawable
  import Models.Life
  import Models.Weapon
  import Graphics.Gloss

  data Player = Player {  playerLife :: Life
                          , lives :: Int
                          , playerPosition :: Point
                          , firing :: Bool
                          , weapon :: Weapon
                          , move :: Vector
                       }

  basePlayer :: Player
  basePlayer = Player Alive 4 (0,0) False baseWeapon (0,0)

  instance Drawable Player where
    render player = translate 30 50 $ color blue $ rectangleSolid 10 50
