module Test.Reverse where

import Test.QuickCheck
import Reverse as R

propInvolution :: [Int] -> Bool
propInvolution xs = R.reverse (R.reverse xs) == xs

propEmptyIsEmpty :: Bool
propEmptyIsEmpty = R.reverse empty == empty 
  where 
    empty :: [Int]
    empty = []

propSingleIsSingle :: Int -> Bool
propSingleIsSingle x = R.reverse [x] == [x]

propReverseAppend :: [Int] -> [Int] -> Bool
propReverseAppend xs ys = R.reverse (xs ++ ys) == R.reverse ys ++ R.reverse xs

reverseTest :: IO ()
reverseTest = do
  putStrLn "Testing reverse..."
  quickCheck propInvolution
  quickCheck propEmptyIsEmpty
  quickCheck propSingleIsSingle
  quickCheck propReverseAppend
  putStrLn ""
