method MultisetContains(M: multiset<int>, x: int) returns (r: bool)
  requires |M| > 0
  ensures r == (x in M)
{
  r := x in M;
}

method MultisetUnion(A: multiset<int>, B: multiset<int>) returns (C: multiset<int>)
  ensures C == A + B
{
  C := A + B;
}

method MultisetIntersection(A: multiset<int>, B: multiset<int>) returns (C: multiset<int>)
  ensures C == A * B
{
  C := A * B;
}

method MultisetDifference(A: multiset<int>, B: multiset<int>) returns (C: multiset<int>)
  ensures C == A - B
{
  C := A - B;
}

method MultisetSubset(A: multiset<int>, B: multiset<int>) returns (r: bool)
  requires A <= B || !(A <= B)
  ensures r == (A <= B)
{
  r := A <= B;
}

method MultisetCount(M: multiset<int>, x: int) returns (r: nat)
  ensures r == M[x]
{
  r := M[x];
}

method AddElement(M: multiset<int>, x: int) returns (C: multiset<int>)
  ensures C == M + multiset{x}
  ensures x in C
{
  C := M + multiset{x};
}
