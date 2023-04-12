module Lookup where

open import Haskell.Prelude

open import Help.Contains

lookupSafe : ⦃ iEqA : Eq a ⦄ → @0 ⦃ IsLawfulEq a ⦄
              → (key : a) → (xs : List (a × b)) 
              → @0 ⦃ IsTrue (contains key xs) ⦄ 
              → b
lookupSafe key (x ∷ xs) ⦃ hc ⦄ =
  if fst x == key then
    snd x
  else
    λ ⦃ neq ⦄ → lookupSafe key xs ⦃ 
      containsTail key x xs hc (nequality (fst x) key neq)
    ⦄

{-# COMPILE AGDA2HS lookupSafe #-}
