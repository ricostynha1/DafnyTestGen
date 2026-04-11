function Fact(n: nat): nat
{
  if n == 0 then 1 else n * Fact(n - 1)
}

method CalcFact(n: nat) returns (f: nat)
  ensures f == Fact(n)
