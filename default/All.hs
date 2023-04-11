{-# LANGUAGE DeriveGeneric #-}

module All where

import Data.Coerce
import GHC.Generics

-- taken from https://hackage.haskell.org/package/base-4.18.0.0/docs/src/Data.Semigroup.Internal.html#All

newtype All = All { getAll :: Bool }
        deriving ( Eq      -- ^ @since 2.01
                 , Ord     -- ^ @since 2.01
                 , Read    -- ^ @since 2.01
                 , Show    -- ^ @since 2.01
                 , Bounded -- ^ @since 2.01
                 , Generic -- ^ @since 4.7.0.0
                 )

-- | @since 4.9.0.0
instance Semigroup All where
        (<>) = coerce (&&)

-- | @since 2.01
instance Monoid All where
        mempty = All True
