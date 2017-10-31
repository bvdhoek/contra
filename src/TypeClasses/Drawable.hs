module TypeClasses.Drawable where
  import Graphics.Gloss

  class Drawable d where
    render :: d -> Picture
