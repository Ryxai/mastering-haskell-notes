module M7 where

import Control.Monad
import Data.Array
import qualified Data.Vector as V

type SquareMatrix a = Array (Int, Int) a

identityMatrix :: Num a => Int -> SquareMatrix a
identityMatrix n =
  listArray ((1, 1), (n, n)) (repeat 0) // [((i, i), 1) | i <- [1 .. n]]

squares :: Num a => V.Vector a
squares = V.cons 4 $ V.cons 9 $ V.cons 16 $ V.cons 25 $ V.empty

printSquareMatrix :: Show a => SquareMatrix a -> IO ()
printSquareMatrix arr = do
  let ((i0, j0), (iZ, jZ)) = bounds arr
  forM_ [j0 .. jZ] $ \j -> do
    forM_ [i0 .. iZ] $ \i -> do
      let x = arr ! (i, j)
      putStr (show x)
      putStr " "
    putStrLn ""

printVector :: Show a => V.Vector a -> IO ()
printVector = print

main :: IO ()
main = do
  printSquareMatrix (identityMatrix 4 :: SquareMatrix Int)
  printVector (squares :: V.Vector Int)
