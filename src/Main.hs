module Main where

import Controller
import View

import Graphics.Gloss.Interface.IO.Game
import Models.GameState

width, height, offset :: Int
width = 400
height = 400
offset = 100

window :: Display
window = InWindow "Contra" (width, height) (offset, offset)

main :: IO ()
main = playIO window     -- the actual window as described above
              azure      -- background color
              25         -- fps
              initState
              view       -- render the current gamestate
              input      -- handle pressed keys
              step       -- update the gamestate each frame
