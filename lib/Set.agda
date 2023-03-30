{-# OPTIONS --allow-unsolved-metas #-}

module Set where

open import Haskell.Prelude

data OrderedSet (a : Set) : Set where
  -- add constructors

{-# COMPILE AGDA2HS OrderedSet #-}

add : ⦃ Eq a ⦄ → a → OrderedSet a → OrderedSet a
add e set = {!   !}

{-# COMPILE AGDA2HS add #-}

fromList : ⦃ Eq a ⦄ → List a → OrderedSet a
fromList es = {!   !}

{-# COMPILE AGDA2HS fromList #-}

instance
  iEqOrderedSet : ⦃ Eq a ⦄ → Eq (OrderedSet a)
  iEqOrderedSet ._==_ = {!   !}

{-# COMPILE AGDA2HS iEqOrderedSet #-}
