module Main where

import Test.Reverse ( reverseTest )
import Test.Lookup  ( lookupTest )
import Test.All     ( allTest )

import System.Environment

main :: IO ()
main = do
  args <- getArgs
  case args of
    [] -> putStrLn "Please specify which tests you would like to run: reverse, all, lookup"
    ("reverse":_) -> reverseTest
    ("all":_) -> allTest
    ("lookup":_) -> lookupTest
