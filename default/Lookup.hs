-- this is a default file

module Lookup where

lookupSafe :: Eq a => a -> [(a, b)] -> b
lookupSafe key (x : xs)
  = if fst x == key then snd x else lookupSafe key xs

