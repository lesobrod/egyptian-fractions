function checkLEF(f::Rational{BigInt}, k::Int)::Bool
  # Return true, if for f < 1 there is egyptian fraction of length k
  # Otherwise false
  isone(numerator(f)) && return true
  isone(k) && return false
  for i ∈ ceil(BigInt, inv(f)):floor(BigInt, k / f)
    checkLEF(f - (true // i), k - 1) && return true
  end
  false
end

function LSEF(f::Rational{BigInt})
  k = 1
  while checkLEF(f, k)
    k++
  end
  k
end
    
