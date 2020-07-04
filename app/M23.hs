module M23 where

head1 :: [a] -> a
head1 [] = error "head1 of empty list"
head1 (x:_) = x

main :: IO ()
main = return ()
