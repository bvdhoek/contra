-- | This module defines how the state changes
--   in response to time and user input
module Controller where

import Graphics.Gloss
import Graphics.Gloss.Interface.IO.Game
import TypeClasses.Movable
import Models.GameState
import Models.Player

input :: Event -> GameState -> IO GameState
input (EventKey (SpecialKey KeyRight) Down _ _) s = return $ (s { player = moveHorizontal (player s) (3) })
input (EventKey (SpecialKey KeyRight) Up _ _) s = return $ (s { player = moveHorizontal (player s) 0 })

input (EventKey (SpecialKey KeyLeft) Down _ _) s = return $ (s { player = moveHorizontal (player s) (-3) })
input (EventKey (SpecialKey KeyLeft) Up _ _) s = return $ (s { player = moveHorizontal (player s) 0 })

input (EventKey (Char 'p') Down _ _) s@(GameState p1 _ _ _ _ _ _ Paused)
  = return $ (s { player = stopPlayer p1, paused = NotPaused })

input (EventKey (Char 'p') Down _ _) s@(GameState p1 _ _ _ _ _ _ NotPaused)
  = return $ (s { player = stopPlayer p1, paused = Paused })

input _ s = return $ s

step :: Float -> GameState -> IO GameState
step f s@(GameState _ _ _ _ _ _ _ Paused) = return $ s

step f s@(GameState p1 item bullets enemies level score _ _) = return $ (s { player = move p1 })
