include("FindLSEF.jl")

function harmNum(n)
  # Return n-th harmonic number as Rational BigInt
  mapreduce(i->Rational{BigInt}(1,i), +, [1:n;])
end

function scanHLSEF(mn, mx)
  for j = mn:mx
    h = harmNum(j)
    res = min(LSEF(h) - floor(BigInt, h), LSEF(ceil(BigInt, h) - h))
    println("$(j)-th harmonic number needs $(res) egyptian fraction to reach integer")
  end
end

scanHLSEF(2, 10)
