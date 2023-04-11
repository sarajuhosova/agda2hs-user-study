module Lookup where

open import Haskell.Prelude hiding ( lookup )

{-# FOREIGN AGDA2HS
import qualified Prelude
import Prelude hiding ( lookup )
#-}

lookup : ⦃ Eq a ⦄ → a → List (a × b) → Maybe b
lookup key [] = Nothing
lookup key ((f , s) ∷ xs) = if f == key then Just s else lookup key xs

contains : ⦃ Eq a ⦄ → a → List (a × b) → Bool
contains key [] = False
contains key ((f , s) ∷ xs) = if f == key then True else contains key xs

is : ⦃ Eq a ⦄ → a → b → List (a × b) → Bool
is key value [] = False
is key value ((f , s) ∷ xs) = if f == key then True else is key value xs

lookupSafe : ⦃ Eq a ⦄ → (key : a) → (xs : List (a × b)) → b
lookupSafe key xs = {!   !}
