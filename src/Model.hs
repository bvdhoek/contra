-- | This module contains the data types
--   which represent the state of the game
module Model where

data PlayerInfo = ShowNothing
                | ShowInfo

data Life = Alive
          | Dead
          | Invincible

data Progress = NotFinished | Finished

data Level = [Platform]

nO_SECS_BETWEEN_CYCLES :: Float
nO_SECS_BETWEEN_CYCLES = 0.1

data Player = Player {
                          life :: Life
                        , lives :: Int
                        , position :: Point
                        , firing :: Bool
                        , weapon :: Weapon
                        , score :: Int
                        , move :: Vector
                     }
basePlayer = Player Alive 4 (0,0) False baseWeapon 0 (0,0)

data Enemy = Enemy {
                        name :: String
                      , life :: Life
                      , position :: Point
                      , item :: Maybe Item
                      , move :: Vector
                   }

data Item = Item {
                      type :: Weapon
                    , position :: Point
                 }

data Bullet = Bullet {
                         name :: String
                       , width :: Int
                       , length :: Int
                       , position :: Point
                       , move :: Vector
                     }
baseBullet = Bullet "basic" 2 2 (0,0) (0,0) 

data Weapon = Weapon {
                         ammo :: Int
                       , type :: Bullet
                     }
baseWeapon = Weapon 5 baseBullet

data Platform = Platform {
                            position :: Point
                          , width :: Int
                          , height :: Int
                         }
basePlatform = Platform (0,0) 100 20
baseLevel = Level [basePlatform]

data GameState = GameState {
                              player :: Player
                            , progress :: Progress
                            , items :: [Item]
                            , bullets :: [Bullet]
                            , enemies :: [Enemy]
                            , level :: Level
                           }

initState :: GameState
initState = GameState player NotFinished [] [] [] level
