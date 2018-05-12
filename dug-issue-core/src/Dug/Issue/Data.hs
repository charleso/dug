{-# LANGUAGE NoImplicitPrelude #-}
module Dug.Issue.Data (
    Description (..)
  , Issue (..)
  , Label (..)
  , Title (..)
  ) where

import           Dug.Prelude

-- * Types

newtype Description =
  Description {
      renderDescription :: Text
    } deriving (Eq, Show)

data Issue =
  Issue {
      issueTitle :: Title
    , issueDescription :: Description
    , issueLabels :: [Label]
    } deriving (Eq, Show)

newtype Label =
  Label {
      renderLabel :: Text
    } deriving (Eq, Show)

newtype Title =
  Title {
      renderTitle :: Text
    } deriving (Eq, Show)
