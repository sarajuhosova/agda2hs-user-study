module Test.Lookup where

import Test.QuickCheck
import Lookup

remove :: Eq a => a -> [(a, b)] -> [(a, b)]
remove key [] = []
remove key (x : xs) = if fst x == key then rest else x : rest
  where rest = remove key xs

propFinds :: [(Int, Bool)] -> Int -> Bool -> [(Int, Bool)] -> Bool
propFinds start i b end = lookupSafe i (remove i start ++ [(i, b)] ++ remove i end) == b

lookupTest :: IO ()
lookupTest = do
  putStrLn "Testing lookup..."
  quickCheck propFinds
  putStrLn ""
