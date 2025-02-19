{-# LANGUAGE FlexibleInstances #-}

instance Show a => Show (Maybe a) where
  showsPrec p Nothing = showString "Nothing" 
  showsPrec p (Just x) = showParen (p > 10) $ showString "Just " . showsPrec 11 x

instance (Eq a) => Eq (Maybe a) where
  Nothing == Nothing = True
  (Just x) == (Just y) = x == y
  _ == _ = False

main :: IO ()
main = do
  print (Just (5 :: Int))
  print Nothing
  print (Just (5 :: Int) == Just (5 :: Int))
  --The following comparison is avoided, due to different types, which is the main idea of the solution
  --print (Just (5 :: Int) == Just (5 :: Double))