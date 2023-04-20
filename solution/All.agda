module All where

open import Haskell.Prelude hiding ( All )

{-# FOREIGN AGDA2HS
import GHC.Generics
#-}

record All : Set where
  field
    getAll : Bool
open All public

{-# COMPILE AGDA2HS All newtype deriving ( Read,  Generic ) #-}

instance
  postulate
    iAllEq      : Eq      All
    iAllOrd     : Ord     All
    iAllShow    : Show    All
    iAllBounded : Bounded All

  iAllSemigroup : Semigroup All
  iAllSemigroup ._<>_ a b = record { getAll = (getAll a && getAll b) }

  iAllLawfulSemigroup : IsLawfulSemigroup All
  iAllLawfulSemigroup .associativity record { getAll = False } b c = refl
  iAllLawfulSemigroup .associativity record { getAll = True } b c = refl

  iAllMonoid : Monoid All
  iAllMonoid .mempty = record { getAll = True }
  iAllMonoid .mappend = _<>_
  iAllMonoid .mconcat [] = mempty
  iAllMonoid .mconcat (x ∷ xs) = x <> mconcat xs
  -- iAllMonoid = record {DefaultMonoid record {mempty = MkAll True}}

{-# FOREIGN AGDA2HS {-# LANGUAGE DeriveGeneric #-} #-}

{-# COMPILE AGDA2HS iAllEq #-}
{-# COMPILE AGDA2HS iAllOrd #-}
{-# COMPILE AGDA2HS iAllShow #-}
{-# COMPILE AGDA2HS iAllBounded #-}

{-# COMPILE AGDA2HS iAllSemigroup #-}
{-# COMPILE AGDA2HS iAllMonoid #-}

