{-  ┌─────────────────────────────────────────────────────────┐
    |  file: sundaram.hs                                      |
    |  author: David De Potter, pl3onasm@gmail.com            |
    |  license: refer to the license file in this repository  |
    |  description: implementation of the sieve of Sundaram   |
    └─────────────────────────────────────────────────────────┘
-}

-- generates an infinite list of primes by applying a sieve 
primes :: [Integer] 
primes = 2 : sieve [1..] unwanted

-- filters the input list by sieving out the unwanted numbers, i.e. 
-- the ones that give rise to odd composite numbers, and outputs
-- the primes (odd numbers which are not composites) that remain
sieve :: [Integer] -> [Integer] -> [Integer]
sieve (n:ns) (b:bs)
  | n < b = 2*n+1 : sieve ns (b:bs)
  | otherwise = sieve ns bs
sieve (n:ns) [] = 2*n+1 : sieve ns []

-- merges two lists into a single one while making  
-- sure the increasing order remains intact
merge :: Ord a => [a] -> [a] -> [a]
merge [] xs = xs
merge xs [] = xs
merge (x:xs) (y:ys) 
  | x < y = x : merge xs (y:ys)
  | x > y = y : merge (x:xs) ys
  | otherwise = x : merge xs ys
  
-- generates a list of unwanted numbers, i.e. all numbers n
-- which can be written as i+j+2*i*j and for which 2*n+1 
-- is a composite number (here the product of two odd numbers)  
unwanted :: [Integer]
unwanted = shift (map values [1..])
  where 
    shift ((n:ns):is) = n : (merge ns (shift is))  
    values i = map (\j -> i + j + 2*i*j) [i..] 
              --maps n-values to every i-input
  
  
