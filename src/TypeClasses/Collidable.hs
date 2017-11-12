module TypeClasses.Collidable where
  class Collidable a where
    boundingBox :: a -> Rect
    collide :: (Collidable a, Collidable b) => a -> b -> Bool
    collide a b = leftA < rightB && rightA > leftB && topA < bottomB && bottomA > topB
                  where
                    leftA   = xA - radiusA
                    rightA  = xA + radiusA
                    topA    = yA + radiusA
                    bottomA = yA - radiusA
                    leftB   = xB - radiusB
                    rightB  = xB + radiusB
                    topB    = yB + radiusB
                    bottomB = yB - radiusB
                    radiusA = 0.5 * sizeA
                    radiusB = 0.5 * sizeB
                    ((xA, yA), sizeA) = boundingBox a
                    ((xB, yB), sizeB) = boundingBox b
