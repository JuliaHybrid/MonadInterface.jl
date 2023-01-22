Interface for Monad utility.

The interface idea is from the https://github.com/JuliaSymbolics/TermInterface.jl
To be short, it could be viewed as `typeclass` in `Haskell`.

For a monad, we need the following function to be implemented:
    1. fmap
    2. mbind
    3. join
    4. mreturn
    5. mcomp
    6. mthen

The names are the same with those in https://github.com/pao/Monads.jl 