
function harmNum(n)
  mapreduce(i->Rational{BigInt}(1,i), +, [1:n;])
end

