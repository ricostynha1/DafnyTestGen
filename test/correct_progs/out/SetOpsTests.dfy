// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\SetOps.dfy
// Method: SetContains
// Generated: 2026-04-08 10:21:48

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


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  |S| > 0
  //   POST: r == (x in S)
  //   ENSURES: r == (x in S)
  {
    var S: set<int> := {-2, -1, 0, 1, 2, 3, 4};
    var x := 0;
    var r := SetContains(S, x);
    expect r == true;
  }

  // Test case for combination {1}/BS=1,x=0:
  //   PRE:  |S| > 0
  //   POST: r == (x in S)
  //   ENSURES: r == (x in S)
  {
    var S: set<int> := {1};
    var x := 0;
    var r := SetContains(S, x);
    expect r == false;
  }

  // Test case for combination {1}/BS=1,x=1:
  //   PRE:  |S| > 0
  //   POST: r == (x in S)
  //   ENSURES: r == (x in S)
  {
    var S: set<int> := {1};
    var x := 1;
    var r := SetContains(S, x);
    expect r == true;
  }

  // Test case for combination {1}/BS=2,x=0:
  //   PRE:  |S| > 0
  //   POST: r == (x in S)
  //   ENSURES: r == (x in S)
  {
    var S: set<int> := {4, 5};
    var x := 0;
    var r := SetContains(S, x);
    expect r == false;
  }

  // Test case for combination {1}/Or=true:
  //   PRE:  |S| > 0
  //   POST: r == (x in S)
  //   ENSURES: r == (x in S)
  {
    var S: set<int> := {0, 1, 5};
    var x := 5;
    var r := SetContains(S, x);
    expect r == true;
  }

  // Test case for combination {1}/Or=false:
  //   PRE:  |S| > 0
  //   POST: r == (x in S)
  //   ENSURES: r == (x in S)
  {
    var S: set<int> := {-2, 1, 4, 5};
    var x := 6;
    var r := SetContains(S, x);
    expect r == false;
  }

  // Test case for combination {1}:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: set<int> := {};
    var B: set<int> := {};
    var C := SetUnion(A, B);
    expect C == {};
  }

  // Test case for combination {1}/BA=0,B=1:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: set<int> := {};
    var B: set<int> := {1};
    var C := SetUnion(A, B);
    expect C == {1};
  }

  // Test case for combination {1}/BA=0,B=2:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: set<int> := {};
    var B: set<int> := {2, 5};
    var C := SetUnion(A, B);
    expect C == {2, 5};
  }

  // Test case for combination {1}/BA=0,B=3:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: set<int> := {};
    var B: set<int> := {-2, -1, 1};
    var C := SetUnion(A, B);
    expect C == {-2, -1, 1};
  }

  // Test case for combination {1}/O|C|>=3:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: set<int> := {1, 2, 3, 4};
    var B: set<int> := {0, 1};
    var C := SetUnion(A, B);
    expect C == {0, 1, 2, 3, 4};
  }

  // Test case for combination {1}/O|C|>=2:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: set<int> := {2, 5};
    var B: set<int> := {-2, 0};
    var C := SetUnion(A, B);
    expect C == {-2, 0, 2, 5};
  }

  // Test case for combination {1}/O|C|>=1:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: set<int> := {};
    var B: set<int> := {-2, 0, 1};
    var C := SetUnion(A, B);
    expect C == {-2, 0, 1};
  }

  // Test case for combination {1}:
  //   POST: C == A * B
  //   ENSURES: C == A * B
  {
    var A: set<int> := {};
    var B: set<int> := {};
    var C := SetIntersection(A, B);
    expect C == {};
  }

  // Test case for combination {1}/BA=0,B=1:
  //   POST: C == A * B
  //   ENSURES: C == A * B
  {
    var A: set<int> := {};
    var B: set<int> := {1};
    var C := SetIntersection(A, B);
    expect C == {};
  }

  // Test case for combination {1}/BA=0,B=2:
  //   POST: C == A * B
  //   ENSURES: C == A * B
  {
    var A: set<int> := {};
    var B: set<int> := {2, 5};
    var C := SetIntersection(A, B);
    expect C == {};
  }

  // Test case for combination {1}/BA=0,B=3:
  //   POST: C == A * B
  //   ENSURES: C == A * B
  {
    var A: set<int> := {};
    var B: set<int> := {-2, -1, 1};
    var C := SetIntersection(A, B);
    expect C == {};
  }

  // Test case for combination {1}/O|C|>=3:
  //   POST: C == A * B
  //   ENSURES: C == A * B
  {
    var A: set<int> := {1, 2, 4, 5};
    var B: set<int> := {-1, 1, 4, 5};
    var C := SetIntersection(A, B);
    expect C == {1, 4, 5};
  }

  // Test case for combination {1}/O|C|>=2:
  //   POST: C == A * B
  //   ENSURES: C == A * B
  {
    var A: set<int> := {0, 1, 2, 3};
    var B: set<int> := {1, 3, 4};
    var C := SetIntersection(A, B);
    expect C == {1, 3};
  }

  // Test case for combination {1}/O|C|>=1:
  //   POST: C == A * B
  //   ENSURES: C == A * B
  {
    var A: set<int> := {1, 3, 4};
    var B: set<int> := {-1, 1, 4};
    var C := SetIntersection(A, B);
    expect C == {1, 4};
  }

  // Test case for combination {1}:
  //   POST: C == A - B
  //   ENSURES: C == A - B
  {
    var A: set<int> := {};
    var B: set<int> := {};
    var C := SetDifference(A, B);
    expect C == {};
  }

  // Test case for combination {1}/BA=0,B=1:
  //   POST: C == A - B
  //   ENSURES: C == A - B
  {
    var A: set<int> := {};
    var B: set<int> := {1};
    var C := SetDifference(A, B);
    expect C == {};
  }

  // Test case for combination {1}/BA=0,B=2:
  //   POST: C == A - B
  //   ENSURES: C == A - B
  {
    var A: set<int> := {};
    var B: set<int> := {2, 5};
    var C := SetDifference(A, B);
    expect C == {};
  }

  // Test case for combination {1}/BA=0,B=3:
  //   POST: C == A - B
  //   ENSURES: C == A - B
  {
    var A: set<int> := {};
    var B: set<int> := {-2, -1, 1};
    var C := SetDifference(A, B);
    expect C == {};
  }

  // Test case for combination {1}/O|C|>=3:
  //   POST: C == A - B
  //   ENSURES: C == A - B
  {
    var A: set<int> := {-1, 1, 5};
    var B: set<int> := {-2, 0, 2, 3, 4};
    var C := SetDifference(A, B);
    expect C == {-1, 1, 5};
  }

  // Test case for combination {1}/O|C|>=2:
  //   POST: C == A - B
  //   ENSURES: C == A - B
  {
    var A: set<int> := {3, 5};
    var B: set<int> := {-2, 0, 1, 2, 4};
    var C := SetDifference(A, B);
    expect C == {3, 5};
  }

  // Test case for combination {1}/O|C|>=1:
  //   POST: C == A - B
  //   ENSURES: C == A - B
  {
    var A: set<int> := {-1};
    var B: set<int> := {-2, 0, 1, 2, 3, 4, 5};
    var C := SetDifference(A, B);
    expect C == {-1};
  }

  // Test case for combination P{1}/{1}:
  //   PRE:  A <= B || !(A <= B)
  //   POST: r == (A <= B)
  //   ENSURES: r == (A <= B)
  {
    var A: set<int> := {};
    var B: set<int> := {};
    var r := SetSubset(A, B);
    expect r == true;
  }

  // Test case for combination P{2}/{1}:
  //   PRE:  A <= B || !(A <= B)
  //   POST: r == (A <= B)
  //   ENSURES: r == (A <= B)
  {
    var A: set<int> := {2};
    var B: set<int> := {-1};
    var r := SetSubset(A, B);
    expect r == false;
  }

  // Test case for combination P{1}/{1}/BA=0,B=1:
  //   PRE:  A <= B || !(A <= B)
  //   POST: r == (A <= B)
  //   ENSURES: r == (A <= B)
  {
    var A: set<int> := {};
    var B: set<int> := {5};
    var r := SetSubset(A, B);
    expect r == true;
  }

  // Test case for combination P{1}/{1}/BA=0,B=2:
  //   PRE:  A <= B || !(A <= B)
  //   POST: r == (A <= B)
  //   ENSURES: r == (A <= B)
  {
    var A: set<int> := {};
    var B: set<int> := {1, 5};
    var r := SetSubset(A, B);
    expect r == true;
  }

  // Test case for combination P{1}/{1}/Or=true:
  //   PRE:  A <= B || !(A <= B)
  //   POST: r == (A <= B)
  //   ENSURES: r == (A <= B)
  {
    var A: set<int> := {1, 3, 5};
    var B: set<int> := {1, 2, 3, 4, 5};
    var r := SetSubset(A, B);
    expect r == true;
  }

  // Test case for combination P{2}/{1}/Or=false:
  //   PRE:  A <= B || !(A <= B)
  //   POST: r == (A <= B)
  //   ENSURES: r == (A <= B)
  {
    var A: set<int> := {-2};
    var B: set<int> := {0, 3};
    var r := SetSubset(A, B);
    expect r == false;
  }

  // Test case for combination {1}:
  //   POST: r == forall x :: x in S ==> x > 0
  //   ENSURES: r == forall x :: x in S ==> x > 0
  {
    var S: set<int> := {};
    var r := AllPositive(S);
    expect r == true;
  }

  // Test case for combination {1}/BS=1:
  //   POST: r == forall x :: x in S ==> x > 0
  //   ENSURES: r == forall x :: x in S ==> x > 0
  {
    var S: set<int> := {1};
    var r := AllPositive(S);
    expect r == true;
  }

  // Test case for combination {1}/BS=2:
  //   POST: r == forall x :: x in S ==> x > 0
  //   ENSURES: r == forall x :: x in S ==> x > 0
  {
    var S: set<int> := {4, 5};
    var r := AllPositive(S);
    expect r == true;
  }

  // Test case for combination {1}/BS=3:
  //   POST: r == forall x :: x in S ==> x > 0
  //   ENSURES: r == forall x :: x in S ==> x > 0
  {
    var S: set<int> := {3, 4, 5};
    var r := AllPositive(S);
    expect r == true;
  }

  // Test case for combination {1}/Or=true:
  //   POST: r == forall x :: x in S ==> x > 0
  //   ENSURES: r == forall x :: x in S ==> x > 0
  {
    var S: set<int> := {1, 2, 3, 5};
    var r := AllPositive(S);
    expect r == true;
  }

  // Test case for combination {1}/Or=false:
  //   POST: r == forall x :: x in S ==> x > 0
  //   ENSURES: r == forall x :: x in S ==> x > 0
  {
    var S: set<int> := {-1};
    var r := AllPositive(S);
    expect r == false;
  }

  // Test case for combination {1}:
  //   POST: r == exists x :: x in S && x == 0
  //   ENSURES: r == exists x :: x in S && x == 0
  {
    var S: set<int> := {};
    var r := HasZero(S);
    expect r == false;
  }

  // Test case for combination {1}/BS=1:
  //   POST: r == exists x :: x in S && x == 0
  //   ENSURES: r == exists x :: x in S && x == 0
  {
    var S: set<int> := {1};
    var r := HasZero(S);
    expect r == false;
  }

  // Test case for combination {1}/BS=2:
  //   POST: r == exists x :: x in S && x == 0
  //   ENSURES: r == exists x :: x in S && x == 0
  {
    var S: set<int> := {4, 5};
    var r := HasZero(S);
    expect r == false;
  }

  // Test case for combination {1}/BS=3:
  //   POST: r == exists x :: x in S && x == 0
  //   ENSURES: r == exists x :: x in S && x == 0
  {
    var S: set<int> := {3, 4, 5};
    var r := HasZero(S);
    expect r == false;
  }

  // Test case for combination {1}/Or=true:
  //   POST: r == exists x :: x in S && x == 0
  //   ENSURES: r == exists x :: x in S && x == 0
  {
    var S: set<int> := {0, 1, 4, 5};
    var r := HasZero(S);
    expect r == true;
  }

  // Test case for combination {1}/Or=false:
  //   POST: r == exists x :: x in S && x == 0
  //   ENSURES: r == exists x :: x in S && x == 0
  {
    var S: set<int> := {2, 3, 5};
    var r := HasZero(S);
    expect r == false;
  }

  // Test case for combination {1}:
  //   POST: r == forall x :: x in A ==> x in B
  //   ENSURES: r == forall x :: x in A ==> x in B
  {
    var A: set<int> := {};
    var B: set<int> := {};
    var r := SubsetForall(A, B);
    expect r == true;
  }

  // Test case for combination {1}/BA=0,B=1:
  //   POST: r == forall x :: x in A ==> x in B
  //   ENSURES: r == forall x :: x in A ==> x in B
  {
    var A: set<int> := {};
    var B: set<int> := {4};
    var r := SubsetForall(A, B);
    expect r == true;
  }

  // Test case for combination {1}/BA=0,B=2:
  //   POST: r == forall x :: x in A ==> x in B
  //   ENSURES: r == forall x :: x in A ==> x in B
  {
    var A: set<int> := {};
    var B: set<int> := {0, 1};
    var r := SubsetForall(A, B);
    expect r == true;
  }

  // Test case for combination {1}/BA=0,B=3:
  //   POST: r == forall x :: x in A ==> x in B
  //   ENSURES: r == forall x :: x in A ==> x in B
  {
    var A: set<int> := {};
    var B: set<int> := {-2, -1, 2};
    var r := SubsetForall(A, B);
    expect r == true;
  }

  // Test case for combination {1}/Or=true:
  //   POST: r == forall x :: x in A ==> x in B
  //   ENSURES: r == forall x :: x in A ==> x in B
  {
    var A: set<int> := {3, 4};
    var B: set<int> := {3, 4};
    var r := SubsetForall(A, B);
    expect r == true;
  }

  // Test case for combination {1}/Or=false:
  //   POST: r == forall x :: x in A ==> x in B
  //   ENSURES: r == forall x :: x in A ==> x in B
  {
    var A: set<int> := {3};
    var B: set<int> := {-2, 1};
    var r := SubsetForall(A, B);
    expect r == false;
  }

  // Test case for combination {1}:
  //   POST: C == S + {x}
  //   ENSURES: C == S + {x}
  {
    var S: set<int> := {};
    var x := 0;
    var C := AddElement(S, x);
    expect C == {0};
  }

  // Test case for combination {1}/BS=0,x=1:
  //   POST: C == S + {x}
  //   ENSURES: C == S + {x}
  {
    var S: set<int> := {};
    var x := 1;
    var C := AddElement(S, x);
    expect C == {1};
  }

  // Test case for combination {1}/BS=1,x=0:
  //   POST: C == S + {x}
  //   ENSURES: C == S + {x}
  {
    var S: set<int> := {1};
    var x := 0;
    var C := AddElement(S, x);
    expect C == {0, 1};
  }

  // Test case for combination {1}/BS=1,x=1:
  //   POST: C == S + {x}
  //   ENSURES: C == S + {x}
  {
    var S: set<int> := {1};
    var x := 1;
    var C := AddElement(S, x);
    expect C == {1};
  }

  // Test case for combination {1}/O|C|>=3:
  //   POST: C == S + {x}
  //   ENSURES: C == S + {x}
  {
    var S: set<int> := {2, 3, 4, 5};
    var x := -2;
    var C := AddElement(S, x);
    expect C == {-2, 2, 3, 4, 5};
  }

  // Test case for combination {1}/O|C|>=2:
  //   POST: C == S + {x}
  //   ENSURES: C == S + {x}
  {
    var S: set<int> := {0, 1, 3, 5};
    var x := 3;
    var C := AddElement(S, x);
    expect C == {0, 1, 3, 5};
  }

  // Test case for combination {1}/O|C|>=1:
  //   POST: C == S + {x}
  //   ENSURES: C == S + {x}
  {
    var S: set<int> := {4};
    var x := 0;
    var C := AddElement(S, x);
    expect C == {0, 4};
  }

  // Test case for combination {1}:
  //   PRE:  x in S
  //   POST: C == S - {x}
  //   ENSURES: C == S - {x}
  {
    var S: set<int> := {2};
    var x := 2;
    var C := RemoveElement(S, x);
    expect C == {};
  }

  // Test case for combination {1}/BS=1,x=0:
  //   PRE:  x in S
  //   POST: C == S - {x}
  //   ENSURES: C == S - {x}
  {
    var S: set<int> := {0};
    var x := 0;
    var C := RemoveElement(S, x);
    expect C == {};
  }

  // Test case for combination {1}/BS=1,x=1:
  //   PRE:  x in S
  //   POST: C == S - {x}
  //   ENSURES: C == S - {x}
  {
    var S: set<int> := {1};
    var x := 1;
    var C := RemoveElement(S, x);
    expect C == {};
  }

  // Test case for combination {1}/BS=2,x=0:
  //   PRE:  x in S
  //   POST: C == S - {x}
  //   ENSURES: C == S - {x}
  {
    var S: set<int> := {0, 1};
    var x := 0;
    var C := RemoveElement(S, x);
    expect C == {1};
  }

  // Test case for combination {1}/O|C|>=3:
  //   PRE:  x in S
  //   POST: C == S - {x}
  //   ENSURES: C == S - {x}
  {
    var S: set<int> := {-2, -1, 0, 2, 3, 4, 5};
    var x := 0;
    var C := RemoveElement(S, x);
    expect C == {-2, -1, 2, 3, 4, 5};
  }

  // Test case for combination {1}/O|C|>=2:
  //   PRE:  x in S
  //   POST: C == S - {x}
  //   ENSURES: C == S - {x}
  {
    var S: set<int> := {-1, 4, 5};
    var x := 5;
    var C := RemoveElement(S, x);
    expect C == {-1, 4};
  }

  // Test case for combination {1}/O|C|>=1:
  //   PRE:  x in S
  //   POST: C == S - {x}
  //   ENSURES: C == S - {x}
  {
    var S: set<int> := {3, 4};
    var x := 3;
    var C := RemoveElement(S, x);
    expect C == {4};
  }

  // Test case for combination {1}:
  //   PRE:  |S| > 0
  //   POST: r == (x in S)
  //   ENSURES: r == (x in S)
  {
    var S: set<nat> := {0, 1, 2, 3, 4, 6, 7};
    var x := 0;
    var r := SetContainsNat(S, x);
    expect r == true;
  }

  // Test case for combination {1}/BS=1,x=0:
  //   PRE:  |S| > 0
  //   POST: r == (x in S)
  //   ENSURES: r == (x in S)
  {
    var S: set<nat> := {0};
    var x := 0;
    var r := SetContainsNat(S, x);
    expect r == true;
  }

  // Test case for combination {1}/BS=1,x=1:
  //   PRE:  |S| > 0
  //   POST: r == (x in S)
  //   ENSURES: r == (x in S)
  {
    var S: set<nat> := {0};
    var x := 1;
    var r := SetContainsNat(S, x);
    expect r == false;
  }

  // Test case for combination {1}/BS=2,x=0:
  //   PRE:  |S| > 0
  //   POST: r == (x in S)
  //   ENSURES: r == (x in S)
  {
    var S: set<nat> := {6, 7};
    var x := 0;
    var r := SetContainsNat(S, x);
    expect r == false;
  }

  // Test case for combination {1}/Or=true:
  //   PRE:  |S| > 0
  //   POST: r == (x in S)
  //   ENSURES: r == (x in S)
  {
    var S: set<nat> := {0, 1, 2, 3, 4};
    var x := 0;
    var r := SetContainsNat(S, x);
    expect r == true;
  }

  // Test case for combination {1}/Or=false:
  //   PRE:  |S| > 0
  //   POST: r == (x in S)
  //   ENSURES: r == (x in S)
  {
    var S: set<nat> := {3, 6};
    var x := 0;
    var r := SetContainsNat(S, x);
    expect r == false;
  }

  // Test case for combination {1}:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: set<nat> := {};
    var B: set<nat> := {};
    var C := SetUnionNat(A, B);
    expect C == {};
  }

  // Test case for combination {1}/BA=0,B=1:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: set<nat> := {};
    var B: set<nat> := {2};
    var C := SetUnionNat(A, B);
    expect C == {2};
  }

  // Test case for combination {1}/BA=0,B=2:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: set<nat> := {};
    var B: set<nat> := {3, 5};
    var C := SetUnionNat(A, B);
    expect C == {3, 5};
  }

  // Test case for combination {1}/BA=0,B=3:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: set<nat> := {};
    var B: set<nat> := {3, 4, 5};
    var C := SetUnionNat(A, B);
    expect C == {3, 4, 5};
  }

  // Test case for combination {1}/O|C|>=3:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: set<nat> := {1, 4};
    var B: set<nat> := {7};
    var C := SetUnionNat(A, B);
    expect C == {1, 4, 7};
  }

  // Test case for combination {1}/O|C|>=2:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: set<nat> := {2, 3, 6};
    var B: set<nat> := {2, 4};
    var C := SetUnionNat(A, B);
    expect C == {2, 3, 4, 6};
  }

  // Test case for combination {1}/O|C|>=1:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: set<nat> := {};
    var B: set<nat> := {0, 5};
    var C := SetUnionNat(A, B);
    expect C == {0, 5};
  }

  // Test case for combination {1}:
  //   PRE:  |S| > 0
  //   POST: r == (c in S)
  //   ENSURES: r == (c in S)
  {
    var S: set<char> := {'b', 'c', 'd', 'e', 'f', 'g', 'h'};
    var c := ' ';
    var r := SetContainsChar(S, c);
    expect r == false;
  }

  // Test case for combination {1}/BS=1:
  //   PRE:  |S| > 0
  //   POST: r == (c in S)
  //   ENSURES: r == (c in S)
  {
    var S: set<char> := {'h'};
    var c := ' ';
    var r := SetContainsChar(S, c);
    expect r == false;
  }

  // Test case for combination {1}/BS=2:
  //   PRE:  |S| > 0
  //   POST: r == (c in S)
  //   ENSURES: r == (c in S)
  {
    var S: set<char> := {'e', 'h'};
    var c := ' ';
    var r := SetContainsChar(S, c);
    expect r == false;
  }

  // Test case for combination {1}/BS=3:
  //   PRE:  |S| > 0
  //   POST: r == (c in S)
  //   ENSURES: r == (c in S)
  {
    var S: set<char> := {'e', 'g', 'h'};
    var c := ' ';
    var r := SetContainsChar(S, c);
    expect r == false;
  }

  // Test case for combination {1}/Or=true:
  //   PRE:  |S| > 0
  //   POST: r == (c in S)
  //   ENSURES: r == (c in S)
  {
    var S: set<char> := {'a', 'f', 'g'};
    var c := 'g';
    var r := SetContainsChar(S, c);
    expect r == true;
  }

  // Test case for combination {1}/Or=false:
  //   PRE:  |S| > 0
  //   POST: r == (c in S)
  //   ENSURES: r == (c in S)
  {
    var S: set<char> := {'a', 'b', 'e', 'f', 'g'};
    var c := 'q';
    var r := SetContainsChar(S, c);
    expect r == false;
  }

  // Test case for combination {1}:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: set<char> := {};
    var B: set<char> := {};
    var C := SetUnionChar(A, B);
    expect C == {};
  }

  // Test case for combination {1}/BA=0,B=1:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: set<char> := {};
    var B: set<char> := {'c'};
    var C := SetUnionChar(A, B);
    expect C == {'c'};
  }

  // Test case for combination {1}/BA=0,B=2:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: set<char> := {};
    var B: set<char> := {'d', 'f'};
    var C := SetUnionChar(A, B);
    expect C == {'d', 'f'};
  }

  // Test case for combination {1}/BA=0,B=3:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: set<char> := {};
    var B: set<char> := {'d', 'f', 'h'};
    var C := SetUnionChar(A, B);
    expect C == {'d', 'f', 'h'};
  }

  // Test case for combination {1}/O|C|>=3:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: set<char> := {'b', 'c', 'e', 'f'};
    var B: set<char> := {'c', 'd', 'e', 'g'};
    var C := SetUnionChar(A, B);
    expect C == {'b', 'c', 'd', 'e', 'f', 'g'};
  }

  // Test case for combination {1}/O|C|>=2:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: set<char> := {'d'};
    var B: set<char> := {'c', 'e', 'f'};
    var C := SetUnionChar(A, B);
    expect C == {'c', 'd', 'e', 'f'};
  }

  // Test case for combination {1}/O|C|>=1:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: set<char> := {'d', 'h'};
    var B: set<char> := {'a', 'b', 'c', 'g'};
    var C := SetUnionChar(A, B);
    expect C == {'a', 'b', 'c', 'd', 'g', 'h'};
  }

  // Test case for combination {1}:
  //   PRE:  |S| > 0
  //   POST: r == (c in S)
  //   ENSURES: r == (c in S)
  {
    var S: set<Color> := {White, Blue};
    var c := Red;
    var r := SetContainsColor(S, c);
    expect r == false;
  }

  // Test case for combination {1}/BS=1,c=Red:
  //   PRE:  |S| > 0
  //   POST: r == (c in S)
  //   ENSURES: r == (c in S)
  {
    var S: set<Color> := {Blue};
    var c := Red;
    var r := SetContainsColor(S, c);
    expect r == false;
  }

  // Test case for combination {1}/BS=1,c=White:
  //   PRE:  |S| > 0
  //   POST: r == (c in S)
  //   ENSURES: r == (c in S)
  {
    var S: set<Color> := {Blue};
    var c := White;
    var r := SetContainsColor(S, c);
    expect r == false;
  }

  // Test case for combination {1}/BS=1,c=Blue:
  //   PRE:  |S| > 0
  //   POST: r == (c in S)
  //   ENSURES: r == (c in S)
  {
    var S: set<Color> := {Blue};
    var c := Blue;
    var r := SetContainsColor(S, c);
    expect r == true;
  }

  // Test case for combination {1}/Or=true:
  //   PRE:  |S| > 0
  //   POST: r == (c in S)
  //   ENSURES: r == (c in S)
  {
    var S: set<Color> := {White};
    var c := White;
    var r := SetContainsColor(S, c);
    expect r == true;
  }

  // Test case for combination {1}/Or=false:
  //   PRE:  |S| > 0
  //   POST: r == (c in S)
  //   ENSURES: r == (c in S)
  {
    var S: set<Color> := {Red, Blue};
    var c := White;
    var r := SetContainsColor(S, c);
    expect r == false;
  }

  // Test case for combination {1}:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: set<Color> := {};
    var B: set<Color> := {};
    var C := SetUnionColor(A, B);
    expect C == {};
  }

  // Test case for combination {1}/BA=0,B=1:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: set<Color> := {};
    var B: set<Color> := {Blue};
    var C := SetUnionColor(A, B);
    expect C == {Color.Blue};
  }

  // Test case for combination {1}/BA=0,B=2:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: set<Color> := {};
    var B: set<Color> := {Red, Blue};
    var C := SetUnionColor(A, B);
    expect C == {Color.Red, Color.Blue};
  }

  // Test case for combination {1}/BA=0,B=3:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: set<Color> := {};
    var B: set<Color> := {Red, White, Blue};
    var C := SetUnionColor(A, B);
    expect C == {Red, White, Blue};
  }

  // Test case for combination {1}/O|C|>=3:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: set<Color> := {Blue};
    var B: set<Color> := {Red, White};
    var C := SetUnionColor(A, B);
    expect C == {Red, White, Blue};
  }

  // Test case for combination {1}/O|C|>=2:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: set<Color> := {White};
    var B: set<Color> := {Red};
    var C := SetUnionColor(A, B);
    expect C == {Color.Red, Color.White};
  }

  // Test case for combination {1}/O|C|>=1:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: set<Color> := {Red};
    var B: set<Color> := {Red, Blue};
    var C := SetUnionColor(A, B);
    expect C == {Color.Red, Color.Blue};
  }

}

method Failing()
{
  // (no failing tests)
}

method Main()
{
  Passing();
  Failing();
}
