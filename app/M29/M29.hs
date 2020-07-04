module M29 where

import Console

echo :: Console ()
echo = do
  line <- Console.getLine
  runLogging $ Console.putStrLn line

main :: IO ()
main = do
  runConsole echo
  runConsole echo
  runConsole echo
