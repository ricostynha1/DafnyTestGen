method SetContains(S: set<int>, x: int) returns (r: bool)
  requires |S| > 0
  ensures r == (x in S)
{
  r := x in S;
}

method SetUnion(A: set<int>, B: set<int>) returns (C: set<int>)
  ensures C == A + B
{
  C := A + B;
}

method SetIntersection(A: set<int>, B: set<int>) returns (C: set<int>)
  ensures C == A * B
{
  C := A * B;
}

method SetDifference(A: set<int>, B: set<int>) returns (C: set<int>)
  ensures C == A - B
{
  C := A - B;
}

method SetSubset(A: set<int>, B: set<int>) returns (r: bool)
  requires A <= B || !(A <= B)
  ensures r == (A <= B)
{
  r := A <= B;
}

method AllPositive(S: set<int>) returns (r: bool)
  ensures r == (forall x :: x in S ==> x > 0)
{
  r := forall x :: x in S ==> x > 0;
}

method HasZero(S: set<int>) returns (r: bool)
  ensures r == (exists x :: x in S && x == 0)
{
  r := exists x :: x in S && x == 0;
}

method SubsetForall(A: set<int>, B: set<int>) returns (r: bool)
  ensures r == (forall x :: x in A ==> x in B)
{
  r := forall x :: x in A ==> x in B;
}

method AddElement(S: set<int>, x: int) returns (C: set<int>)
  ensures C == S + {x}
  //ensures x in C
  //ensures forall y :: y in S ==> y in C
{
  C := S + {x};
}

method RemoveElement(S: set<int>, x: int) returns (C: set<int>)
  requires x in S
  ensures C == S - {x}
 // ensures x !in C
 // ensures forall y :: y in S && y != x ==> y in C
{
  C := S - {x};
}

// --- set<nat> ---

method SetContainsNat(S: set<nat>, x: nat) returns (r: bool)
  requires |S| > 0
  ensures r == (x in S)
{
  r := x in S;
}

method SetUnionNat(A: set<nat>, B: set<nat>) returns (C: set<nat>)
  ensures C == A + B
{
  C := A + B;
}

// --- set<char> ---

method SetContainsChar(S: set<char>, c: char) returns (r: bool)
  requires |S| > 0
  ensures r == (c in S)
{
  r := c in S;
}

method SetUnionChar(A: set<char>, B: set<char>) returns (C: set<char>)
  ensures C == A + B
{
  C := A + B;
}

// --- set<enum> ---

datatype Color = Red | White | Blue

method SetContainsColor(S: set<Color>, c: Color) returns (r: bool)
  requires |S| > 0
  ensures r == (c in S)
{
  r := c in S;
}

method SetUnionColor(A: set<Color>, B: set<Color>) returns (C: set<Color>)
  ensures C == A + B
{
  C := A + B;
}
