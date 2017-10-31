-- | This module defines how the state changes
--   in response to time and user input
module Controller where

import Graphics.Gloss
import Graphics.Gloss.Interface.IO.Game
import System.Random
import Models.GameState

input :: Event -> GameState -> IO GameState
input e s = return $ s

step :: Float -> GameState -> IO GameState
step f s = return $ s
