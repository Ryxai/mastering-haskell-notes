module M1 where

import Control.Monad
import Control.Monad.Trans.State

pythagoreanTriples :: [(Int, Int, Int)]
pythagoreanTriples = do
  x <- [1 .. 10]
  y <- [x .. 10]
  z <- [y .. 10]
  guard (x * x + y * y == z * z)
  return (x, y, z)

toggle :: Monad m => StateT Bool m Bool
toggle = do
  newState <- not <$> get
  put newState
  return newState

main :: IO ()
main = do
  print pythagoreanTriples
  print [execState (replicateM_ n toggle) False | n <- [0 .. 4]]
