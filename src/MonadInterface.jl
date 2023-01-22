module MonadInterface

function unwrap end
function fmap end 
# function mbind end 
mbind(ma, f::Function) = f(unwrap(ma))

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

# export unwrap, fmap, mbind, mreturn, mthen, check_rules

end # module MonadInterface
