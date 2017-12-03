# -*- coding: utf-8 -*-

# generate random datasets
D = rand(Int, 10, 10)
D[D .>= 0.5] = 1
D[D .< 0.5] = 0
display(D)
println()

using StatsBase

function swap(D, K)
    # Algorithm1 Swap
    n, m = size(D)
    Dhat = copy(D)
    for i=1:K
        s, t = sample(1:n, 2, replace=false)
        x, y = sample(1:m, 2, replace=false)
        while Dhat[s, x] == 0 || Dhat[t, y] == 0
            s, t = sample(1:n, 2, replace=false)
            x, y = sample(1:m, 2, replace=false)
        end
        if Dhat[s, y] == 0 && Dhat[t, x] == 0
            Dhat[s, x] = Dhat[t, y] = 0
            Dhat[s, y] = Dhat[t, x] = 1
        end
    end
    return Dhat
end

K = 10
Dhat = swap(D, K)

println("After swap K=$K")
display(Dhat)
println()
