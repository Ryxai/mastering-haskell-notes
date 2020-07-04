{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module M28
  ( Logging(runLogging)
  , getLine
  , Console(runConsole)
  , putStrLn
  , main
  ) where

import Prelude hiding (getLine, putStrLn)
import qualified Prelude as P

newtype Logging a =
  MkLogging
    { runLogging :: Console a
    }
  deriving (Functor, Applicative, Monad)

newtype Console a =
  MkConsole
    { runConsole :: IO a
    }
  deriving (Functor, Applicative, Monad)

getLine :: Logging String
getLine = MkLogging $ MkConsole $ P.getLine

putStrLn :: String -> Console ()
putStrLn s = MkConsole $ P.putStrLn s

main :: IO ()
main = return ()
