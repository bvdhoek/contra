-- | This module defines how the state changes
--   in response to time and user input
module Controller where

import Graphics.Gloss
import Graphics.Gloss.Interface.IO.Game
import TypeClasses.Movable
import Models.GameState
import Models.Player

input :: Event -> GameState -> IO GameState
input (EventKey (SpecialKey KeyRight) Down _ _) s = return $ (s { player = p' })
  where
    p' = (player s) { velPlayer = (5,0) }

input (EventKey (SpecialKey KeyLeft) Down _ _) s = return $ (s { player = p' })
  where
    p' = (player s) { velPlayer = ((-5),0) }

input (EventKey _ Up _ _) s = return $ (s { player = p' })
  where
    p' = (player s) { velPlayer = (0,0) }

input _ s = return $ s

step :: Float -> GameState -> IO GameState
step f s = return $ (s { player = move (player s) })
