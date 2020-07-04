module M32 where

data Statement =
  PutStrLn String
  deriving (Show)

type Logging = [Statement]

runStatement :: Statement -> IO ()
runStatement (PutStrLn s) = putStrLn s

runLogging :: Logging -> IO ()
runLogging = mapM_ runStatement

main :: IO ()
main = return ()
