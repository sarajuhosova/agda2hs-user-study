module Test.All where

import Test.QuickCheck
import All

----------------------------------------------
-- Some sketchy QuickCheck helpers

prop1 :: (Bool -> Bool) -> Bool
prop1 f = f True && f False

prop2 :: (Bool -> Bool -> Bool) -> Bool
prop2 f = prop1 (f True) && prop1 (f False)

prop3 :: (Bool -> Bool -> Bool -> Bool) -> Bool
prop3 f = prop2 (f True) && prop2 (f False)

----------------------------------------------
-- The actual tests

propEq :: Bool -> Bool -> Bool
propEq a b = (a == b) == (All a == All b)

propOrd :: Bool -> Bool -> Bool
propOrd a b = (compare a b) == (compare (All a) (All b))

propShow :: Bool -> Bool
propShow a = ("All {getAll = " ++ show a ++ "}") == (show (All a))

propBounded :: Bool
propBounded = (minBound == All False) && (maxBound == All True)

-- x <> (y <> z) = (x <> y) <> z
propAssoc :: Bool -> Bool -> Bool -> Bool
propAssoc a b c = All a <> (All b <> All c) == (All a <> All b) <> All c

propMempty :: Bool
propMempty = mempty == All True

propMappend :: Bool -> Bool -> Bool
propMappend a b = (mappend aa ab) == (aa <> ab)
  where
    aa = All a
    ab = All b

propMconcat :: [Bool] -> Bool
propMconcat xs = mconcat (map All xs) == All (foldl (&&) True xs)

----------------------------------------------
-- The aggregate testing function

allTest :: IO ()
allTest = do
  putStrLn "Testing All..."
  quickCheck $ prop2 propEq
  quickCheck $ prop2 propOrd
  quickCheck $ prop1 propShow
  quickCheck propBounded
  quickCheck $ prop3 propAssoc
  quickCheck propMempty
  quickCheck $ prop2 propMappend
  quickCheck propMconcat
  putStrLn ""
