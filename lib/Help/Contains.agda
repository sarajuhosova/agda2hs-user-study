module Help.Contains where

open import Haskell.Prelude

contains : ⦃ Eq a ⦄ → a → List (a × b) → Bool
contains key [] = False
contains key (x ∷ xs) = if fst x == key then True else contains key xs

{-# COMPILE AGDA2HS contains #-}

postulate
  containsTail : ⦃ iEqA : Eq a ⦄ → ∀ (key : a) (x : a × b) (xs : List (a × b)) 
                  → IsTrue (contains key (x ∷ xs))
                  → (fst x ≡ key → ⊥) 
                  → IsTrue (contains key xs)
