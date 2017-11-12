module Models.Score where
  import Graphics.Gloss
  import TypeClasses.Drawable

  data Score = Score { count :: Int }

  instance Drawable Score where
    render score = translate 50 150 $ scale 0.2 0.2 $  Color white $ Text ("Score: " ++ (show (count score)))
