{-# LANGUAGE NoImplicitPrelude #-}
module Dug.Issue.Data (
    Comment (..)
  , Description (..)
  , Issue (..)
  , IssueId (..)
  , Label (..)
  , Title (..)
  ) where

import           Dug.Prelude

-- * Types

data Comment =
  Comment {
      commentBody :: Text
    } deriving (Eq, Show)

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

data IssueId =
  IssueId {
      renderIssueId :: Text
    } deriving (Eq, Show)

newtype Label =
  Label {
      renderLabel :: Text
    } deriving (Eq, Show)

newtype Title =
  Title {
      renderTitle :: Text
    } deriving (Eq, Show)
