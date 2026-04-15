ghost function C(n: nat): nat  
{
   if n == 0 then 1 else (4 * n - 2) * C(n-1) / (n + 1) 
}

method CatalanNumber(n: nat) returns (res: nat)
  ensures res == C(n)
{
  res := 1;
  for i := 1 to n + 1
  {
    res := (4 * i - 2) * res / (i + 2);  // BUG: (i+2) instead of (i+1)
  }
  return res;
}
