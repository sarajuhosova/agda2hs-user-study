module Main where

import Test.Reverse ( reverseTest )
import Test.Set     ( setTest )

import System.Environment

main :: IO ()
main = do
  args <- getArgs
  case args of
    [] -> do
      reverseTest
      setTest
    ("reverse":_) -> reverseTest
    ("set":_) -> setTest
