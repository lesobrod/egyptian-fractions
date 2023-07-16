using FastRationals
include("LSEFfast.jl")

function scanHLSEF(mn, mx)
  for n = mn:mx
    h = harmNum(n)
    res = min(LSEF(h - floor(BigInt, h)), LSEF(ceil(BigInt, h) - h))
    println("$(n)-th harmonic number needs $(res) egyptian fractions to reach integer")
  end
end

println("Input start value:")
input = readline(stdin)
start_scan = tryparse(Int, input)
println("Input end value:")
input = readline(stdin)
end_scan = tryparse(Int, input)
if start_scan !== nothing && end_scan !== nothing && start_scan <= end_scan
  if end_scan > 20
   printstyled("Output may be slow after n = 20\n"; color = :red)
  end
  scanHLSEF(start_scan, end_scan)
else
  @warn "Wrong input"
end

