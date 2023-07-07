using TestLengthEF
function lenSEF(f::Rational{BigInt})
  k = 1
  while checkLEF(f, k)::Bool
    
