{-# LANGUAGE NoImplicitPrelude #-}
module Dug.Prelude (
    module X
  , with
  , undefined
  ) where

import           Control.Applicative as X
import           Control.Monad as X
import           Control.Monad.IO.Class as X
import           Control.Monad.Trans.Bifunctor as X
import           Control.Monad.Trans.Either as X

import           Data.Bool as X (Bool (..), (||), (&&), not, bool, otherwise)
import           Data.Bifunctor as X (Bifunctor (..))
import           Data.Char as X (Char)
import           Data.Either as X (Either (..), either)
import           Data.Foldable as X
import           Data.Function as X ((.), ($), (&), flip, id, const)
import           Data.Functor as X (($>))
import           Data.Int as X
import           Data.Maybe as X (Maybe (..), maybe, fromMaybe)
import           Data.Monoid as X (Monoid (..), (<>))
import           Data.Text as X (Text)
import           Data.Traversable as X

import           Prelude as X (
    Eq (..), Show (..), Ord (..), Num (..), Enum , Bounded (..), Integral (..)
  , Double, error, seq, fromIntegral, (/), (^), fst, snd
  )
import qualified Prelude as P

import           Text.Read as X (Read (..), readMaybe)


with :: Functor f => f a -> (a -> b) -> f b
with =
  flip fmap

{-# WARNING undefined "Do not use 'undefined' in production code" #-}
undefined :: a
undefined =
  P.undefined
