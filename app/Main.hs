module Main where

import Test.Reverse ( reverseTest )
import Test.All     ( allTest )

import System.Environment

main :: IO ()
main = do
  args <- getArgs
  case args of
    [] -> putStrLn "Please specify which tests you would like to run: reverse, all"
    ("reverse":_) -> reverseTest
    ("all":_) -> allTest
