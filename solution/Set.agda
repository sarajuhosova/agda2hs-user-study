module Set where

open import Haskell.Prelude

data OrderedSet (a : Set) : Set where
  Empty : OrderedSet a
  Elem  : a → OrderedSet a → OrderedSet a

{-# COMPILE AGDA2HS OrderedSet #-}

contains : ⦃ Eq a ⦄ → a → OrderedSet a → Bool
contains e Empty = False
contains e (Elem x xs) = e == x || contains e xs

{-# COMPILE AGDA2HS contains #-}

add : ⦃ Eq a ⦄ → a → OrderedSet a → OrderedSet a
add e Empty = Elem e Empty
add e es = if contains e es then es else Elem e es

{-# COMPILE AGDA2HS add #-}

addAll : ⦃ Eq a ⦄ → List a → OrderedSet a → OrderedSet a
addAll es set = foldr add set es

{-# COMPILE AGDA2HS addAll #-}

fromList : ⦃ Eq a ⦄ → List a → OrderedSet a
fromList es = addAll es Empty

{-# COMPILE AGDA2HS fromList #-}

postulate instance iEqOrderedSet : ⦃ Eq a ⦄ → Eq (OrderedSet a)

{-# COMPILE AGDA2HS iEqOrderedSet #-}

addContainedStaysSame : ⦃ iEqA : Eq a ⦄ → ∀ (set : OrderedSet a) (x : a) 
  → contains x set ≡ True → set ≡ add x set
addContainedStaysSame (Elem e set) x h 
  = sym (ifTrueEqThen (contains x (Elem e set)) h)

addContainedStaysSame' : ⦃ iEqA : Eq a ⦄ → ∀ (set : OrderedSet a) (x : a) 
  → contains x set ≡ True → set ≡ add x set
addContainedStaysSame' (Elem e set) x h =
  begin
    Elem e set
  ≡⟨⟩ 
    (if True then (Elem e set) else Elem x (Elem e set))
  ≡⟨ sym (ifTrueEqThen (contains x (Elem e set)) h) ⟩ 
    (if (contains x (Elem e set)) then (Elem e set) else Elem x (Elem e set))
  ≡⟨⟩ 
    add x (Elem e set)
  ∎
