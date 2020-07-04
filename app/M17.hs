module M17 where

import Control.Arrow
import Control.Exception.Base
import Data.Typeable

typeOfException :: SomeException -> TypeRep
typeOfException (SomeException e) = typeOf e

catchType :: IO a -> IO (Either TypeRep a)
catchType = fmap (left typeOfException) . try

example :: IO Int
example = throwIO $ AssertionFailed "oops"

example2 :: IO (Either AssertionFailed a)
example2 = try $ throwIO $ AssertionFailed "oops"

example3 :: IO (Either ArithException e)
example3 = try $ throwIO $ AssertionFailed "oops"

main :: IO ()
main = return ()
