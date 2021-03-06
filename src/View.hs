-- | This module defines how to turn
--   the game state into a picture
module View where
  import Graphics.Gloss
  import TypeClasses.Drawable
  import Models.GameState

  view :: GameState -> IO Picture
  view = return . render
