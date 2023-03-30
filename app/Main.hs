module Main where

import Test.Reverse ( reverseTest )
import Test.Set     ( setTest )

main :: IO ()
main = do
  putStrLn "Testing reverse..."
  reverseTest
  putStrLn "\nTesting set..."
  setTest
