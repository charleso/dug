{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module Dug.Issue.Remote.Gitub (
    listIssues
  , getComments
  , main
  ) where

import qualified Data.List as List
import qualified Data.Text as T
import qualified Data.Text.Encoding as T

import           Dug.Issue.Data
import           Dug.Prelude

import           GitHub (Owner, Repo)
import qualified GitHub as Github

import qualified Network.HTTP.Client as HC
import qualified Network.HTTP.Client.TLS as HC

import qualified System.Exit as Exit
import           System.IO (IO)
import qualified System.IO as IO
import qualified System.Environment as Environment

-- * Types

newtype ListOffest =
  ListOffest {
      unListOffset :: Int
    } deriving (Eq, Show)

data ListResults =
  ListResults {
      listResultsIssues :: [Issue]
    , listResultsOffset :: Maybe ListOffest
    } deriving (Eq, Show)

-- * Types

data ListIssuesError =
    ListIssuesError
  deriving (Eq, Show)

data GetCommentsError =
    GetCommentsError
  deriving (Eq, Show)

-- * Functions

listIssues :: Maybe ListOffest -> Owner -> Repo -> EitherT ListIssuesError IO ListResults
listIssues =
  undefined

getComments :: IssueId -> EitherT GetCommentsError IO [Comment]
getComments =
  undefined

-- * Github helpers

renderGithubError :: Github.Error -> Text
renderGithubError =
  T.pack . show

-- * Dig.Prelude.IO

orDie :: EitherT Text IO a -> IO a
orDie et =
  runEitherT et >>= \e' ->
    case e' of
      Left e -> do
        IO.hPutStrLn IO.stderr . T.unpack $ e
        Exit.exitFailure
      Right a ->
        pure a

-- * Testing!!!

main :: IO ()
main = do
  env <- Environment.getEnvironment
  mgr <- HC.newManager HC.tlsManagerSettings
  let
    o = "charleso"
    r = "testignoreme"
  auth <- orDie . hoistMaybe "Could not find env GITHUB_OAUTH" $
    fmap (Github.OAuth . T.encodeUtf8 . T.pack) $
    List.lookup "GITHUB_OAUTH" env
  issues <- orDie . firstT renderGithubError . EitherT . Github.executeRequestWithMgr mgr auth $
    Github.issuesForRepoR o r mempty Github.FetchAll
  orDie . firstT renderGithubError . for_ issues $ \i -> do
    comments <- EitherT . Github.executeRequestWithMgr mgr auth $
      Github.commentsR o r (Github.issueNumber i) Github.FetchAll
    liftIO $
      IO.print i
    liftIO $ for_ comments IO.print
