module M24 where

import Data.List (nub)
import Data.List.NonEmpty (NonEmpty(..))
import Data.Map (Map, (!))

head1 :: [a] -> a
head1 [] = error "head1 of empty list"
head1 (x:_) = x

head2 :: NonEmpty a -> a
head2 (x :| _) = x

type Graph node = Map node [node]

twoEdgesAway :: Ord node => Graph node -> node -> [node]
twoEdgesAway g n0 =
  nub $ do
    n1 <- g ! n0
    n2 <- g ! n1
    return n2

main :: IO ()
main = return ()
