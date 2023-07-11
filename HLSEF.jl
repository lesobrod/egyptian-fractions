include("LSEF.jl")

function scanHLSEF(mn, mx)
  for n = mn:mx
    h = harmNum(n)
    res = min(LSEF(h - floor(BigInt, h)), LSEF(ceil(BigInt, h) - h))
    println("$(n)-th harmonic number needs $(res) egyptian fractions to reach integer")
  end
end

scanHLSEF(2, 20)
