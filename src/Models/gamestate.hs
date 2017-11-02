module Models.GameState where
  import Models.Bullet
  import Models.Player
  import Models.Enemy
  import Models.Item
  import Models.Platform
  import Models.Weapon
  import Models.Direction
  import TypeClasses.Drawable
  import Graphics.Gloss

  data Progress = NotFinished | Finished
  data Paused = Paused | NotPaused

  type Level = [Platform]

  baseLevel :: Level
  baseLevel = [basePlatform]

  initState :: GameState
  initState = GameState basePlayer [] [] [] baseLevel 0 NotFinished NotPaused

  data GameState = GameState {  player :: Player
                              , items :: [Item]
                              , bullets :: [Bullet]
                              , enemies :: [Enemy]
                              , level :: Level
                              , score :: Int
                              , progress :: Progress
                              , paused :: Paused
                             }

  shoot :: GameState -> GameState
  shoot s = s { bullets = bullet' : (bullets s) }
    where
      bullet' = Bullet { bulletType = typeBullet (weapon p1), posBullet = (bulletX, bulletY + 5), velBullet = bulletDir (player s) }
      p1 = (player s)
      (bulletX, bulletY) = posPlayer p1

  bulletDir player | dirPlayer player == Models.Direction.Right = (5, 0)
                   | dirPlayer player == Models.Direction.Left  = (-5, 0)

  instance Drawable GameState where
    render state = pictures ([render (player state)] ++ map render (bullets state))
