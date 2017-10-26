-- | This module contains the data types
--   which represent the state of the game
module Model where

import Graphics.Gloss

data PlayerInfo = ShowNothing
                | ShowInfo

data Life = Alive
          | Dead
          | Invincible

data Progress = NotFinished | Finished

type Level = [Platform]

nO_SECS_BETWEEN_CYCLES :: Float
nO_SECS_BETWEEN_CYCLES = 0.1

data Player = Player {
                          playerLife :: Life
                        , lives :: Int
                        , playerPosition :: Point
                        , firing :: Bool
                        , weapon :: Weapon
                        , score :: Int
                        , move :: Vector
                     }
basePlayer = Player Alive 4 (0,0) False baseWeapon 0 (0,0)

data Enemy = Enemy {
                        enemyName :: String
                      , enemyLife :: Life
                      , enemyPosition :: Point
                      , item :: Maybe Item
                      , enemyMove :: Vector
                   }

data Item = Item {
                      itemType :: Weapon
                    , itemPosition :: Point
                 }

data Bullet = Bullet {
                         bulletType :: BulletType
                       , bulletWidth :: Int
                       , length :: Int
                       , bulletPosition :: Point
                       , bulletMove :: Vector
                     }

data BulletType = DefaultBullet | Bullet2

baseBullet = Bullet DefaultBullet 2 2 (0,0) (0,0)

data Weapon = Weapon {
                         ammo :: Int
                       , ammoType :: Bullet
                     }
baseWeapon = Weapon 5 baseBullet

data Platform = Platform {
                            platformPosition :: Point,
                            platformWidth :: Int,
                            platformHeight :: Int
                         }
basePlatform = Platform (0,0) 100 20
baseLevel = [basePlatform]

data GameState = GameState {
                              player :: Player
                            , progress :: Progress
                            , items :: [Item]
                            , bullets :: [Bullet]
                            , enemies :: [Enemy]
                            , level :: Level
                           }

initState :: GameState
initState = GameState basePlayer NotFinished [] [] [] baseLevel
