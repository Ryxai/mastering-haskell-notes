module M21 where

import Control.Arrow
import Control.Exception.Base
import Data.Typeable

example :: Int
example = 1 + throw (AssertionFailed "oops")

typeOfException :: SomeException -> TypeRep
typeOfException (SomeException e) = typeOf e

catchType :: IO a -> IO (Either TypeRep a)
catchType = fmap (left typeOfException) . try

main :: IO ()
main = return ()
