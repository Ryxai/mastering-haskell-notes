module M36 where

data Consolef a
  = GetLine (String -> a)
  | PutStrLn String (() -> a)

getLineLength :: Consolef Int
getLineLength = GetLine $ \line -> length line

echo :: Consolef (Consolef ())
echo = GetLine $ \line -> PutStrLn line $ \() -> ()

main :: IO ()
main = return ()
