module Models.Platform where
  import Graphics.Gloss

  data Platform = Platform {  platformPosition :: Point,
                              platformWidth :: Int,
                              platformHeight :: Int
                           }

  basePlatform :: Platform
  basePlatform = Platform (0,0) 100 20
