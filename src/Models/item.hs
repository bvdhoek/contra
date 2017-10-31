module Models.Item where
  import Models.Weapon
  import Graphics.Gloss

  data Item = Item {
                        itemType :: Weapon
                      , itemPosition :: Point
                   }
