using FastRationals

function checkLEF(f::FastRational{BigInt}, k::Int)::Bool
  # Return true, if for f < 1 there is egyptian fraction of length k
  # Otherwise false
  isone(numerator(f)) && return true
  isone(k) && return false
  for i in ceil(BigInt, inv(f)):floor(BigInt, k / f)
    checkLEF(FastRational{BigInt}(f - inv(i)), k - 1) && return true
  end
  false
end

function harmNum(n)
  # Return n-th harmonic number as Rational BigInt
  mapreduce(i->FastRational{BigInt}(1,i), +, [1:n;])
end

function LSEF(f::FastRational{BigInt})::Int
  # Return the minimal possible length of egyptian fraction for f
  k = 1
  while !checkLEF(f, k)
    k+=1
  end
  k
end
