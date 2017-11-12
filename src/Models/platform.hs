module Models.Platform where
  import Graphics.Gloss
  import Graphics.Gloss.Game
  import TypeClasses.Drawable

  data PlatformType = GrassCliffLeft | GrassCliffRight | Grass

  data Platform = Platform {  platformType :: PlatformType,
                              platformPosition :: Point
                           }

  basePlatform :: Platform
  basePlatform = Platform Grass (-200, -200)

  instance Drawable Platform where
    render (Platform GrassCliffLeft (x, y))  = translate x y $ scale 0.25 0.25 $ png "sprites/1.png"
    render (Platform Grass (x, y))           = translate x y $ scale 7 0.4 $ png "sprites/2.png"
    render (Platform GrassCliffRight (x, y)) = translate x y $ scale 0.25 0.25 $ png "sprites/3.png"
