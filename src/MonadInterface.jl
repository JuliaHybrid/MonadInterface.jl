module MonadInterface

function unwrap end
function fmap end 

"""
interface for Functions, note that in this case, instance of T should be callable, just as what an instance of Function does
"""
abstract type FunctionType end
const FunctionUnion = Union{FunctionType, Function}

mbind(ma, f::FunctionUnion) = f(unwrap(ma))

"""
since mbind is so convinient, we what an infix operator for it. In Haskell, we have >>=, however, in julia we can not define an operator with symbols like >>=. Here, we instead use >>. Note that >> has different meaning in Haskell, but as long as we are in julia, we may not follow this convention.
"""
(>>)(ma, f::FunctionUnion) = mbind(ma, f)
(<<)(f::FunctionUnion, ma) = mbind(ma, f)

# function join end 
# function mreturn end
# function mcomp end 
function mthen end

mreturn(M, a) = M(a)
function check_rules(f, M, a, ::Val{:fMa})
    @assert mbind(mreturn(M, a), f) == f(a)
end

function check_rules(m, M, ::Val{:mM})
    @assert mbind(m, x -> mreturn(M, x)) == m
end

function check_rules(f, g, m, ::Val{:fgm})
    @assert mbind(mbind(m, f), g) == mbind(m, x -> mbind(f(x), g))
end


end # module MonadInterface
