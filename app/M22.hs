module M22 where

import Control.Arrow
import Control.Exception.Base
import Data.Typeable

divByZero :: Int
divByZero = 1 `div` 0

buggySum :: [Int] -> Int
buggySum (x:xs) = x + buggySum xs

cyclic :: Int
cyclic = 1 + cyclic

typeOfException :: SomeException -> TypeRep
typeOfException (SomeException e) = typeOf e

catchType :: IO a -> IO (Either TypeRep a)
catchType = fmap (left typeOfException) . try

main :: IO ()
main = return ()
