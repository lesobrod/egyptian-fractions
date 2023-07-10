include("FindLSEF.jl")
include("HLSEF.jl")

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
  for j = mn : mx
    # Calculate a(n) (exactly positive or negative HLSEF)
    h = harmNum(j)
    d_floor = h - floor(BigInt, h)
    d_ceil = ceil(BigInt, h) - h
    high_res = min(LSEF(d_floor), LSEF(d_ceil))
    println("$(j)-th harmonic number needs $(high_res) one-signed \n egyptian fractions to reach integer")
  end
  for n in 1:high_res - 1, m in 1:n - 1
    if checkMixedLEF(d_floor) || checkMixedLEF(d_ceil)
      low_res = n
      println("\t There is mixed-sign egyptian fraction with length $(low_res)")
      break
    end
  end
end

scanHCLSEF(2, 15)
