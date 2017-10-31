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

data BulletType = DefaultBullet | Bullet2

type Level = [Platform]

nO_SECS_BETWEEN_CYCLES :: Float
nO_SECS_BETWEEN_CYCLES = 0.1

data Drawables = Player {
                          playerLife :: Life
                        , lives :: Int
                        , playerPosition :: Point
                        , firing :: Bool
                        , weapon :: Weapon
                        , score :: Int
                        , move :: Vector
                    } |
                  Enemy {
                          enemyLife :: Life
                        , enemyPosition :: Point
                        , item :: Maybe Item
                        , enemyMove :: Vector
                    } |
                  Item {
                          itemType :: Weapon
                        , itemPosition :: Point
                    } |
                  Bullet {
                          bulletType :: BulletType
                        , bulletWidth :: Int
                        , length :: Int
                        , bulletPosition :: Point
                        , bulletMove :: Vector
                    } |
                  Weapon {
                          ammo :: Int
                        , ammoType :: Bullet
                    } |
                  Platform {
                          platformPosition :: Point
                        , platformWidth :: Int
                        , platformHeight :: Int
                    }

data GameState = GameState {
                              progress :: Progress
                            , objects :: [Drawables]
                           }

initState :: GameState
initState = GameState NotFinished initDraw

basePlayer, baseBullet, baseWeapon, basePlatform :: Drawables
basePlayer = Player Alive 4 (0,0) False baseWeapon 0 (0,0)
baseBullet = Bullet DefaultBullet 2 2 (0,0) (0,0)
baseWeapon = Weapon 5 baseBullet
basePlatform = Platform (0,0) 100 20
baseLevel = Level [basePlatform]

initDraw :: [Drawables]
initDraw = [basePlayer, baseBullet, baseWeapon] ++ baseLevel
