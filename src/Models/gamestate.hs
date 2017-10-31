module Models.GameState where
  import Models.Bullet
  import Models.Player
  import Models.Enemy
  import Models.Item
  import Models.Platform
  import TypeClasses.Drawable

  data Progress = NotFinished | Finished
  data Paused = Paused | NotPaused

  type Level = [Platform]

  data GameState = GameState {  player :: Player
                              , items :: [Item]
                              , bullets :: [Bullet]
                              , enemies :: [Enemy]
                              , level :: Level
                              , score :: Int
                              , progress :: Progress
                              , paused :: Paused
                             }

  baseLevel :: Level
  baseLevel = [basePlatform]

  initState :: GameState
  initState = GameState basePlayer [] [] [] baseLevel 0 NotFinished NotPaused

  instance Drawable GameState where
    render state = render (player state)
