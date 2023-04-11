module Test.All where

import Test.QuickCheck
import All

-- x <> (y <> z) = (x <> y) <> z
propAssoc :: Bool -> Bool -> Bool -> Bool
propAssoc a b c = All a <> (All b <> All c) == (All a <> All b) <> All c

allTest :: IO ()
allTest = do
  putStrLn "Testing All..."
  quickCheck propAssoc
  putStrLn ""
