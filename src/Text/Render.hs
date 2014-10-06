{-# LANGUAGE OverloadedStrings #-}
module Text.Render (
    Render(..),
    renderTicks
  ) where

import qualified Prelude as P
import Prelude (($), (.), map, Int, Double, Functor(..), Show(..),
                Eq(..), Bool, Integer, Double, Monad(..))
import Control.Monad.Trans (MonadIO(..))
import Data.Monoid
import Data.Text (Text)
import qualified Data.Text as T
import Text.Parsec (ParseError)

type Name = Text
data ErrorList = EL [Text] deriving (Show, Eq)

-- | A class for pretty printing, and in general, for "showing" as a `Text`.
class Show a => Render a where
  -- | Render the object as a `Text`.
  render :: a -> Text
  render = T.pack . P.show
  -- | Many types of objects need to be rendered in parentheses.
  renderParens :: a -> Text
  renderParens = render
  -- | Render in the `IO` monad. Useful for objects containing IORefs.
  renderIO :: MonadIO m => a -> m Text
  renderIO = return . render

instance Render Int
instance Render Bool
instance Render Integer
instance Render Double
instance Render Text
instance Render ParseError
instance (Render a, Render b) => Render (a, b) where
  render (a, b) = "(" <> render a <> ", " <> render b <> ")"
instance Render a => Render [a] where
  render list = "[" <> T.intercalate ", " (map render list) <> "]"

-- | Renders and surrounds in backticks. Useful for printing user input.
renderTicks :: Render a => a -> Text
renderTicks x = "`" <> render x <> "`"
