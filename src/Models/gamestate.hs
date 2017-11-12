module Models.GameState where
  import Models.Bullet
  import Models.Player
  import Models.Enemy
  import Models.Item
  import Models.Platform
  import Models.Weapon
  import Models.Direction
  import Models.Level
  import Models.Score
  import TypeClasses.Drawable
  import Graphics.Gloss

  data Progress = NotFinished | Finished
  data Paused = Paused | NotPaused

  initState :: GameState
  initState = GameState basePlayer [] [] [] baseLevel (Score 0) NotFinished NotPaused

  data GameState = GameState {  player :: Player
                              , items :: [Item]
                              , bullets :: [Bullet]
                              , enemies :: [Enemy]
                              , level :: Level
                              , score :: Score
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
                   | dirPlayer player == Models.Direction.Up    = (0, 5)

  instance Drawable GameState where
    render state = pictures (map render (level state) ++ [render (player state)] ++ map render (bullets state) ++ [render (score state)])
