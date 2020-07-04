module M13 where

import Control.Concurrent as Concurrent
import Data.IORef
import Foreign
import System.Mem
import System.Mem.Weak

main :: IO ()
main = do
  ptr <- mallocBytes 1024
  ptr <- mallocBytes 1024
  let freePtr = do
        putStrLn $ "freeing " ++ show ptr
        free ptr
  ref <- newIORef ptr
  weak <- mkWeakIORef ref freePtr
  performGC >> Concurrent.yield
  putStrLn $ "still referenced"
  deRefWeak weak >>= traverse readIORef >>= print
  poke ptr (42 :: Int) >> modifyIORef ref id
  performGC >> Concurrent.yield
  putStrLn "no longer referenced"
