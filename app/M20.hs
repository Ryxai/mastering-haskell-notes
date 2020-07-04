module M20 where

import Control.Concurrent
import Control.Monad
import Control.Monad.IO.Class
import Control.Monad.Trans.Resource
import System.IO
import System.Timeout

acquireFile :: FilePath -> IOMode -> ResIO (ReleaseKey, Handle)
acquireFile filePath mode = allocate open close
  where
    open = liftIO $ openFile filePath mode
    close h =
      liftIO $ do
        hClose h
        putStrLn "closed the file"

example :: IO a
example =
  runResourceT $ do
    (releaseKey, h) <- acquireFile "foo.txt" ReadMode
    liftIO sleepForever

sleepForever :: IO a
sleepForever = forever $ threadDelay 2000000

timeout' :: Int -> IO a -> IO (Maybe a)
timeout' = timeout

main :: IO ()
main = return ()
