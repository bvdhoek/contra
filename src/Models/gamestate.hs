module Models.GameState where
  import Models.Bullet
  import Models.Player
  import Models.Enemy
  import Models.Item
  import Models.Platform

  data Progress = NotFinished | Finished

  type Level = [Platform]

  data GameState = GameState {  player :: Player
                              , progress :: Progress
                              , paused :: Bool
                              , items :: [Item]
                              , bullets :: [Bullet]
                              , enemies :: [Enemy]
                              , level :: Level
                              , score :: Int
                             }

  baseLevel :: Level
  baseLevel = [basePlatform]

  initState :: GameState
  initState = GameState basePlayer NotFinished False [] [] [] baseLevel 0
