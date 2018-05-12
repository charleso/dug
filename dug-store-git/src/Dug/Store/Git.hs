{-# LANGUAGE NoImplicitPrelude #-}
module Dug.Issue.Store.Git (
    new
  ) where

import           Dug.Prelude

import           System.IO (IO)

-- * Functions

new :: RemoteStore IO
new =
  RemoteStore {
      push = undefined
    , pull = undefined
    }
