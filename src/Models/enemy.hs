module Models.Enemy where
  import Models.Life
  import Graphics.Gloss
  import Models.Item

  data Enemy = Enemy {
                          enemyName :: String
                        , enemyLife :: Life
                        , enemyPosition :: Point
                        , item :: Maybe Item
                        , enemyMove :: Vector
                     }
