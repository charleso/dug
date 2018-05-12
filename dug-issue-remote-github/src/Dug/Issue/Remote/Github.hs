{-# LANGUAGE NoImplicitPrelude #-}
module Dug.Issue.Remote.Gitub (
    new
  ) where

import           Dug.Prelude

import           System.IO (IO)

-- * Types

new :: Remote IO
new =
  Remote {
      list = undefined
    , get = undefined
    }
