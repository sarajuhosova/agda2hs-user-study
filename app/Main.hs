module Main where

import Test.Reverse ( reverseTest )
import Test.All     ( allTest )

import System.Environment

main :: IO ()
main = do
  args <- getArgs
  case args of
    [] -> do
      reverseTest
      allTest
    ("reverse":_) -> reverseTest
    ("all":_) -> allTest
