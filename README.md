Interface for Monad utility.

The interface idea is from the https://github.com/JuliaSymbolics/TermInterface.jl
To be short, it could be viewed as `typeclass` in `Haskell`.

For a monad, we need the following function to be implemented:
1. Functor
   1. fmap :: (a -> b) -> f a -> f b
2. Monad
   1. mbind(>>= in `Haskell`) :: (Monad m) => m a -> (a -> m b) -> m b
   2. mthen(>> in `Haskell`) :: m a -> m b -> m b
<!-- 3. Monoid
   1. mempty :: m
   2. mappend :: m -> m -> m
   3. mconcat :: [m] -> m -->

<!-- 4. mbind
5. join
6.  mreturn
7.  mcomp
8.  mthen -->

<!-- The names are the same with those in https://github.com/pao/Monads.jl  -->