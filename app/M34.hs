module M34 where

getLineLength :: IO Int
getLineLength = do
  line <- getLine
  return (length line)

echo :: IO ()
echo = do
  line <- getLine
  putStrLn line

main :: IO ()
main = return ()
