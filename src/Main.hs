module Main where

import Controller
import Model
import View

import Graphics.Gloss.Interface.IO.Game

main :: IO ()
main = playIO (InWindow "Contra" (400, 400) (0,0))
              black
              25
              initState
              view
              input
              step
