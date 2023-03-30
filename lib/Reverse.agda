module Reverse where

open import Haskell.Prelude hiding ( reverse )

{-# FOREIGN AGDA2HS
import qualified Prelude
import Prelude hiding ( reverse )
#-}

reverse : List a → List a
reverse [] = []
reverse (x ∷ xs) = reverse xs ++ (x ∷ [])

{-# COMPILE AGDA2HS reverse #-}

reverseAppend : ∀ (xs ys : List a) → reverse (xs ++ ys) ≡ reverse ys ++ reverse xs
reverseAppend [] [] = refl
reverseAppend [] ys = sym (++-[] (reverse ys))
reverseAppend (x ∷ xs) ys
  rewrite reverseAppend xs ys
    | ++-assoc (reverse ys) (reverse xs) (x ∷ [])
  = refl

involution : ∀ (xs : List a) → reverse (reverse xs) ≡ xs
involution [] = refl
involution (x ∷ xs) =
  begin
    reverse (reverse (x ∷ xs))
  ≡⟨⟩ 
    reverse (reverse xs ++ x ∷ [])
  ≡⟨ reverseAppend (reverse xs) (x ∷ []) ⟩ 
    reverse (x ∷ []) ++ reverse (reverse xs)
  ≡⟨⟩ 
    (x ∷ []) ++ reverse (reverse xs)
  ≡⟨⟩ 
    x ∷ reverse (reverse xs)
  ≡⟨ cong (x ∷_) (involution xs) ⟩ 
    (x ∷ []) ++ xs
  ≡⟨⟩ 
    x ∷ xs
  ∎ 

involution' : ∀ (xs : List a) → reverse (reverse xs) ≡ xs
involution' [] = refl
involution' (x ∷ xs)
  rewrite reverseAppend (reverse xs) (x ∷ [])
    | involution xs
  = refl

emptyIsEmpty : ∀ (xs : List a) → { xs ≡ [] } → reverse xs ≡ xs
emptyIsEmpty [] = refl

singleIsSingle : ∀ {x : a} → reverse (x ∷ []) ≡ reverse (x ∷ [])
singleIsSingle = refl
