module TypeClasses.Movable where
  import Graphics.Gloss

  class Movable m where
    move :: m -> m
