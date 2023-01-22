module MonadInterface

function fmap end 
function mbind end 
# function join end 
# function mreturn end
# function mcomp end 
function mthen end

mreturn(M, a) = M(a)
function check_rules(f, M, a)
    @assert mbind(f, mreturn(M, a))) == f(a)
    @assert mbind((x) -> mreturn(M, x), m) == m
end

function check_rules(f, g, m)
    @assert mbind(g, mbind(f, m)) == mbind((x) -> mbind(g, f(x)), m)
end

export fmap, mbind, mreturn, mthen, check_rules

end # module MonadInterface
