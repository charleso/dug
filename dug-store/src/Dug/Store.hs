{-# LANGUAGE NoImplicitPrelude #-}
module Dug.Issue.Store (
    new
  ) where

import           Dug.Prelude

-- * Types

data Store m =
  Store {
      get :: m (Maybe ByteString)
    }
