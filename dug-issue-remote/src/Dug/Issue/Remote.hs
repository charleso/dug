{-# LANGUAGE NoImplicitPrelude #-}
module Dug.Issue.Remote (
    Bookmark(..)
  , Issues (..)
  , Remote (..)
  ) where

import           Dug.Issue.Data

-- * Types

newtype Bookmark =
  Bookmark {
      unBookmark :: ByteString
    } deriving (Eq, Show)

data Issues a =
  Issues {
      issues :: [a]
    , issuesBookmark :: Maybe Bookmark
    } deriving (Eq, Show)

data Remote m =
  forall a.
  Remote {
      list :: Maybe Bookmark -> m (Issues a)
    , get :: a -> m (Maybe Issue)
    }
