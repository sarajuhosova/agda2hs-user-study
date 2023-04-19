-- this is a default file

{-# LANGUAGE DeriveGeneric #-}

module All where

import Data.Coerce
import GHC.Generics

newtype All = All Bool
        deriving ( Eq , Ord , Show , Bounded )

instance Semigroup All where
        (<>) = undefined

instance Monoid All where
        mempty = undefined
        mappend = undefined
        mconcat = undefined
