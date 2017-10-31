module Main where

import Controller
import Model
import View

import Graphics.Gloss.Interface.IO.Game

width, height, offset :: Int
width = 400
height = 400
offset = 100

window :: Display
window = InWindow "Contra" (width, height) (offset, offset)

nO_SECS_BETWEEN_CYCLES :: Float
nO_SECS_BETWEEN_CYCLES = 0.1

main :: IO ()
main = playIO window
              black
              25
              initState
              view
              input
              step
