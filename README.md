# Prime sieve of Sundaram

This is a lazy implementation of the [sieve of Sundaram](https://en.wikipedia.org/wiki/Sieve_of_Sundaram) in Haskell. By applying this sieve, the function definition `primes` generates the infinite list of primes as a result.

## Usage

To test it, you can load the Haskell source file into GHCi, the interactive Haskell interpreter, using the command 
```
Prelude> :l primes.hs
```

Get the first 20 primes: 
```
take 20 primes
[2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71]
```

Get all the primes in the interval [100,200]: 
```
takeWhile (<=200) (dropWhile (<100) primes)
[101,103,107,109,113,127,131,137,139,149,151,157,163,167,173,179,181,191,193,197,199]
```
 
 
