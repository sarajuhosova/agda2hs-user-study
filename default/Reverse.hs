module Reverse where

import qualified Prelude
import Prelude hiding ( reverse )

reverse :: [a] -> [a]
reverse [] = []
reverse (x : xs) = reverse xs ++ [x]

