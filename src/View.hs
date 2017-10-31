-- | This module defines how to turn
--   the game state into a picture
module View where

  import Graphics.Gloss
  import Models.GameState
  import Models.Player

  view :: GameState -> IO Picture
  view = return . viewPure

  viewPure :: GameState -> Picture
  viewPure state = pictures
    [ render (player state)
    ]
