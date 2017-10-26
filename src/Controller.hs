-- | This module defines how the state changes
--   in response to time and user input
module Controller where

import Model

import Graphics.Gloss
import Graphics.Gloss.Interface.IO.Game
import System.Random

input :: Event -> GameState -> IO GameState
input = undefined

step :: Float -> GameState -> IO GameState
step = undefined
