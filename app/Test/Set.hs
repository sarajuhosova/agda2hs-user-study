module Test.Set where

import Test.QuickCheck
import Set
import Data.List

propAddContainedStaysSame :: [Int] -> Int -> Property
propAddContainedStaysSame xs i =
  length xs > 0 ==>
    set == add (xs !! (i `mod` (length xs))) set
      where
        set = fromList xs

setTest :: IO ()
setTest = do
  quickCheck propAddContainedStaysSame
