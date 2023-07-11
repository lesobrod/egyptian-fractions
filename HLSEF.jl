include("LSEF.jl")

function scanHLSEF(mn, mx)
  for j = mn:mx
    h = harmNum(j)
    res = min(LSEF(h - floor(BigInt, h)), LSEF(ceil(BigInt, h) - h))
    println("$(j)-th harmonic number needs $(res) egyptian fractions to reach integer")
  end
end

scanHLSEF(2, 20)
