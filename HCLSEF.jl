include("LSEF.jl")

function checkMixedLEF(f::Rational{BigInt}, k::Int, m::Int)::Bool
	if isone(m)
		for i in 2:floor(BigInt, inv(f))
      checkLEF(1 // i - f, k) && return true
		end
    return false
    
		else
		checkMixedLEF(f, k, m - 1)
	end
end

function scanHCLSEF(mn::Int, mx::Int)
  for n = mn : mx
    # Calculate a(n) (exactly positive or negative HLSEF)
    h = harmNum(n)
    d_floor = h - floor(BigInt, h)
    d_ceil = ceil(BigInt, h) - h
    high_res = min(LSEF(d_floor), LSEF(d_ceil))
    println("$(n)-th harmonic number needs $(high_res) one-signed egyptian fractions to reach integer")
   
  	for k in 1:high_res - 1, m in 1:k - 1
  	  if checkMixedLEF(d_floor, k - m, m) || checkMixedLEF(d_ceil, k - m, m)
          low_res = k
          printstyled("\t There is mixed-sign egyptian fraction with length $(low_res)\n"; color= :yellow)
  	    break
  	  end
  	end
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
  scanHCLSEF(start_scan, end_scan)
else
  @warn "Wrong input"
end
