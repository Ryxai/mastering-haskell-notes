module M33 where

data Statement =
  PutStrLn String
  deriving (Show)

type Logging = [Statement]

testStatement :: Statement -> [String]
testStatement (PutStrLn s) = [s]

testLogging :: Logging -> [String]
testLogging = foldMap testStatement

main :: IO ()
main = return ()
