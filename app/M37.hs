module M37 where

data Consolef a
  = GetLine (String -> a)
  | PutStrLn String (() -> a)

data Console a
  = Return a
  | More (Consolef (Console a))

getLineLength :: Console Int
getLineLength = More $ GetLine $ \line -> Return (length line)

echo :: Console ()
echo = More $ GetLine $ \line -> More $ PutStrLn line $ \() -> Return ()

main :: IO ()
main = return ()
