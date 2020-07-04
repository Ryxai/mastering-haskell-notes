module M18 where

import Control.Arrow
import Control.Concurrent
import Control.Exception.Base
import Control.Monad
import Data.Typeable
import System.Timeout

typeOfException :: SomeException -> TypeRep
typeOfException (SomeException e) = typeOf e

catchType :: IO a -> IO (Either TypeRep a)
catchType = fmap (left typeOfException) . try

sleepForever :: IO a
sleepForever = forever $ threadDelay 2000000

uninterruptibleSleep :: IO a
uninterruptibleSleep = forever $ catchType $ threadDelay 20000000

timeout' :: Int -> IO a -> IO (Maybe a)
timeout' = timeout

main :: IO ()
main = return ()
