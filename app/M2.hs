module M2 where

import Control.Applicative
import Control.Monad
import Control.Monad.Amb
import Control.Monad.Trans.Class
import Control.Monad.Trans.State

pythagoreanTriples :: AmbT r (State Bool) (Int, Int, Int)
pythagoreanTriples = do
  x <- anIntegerBetween 1 10
  y <- anIntegerBetween x 10
  z <- anIntegerBetween y 10
  guard (x * x + y * y == z * z)
  _ <- lift toggle
  return (x, y, z)

toggle :: Monad m => StateT Bool m Bool
toggle = do
  newState <- not <$> get
  put newState
  return newState

oneOf :: Monad m => [a] -> AmbT [a] m a
oneOf [] = empty
oneOf (x:xs) = return x <|> oneOf xs

main :: IO ()
main = do
  let (xs, flag) = runState (allValuesT pythagoreanTriples) False
  putStrLn $
    "found an " ++
    if flag
      then "idd"
      else "even" ++ " number of triples:"
  print xs
