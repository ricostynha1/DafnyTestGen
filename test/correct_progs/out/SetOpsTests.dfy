// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\SetOps.dfy
// Method: SetContains
// Generated: 2026-04-23 20:32:27

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


method TestsForSetContains()
{
  // Test case for combination {1}:
  //   PRE:  |S| > 0
  //   POST Q1: r == (x in S)
  {
    var S: set<int> := {2};
    var x := -1;
    var r := SetContains(S, x);
    expect r == false || r == true;
    expect r == false; // observed from implementation
  }

  // Test case for combination {1}/O|S|>=2:
  //   PRE:  |S| > 0
  //   POST Q1: r == (x in S)
  {
    var S: set<int> := {1, 3, 5};
    var x := 2;
    var r := SetContains(S, x);
    expect r == false || r == true;
    expect r == false; // observed from implementation
  }

  // Test case for combination {1}/Ox=0:
  //   PRE:  |S| > 0
  //   POST Q1: r == (x in S)
  {
    var S: set<int> := {-2, -1, 0, 1, 2, 3, 4, 5};
    var x := 0;
    var r := SetContains(S, x);
    expect r == true || r == false;
    expect r == true; // observed from implementation
  }

  // Test case for combination {1}/R4:
  //   PRE:  |S| > 0
  //   POST Q1: r == (x in S)
  {
    var S: set<int> := {-1, 5};
    var x := -1;
    var r := SetContains(S, x);
    expect r == true || r == false;
    expect r == true; // observed from implementation
  }

  // Test case for combination {1}/R5:
  //   PRE:  |S| > 0
  //   POST Q1: r == (x in S)
  {
    var S: set<int> := {5};
    var x := -2;
    var r := SetContains(S, x);
    expect r == false || r == true;
    expect r == false; // observed from implementation
  }

  // Test case for combination {1}/R6:
  //   PRE:  |S| > 0
  //   POST Q1: r == (x in S)
  {
    var S: set<int> := {-2, -1, 0, 1, 2, 3, 4, 5};
    var x := -1;
    var r := SetContains(S, x);
    expect r == true || r == false;
    expect r == true; // observed from implementation
  }

  // Test case for combination {1}/R7:
  //   PRE:  |S| > 0
  //   POST Q1: r == (x in S)
  {
    var S: set<int> := {-2, -1, 0, 1, 2, 3, 4, 5};
    var x := 2;
    var r := SetContains(S, x);
    expect r == true || r == false;
    expect r == true; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   PRE:  |S| > 0
  //   POST Q1: r == (x in S)
  {
    var S: set<int> := {-2, -1, 0, 1, 2, 3, 4, 5};
    var x := -2;
    var r := SetContains(S, x);
    expect r == true || r == false;
    expect r == true; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   PRE:  |S| > 0
  //   POST Q1: r == (x in S)
  {
    var S: set<int> := {-2, -1, 0, 1, 2, 3, 4, 5};
    var x := 3;
    var r := SetContains(S, x);
    expect r == true || r == false;
    expect r == true; // observed from implementation
  }

  // Test case for combination {1}/R10:
  //   PRE:  |S| > 0
  //   POST Q1: r == (x in S)
  {
    var S: set<int> := {0};
    var x := 2;
    var r := SetContains(S, x);
    expect r == false || r == true;
    expect r == false; // observed from implementation
  }

}

method TestsForSetUnion()
{
  // Test case for combination {1}:
  //   POST Q1: C == A + B
  {
    var A: set<int> := {};
    var B: set<int> := {};
    var C := SetUnion(A, B);
    expect C == {};
  }

  // Test case for combination {1}/O|A|=1:
  //   POST Q1: C == A + B
  {
    var A: set<int> := {5};
    var B: set<int> := {5};
    var C := SetUnion(A, B);
    expect C == {5};
  }

  // Test case for combination {1}/O|A|>=2:
  //   POST Q1: C == A + B
  {
    var A: set<int> := {-2, 0, 2, 4};
    var B: set<int> := {0, 1, 2, 3, 4};
    var C := SetUnion(A, B);
    expect C == {-2, 0, 1, 2, 3, 4};
  }

  // Test case for combination {1}/O|B|=1:
  //   POST Q1: C == A + B
  {
    var A: set<int> := {4};
    var B: set<int> := {0};
    var C := SetUnion(A, B);
    expect C == {0, 4};
  }

  // Test case for combination {1}/O|C|=1:
  //   POST Q1: C == A + B
  {
    var A: set<int> := {2};
    var B: set<int> := {2};
    var C := SetUnion(A, B);
    expect C == {2};
  }

  // Test case for combination {1}/R6:
  //   POST Q1: C == A + B
  {
    var A: set<int> := {-1, 1, 3, 4, 5};
    var B: set<int> := {0, 1, 4, 5};
    var C := SetUnion(A, B);
    expect C == {-1, 0, 1, 3, 4, 5};
  }

  // Test case for combination {1}/R7:
  //   POST Q1: C == A + B
  {
    var A: set<int> := {0};
    var B: set<int> := {5};
    var C := SetUnion(A, B);
    expect C == {0, 5};
  }

  // Test case for combination {1}/R8:
  //   POST Q1: C == A + B
  {
    var A: set<int> := {0, 4};
    var B: set<int> := {0, 4};
    var C := SetUnion(A, B);
    expect C == {0, 4};
  }

  // Test case for combination {1}/R9:
  //   POST Q1: C == A + B
  {
    var A: set<int> := {1};
    var B: set<int> := {0, 3, 4};
    var C := SetUnion(A, B);
    expect C == {0, 1, 3, 4};
  }

  // Test case for combination {1}/R10:
  //   POST Q1: C == A + B
  {
    var A: set<int> := {0, 2, 3, 5};
    var B: set<int> := {-1, 1, 5};
    var C := SetUnion(A, B);
    expect C == {-1, 0, 1, 2, 3, 5};
  }

}

method TestsForSetIntersection()
{
  // Test case for combination {1}:
  //   POST Q1: C == A * B
  {
    var A: set<int> := {};
    var B: set<int> := {};
    var C := SetIntersection(A, B);
    expect C == {};
  }

  // Test case for combination {1}/O|A|=1:
  //   POST Q1: C == A * B
  {
    var A: set<int> := {2};
    var B: set<int> := {2};
    var C := SetIntersection(A, B);
    expect C == {2};
  }

  // Test case for combination {1}/O|A|>=2:
  //   POST Q1: C == A * B
  {
    var A: set<int> := {-2, -1, 0, 2, 4};
    var B: set<int> := {-2, -1, 0, 2, 4};
    var C := SetIntersection(A, B);
    expect C == {-2, -1, 0, 2, 4};
  }

  // Test case for combination {1}/R4:
  //   POST Q1: C == A * B
  {
    var A: set<int> := {-2, -1, 5};
    var B: set<int> := {-2, -1, 5};
    var C := SetIntersection(A, B);
    expect C == {-2, -1, 5};
  }

  // Test case for combination {1}/R5:
  //   POST Q1: C == A * B
  {
    var A: set<int> := {5};
    var B: set<int> := {-2, -1, 0, 2, 3};
    var C := SetIntersection(A, B);
    expect C == {};
  }

  // Test case for combination {1}/R6:
  //   POST Q1: C == A * B
  {
    var A: set<int> := {1, 3};
    var B: set<int> := {2, 3, 5};
    var C := SetIntersection(A, B);
    expect C == {3};
  }

  // Test case for combination {1}/R7:
  //   POST Q1: C == A * B
  {
    var A: set<int> := {-2, 0, 5};
    var B: set<int> := {-2, 0, 5};
    var C := SetIntersection(A, B);
    expect C == {-2, 0, 5};
  }

  // Test case for combination {1}/R8:
  //   POST Q1: C == A * B
  {
    var A: set<int> := {-2};
    var B: set<int> := {2, 4, 5};
    var C := SetIntersection(A, B);
    expect C == {};
  }

  // Test case for combination {1}/R9:
  //   POST Q1: C == A * B
  {
    var A: set<int> := {0, 2, 4, 5};
    var B: set<int> := {0, 2, 4, 5};
    var C := SetIntersection(A, B);
    expect C == {0, 2, 4, 5};
  }

  // Test case for combination {1}/R10:
  //   POST Q1: C == A * B
  {
    var A: set<int> := {-2, -1, 0, 1, 2, 5};
    var B: set<int> := {-2, -1, 0, 1, 2, 5};
    var C := SetIntersection(A, B);
    expect C == {-2, -1, 0, 1, 2, 5};
  }

}

method TestsForSetDifference()
{
  // Test case for combination {1}:
  //   POST Q1: C == A - B
  {
    var A: set<int> := {};
    var B: set<int> := {};
    var C := SetDifference(A, B);
    expect C == {};
  }

  // Test case for combination {1}/O|A|=1:
  //   POST Q1: C == A - B
  {
    var A: set<int> := {2};
    var B: set<int> := {2};
    var C := SetDifference(A, B);
    expect C == {};
  }

  // Test case for combination {1}/O|A|>=2:
  //   POST Q1: C == A - B
  {
    var A: set<int> := {-2, -1, 0, 2, 4, 5};
    var B: set<int> := {-2, -1, 0, 2, 4, 5};
    var C := SetDifference(A, B);
    expect C == {};
  }

  // Test case for combination {1}/O|C|=1:
  //   POST Q1: C == A - B
  {
    var A: set<int> := {2};
    var B: set<int> := {-2, 1, 5};
    var C := SetDifference(A, B);
    expect C == {2};
  }

  // Test case for combination {1}/O|C|>=2:
  //   POST Q1: C == A - B
  {
    var A: set<int> := {-2, 2, 4, 5};
    var B: set<int> := {0, 1, 5};
    var C := SetDifference(A, B);
    expect C == {-2, 2, 4};
  }

  // Test case for combination {1}/R6:
  //   POST Q1: C == A - B
  {
    var A: set<int> := {-1, 2, 3, 4};
    var B: set<int> := {0, 3};
    var C := SetDifference(A, B);
    expect C == {-1, 2, 4};
  }

  // Test case for combination {1}/R7:
  //   POST Q1: C == A - B
  {
    var A: set<int> := {-2, 0, 1};
    var B: set<int> := {-2, 0, 3};
    var C := SetDifference(A, B);
    expect C == {1};
  }

  // Test case for combination {1}/R8:
  //   POST Q1: C == A - B
  {
    var A: set<int> := {-1, 0, 1};
    var B: set<int> := {1, 2};
    var C := SetDifference(A, B);
    expect C == {-1, 0};
  }

  // Test case for combination {1}/R9:
  //   POST Q1: C == A - B
  {
    var A: set<int> := {-2, -1, 0, 1, 2, 4};
    var B: set<int> := {2, 3};
    var C := SetDifference(A, B);
    expect C == {-2, -1, 0, 1, 4};
  }

  // Test case for combination {1}/R10:
  //   POST Q1: C == A - B
  {
    var A: set<int> := {0, 2, 3};
    var B: set<int> := {0, 3};
    var C := SetDifference(A, B);
    expect C == {2};
  }

}

method TestsForSetSubset()
{
  // Test case for combination P{1}/{1}:
  //   PRE:  A <= B || !(A <= B)
  //   POST Q1: r == (A <= B)
  {
    var A: set<int> := {};
    var B: set<int> := {};
    var r := SetSubset(A, B);
    expect r == true;
  }

  // Test case for combination P{2}/{1}:
  //   PRE:  A <= B || !(A <= B)
  //   POST Q1: r == (A <= B)
  {
    var A: set<int> := {-2};
    var B: set<int> := {2};
    var r := SetSubset(A, B);
    expect r == false;
  }

  // Test case for combination P{1}/{1}/O|A|=1:
  //   PRE:  A <= B || !(A <= B)
  //   POST Q1: r == (A <= B)
  {
    var A: set<int> := {5};
    var B: set<int> := {5};
    var r := SetSubset(A, B);
    expect r == true;
  }

  // Test case for combination P{1}/{1}/O|A|>=2:
  //   PRE:  A <= B || !(A <= B)
  //   POST Q1: r == (A <= B)
  {
    var A: set<int> := {1, 2};
    var B: set<int> := {1, 2, 5};
    var r := SetSubset(A, B);
    expect r == true;
  }

  // Test case for combination P{2}/{1}/O|A|>=2:
  //   PRE:  A <= B || !(A <= B)
  //   POST Q1: r == (A <= B)
  {
    var A: set<int> := {-2, 3, 4};
    var B: set<int> := {};
    var r := SetSubset(A, B);
    expect r == false;
  }

  // Test case for combination P{2}/{1}/O|B|>=2:
  //   PRE:  A <= B || !(A <= B)
  //   POST Q1: r == (A <= B)
  {
    var A: set<int> := {1};
    var B: set<int> := {-1, 0, 3, 4, 5};
    var r := SetSubset(A, B);
    expect r == false;
  }

  // Test case for combination P{1}/{1}/R4:
  //   PRE:  A <= B || !(A <= B)
  //   POST Q1: r == (A <= B)
  {
    var A: set<int> := {0, 3};
    var B: set<int> := {0, 1, 2, 3};
    var r := SetSubset(A, B);
    expect r == true;
  }

  // Test case for combination P{1}/{1}/R5:
  //   PRE:  A <= B || !(A <= B)
  //   POST Q1: r == (A <= B)
  {
    var A: set<int> := {};
    var B: set<int> := {0, 3};
    var r := SetSubset(A, B);
    expect r == true;
  }

  // Test case for combination P{1}/{1}/R6:
  //   PRE:  A <= B || !(A <= B)
  //   POST Q1: r == (A <= B)
  {
    var A: set<int> := {2, 5};
    var B: set<int> := {1, 2, 5};
    var r := SetSubset(A, B);
    expect r == true;
  }

  // Test case for combination P{1}/{1}/R7:
  //   PRE:  A <= B || !(A <= B)
  //   POST Q1: r == (A <= B)
  {
    var A: set<int> := {0};
    var B: set<int> := {0, 1};
    var r := SetSubset(A, B);
    expect r == true;
  }

}

method TestsForAllPositive()
{
  // Test case for combination {1}:
  //   POST Q1: r == forall x: int :: x in S ==> x > 0
  {
    var S: set<int> := {};
    var r := AllPositive(S);
    expect r == true || r == false;
    expect r == true; // observed from implementation
  }

  // Test case for combination {1}/O|S|=1:
  //   POST Q1: r == forall x: int :: x in S ==> x > 0
  {
    var S: set<int> := {3};
    var r := AllPositive(S);
    expect r == true;
  }

  // Test case for combination {1}/O|S|>=2:
  //   POST Q1: r == forall x: int :: x in S ==> x > 0
  {
    var S: set<int> := {-2, 2};
    var r := AllPositive(S);
    expect r == false;
  }

  // Test case for combination {1}/R4:
  //   POST Q1: r == forall x: int :: x in S ==> x > 0
  {
    var S: set<int> := {2, 5};
    var r := AllPositive(S);
    expect r == true;
  }

  // Test case for combination {1}/R5:
  //   POST Q1: r == forall x: int :: x in S ==> x > 0
  {
    var S: set<int> := {1, 4};
    var r := AllPositive(S);
    expect r == true;
  }

  // Test case for combination {1}/R6:
  //   POST Q1: r == forall x: int :: x in S ==> x > 0
  {
    var S: set<int> := {1, 2, 4, 5};
    var r := AllPositive(S);
    expect r == true;
  }

  // Test case for combination {1}/R7:
  //   POST Q1: r == forall x: int :: x in S ==> x > 0
  {
    var S: set<int> := {-2, 1, 2};
    var r := AllPositive(S);
    expect r == false;
  }

  // Test case for combination {1}/R8:
  //   POST Q1: r == forall x: int :: x in S ==> x > 0
  {
    var S: set<int> := {-2, 4, 5};
    var r := AllPositive(S);
    expect r == false;
  }

  // Test case for combination {1}/R9:
  //   POST Q1: r == forall x: int :: x in S ==> x > 0
  {
    var S: set<int> := {0, 3, 5};
    var r := AllPositive(S);
    expect r == false;
  }

  // Test case for combination {1}/R10:
  //   POST Q1: r == forall x: int :: x in S ==> x > 0
  {
    var S: set<int> := {-2, 1, 4};
    var r := AllPositive(S);
    expect r == false;
  }

}

method TestsForHasZero()
{
  // Test case for combination {1}:
  //   POST Q1: r == exists x: int :: x in S && x == 0
  {
    var S: set<int> := {};
    var r := HasZero(S);
    expect r == false || r == true;
    expect r == false; // observed from implementation
  }

  // Test case for combination {1}/O|S|=1:
  //   POST Q1: r == exists x: int :: x in S && x == 0
  {
    var S: set<int> := {2};
    var r := HasZero(S);
    expect r == false;
  }

  // Test case for combination {1}/O|S|>=2:
  //   POST Q1: r == exists x: int :: x in S && x == 0
  {
    var S: set<int> := {3, 4};
    var r := HasZero(S);
    expect r == false || r == true;
    expect r == false; // observed from implementation
  }

  // Test case for combination {1}/Or=true:
  //   POST Q1: r == exists x: int :: x in S && x == 0
  {
    var S: set<int> := {0, 1, 2};
    var r := HasZero(S);
    expect r == true || r == false;
    expect r == true; // observed from implementation
  }

  // Test case for combination {1}/R5:
  //   POST Q1: r == exists x: int :: x in S && x == 0
  {
    var S: set<int> := {2, 3, 5};
    var r := HasZero(S);
    expect r == false;
  }

  // Test case for combination {1}/R6:
  //   POST Q1: r == exists x: int :: x in S && x == 0
  {
    var S: set<int> := {0, 1, 2, 3, 4};
    var r := HasZero(S);
    expect r == true;
  }

  // Test case for combination {1}/R7:
  //   POST Q1: r == exists x: int :: x in S && x == 0
  {
    var S: set<int> := {1, 3, 5};
    var r := HasZero(S);
    expect r == false;
  }

  // Test case for combination {1}/R8:
  //   POST Q1: r == exists x: int :: x in S && x == 0
  {
    var S: set<int> := {1, 3, 4};
    var r := HasZero(S);
    expect r == false;
  }

  // Test case for combination {1}/R9:
  //   POST Q1: r == exists x: int :: x in S && x == 0
  {
    var S: set<int> := {0, 2, 3, 4};
    var r := HasZero(S);
    expect r == true;
  }

  // Test case for combination {1}/R10:
  //   POST Q1: r == exists x: int :: x in S && x == 0
  {
    var S: set<int> := {-1};
    var r := HasZero(S);
    expect r == false || r == true;
    expect r == false; // observed from implementation
  }

}

method TestsForSubsetForall()
{
  // Test case for combination {1}:
  //   POST Q1: r == forall x: int :: x in A ==> x in B
  {
    var A: set<int> := {};
    var B: set<int> := {};
    var r := SubsetForall(A, B);
    expect r == true || r == false;
    expect r == true; // observed from implementation
  }

  // Test case for combination {1}/O|A|=1:
  //   POST Q1: r == forall x: int :: x in A ==> x in B
  {
    var A: set<int> := {2};
    var B: set<int> := {2};
    var r := SubsetForall(A, B);
    expect r == true || r == false;
    expect r == true; // observed from implementation
  }

  // Test case for combination {1}/O|A|>=2:
  //   POST Q1: r == forall x: int :: x in A ==> x in B
  {
    var A: set<int> := {-1, 1, 2, 4, 5};
    var B: set<int> := {-1, 1, 2, 4, 5};
    var r := SubsetForall(A, B);
    expect r == true;
  }

  // Test case for combination {1}/Or=false:
  //   POST Q1: r == forall x: int :: x in A ==> x in B
  {
    var A: set<int> := {-2, 4};
    var B: set<int> := {-1, 1, 2};
    var r := SubsetForall(A, B);
    expect r == false || r == true;
    expect r == false; // observed from implementation
  }

  // Test case for combination {1}/R5:
  //   POST Q1: r == forall x: int :: x in A ==> x in B
  {
    var A: set<int> := {-2, 1, 5};
    var B: set<int> := {-2, 0, 2, 3};
    var r := SubsetForall(A, B);
    expect r == false;
  }

  // Test case for combination {1}/R6:
  //   POST Q1: r == forall x: int :: x in A ==> x in B
  {
    var A: set<int> := {-2, 0, 4};
    var B: set<int> := {-2, 0, 4};
    var r := SubsetForall(A, B);
    expect r == true || r == false;
    expect r == true; // observed from implementation
  }

  // Test case for combination {1}/R7:
  //   POST Q1: r == forall x: int :: x in A ==> x in B
  {
    var A: set<int> := {-2, 1, 4};
    var B: set<int> := {-2, 3};
    var r := SubsetForall(A, B);
    expect r == false;
  }

  // Test case for combination {1}/R8:
  //   POST Q1: r == forall x: int :: x in A ==> x in B
  {
    var A: set<int> := {-2, -1, 1};
    var B: set<int> := {-2, -1, 1};
    var r := SubsetForall(A, B);
    expect r == true || r == false;
    expect r == true; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   POST Q1: r == forall x: int :: x in A ==> x in B
  {
    var A: set<int> := {-1, 3, 4};
    var B: set<int> := {-2, 1, 3};
    var r := SubsetForall(A, B);
    expect r == false;
  }

  // Test case for combination {1}/R10:
  //   POST Q1: r == forall x: int :: x in A ==> x in B
  {
    var A: set<int> := {-1, 1, 2};
    var B: set<int> := {-2, 0, 1, 3};
    var r := SubsetForall(A, B);
    expect r == false;
  }

}

method TestsForAddElement()
{
  // Test case for combination {1}:
  //   POST Q1: C == S + {x}
  {
    var S: set<int> := {};
    var x := -1;
    var C := AddElement(S, x);
    expect C == {-1};
  }

  // Test case for combination {1}/O|S|=1:
  //   POST Q1: C == S + {x}
  {
    var S: set<int> := {4};
    var x := 2;
    var C := AddElement(S, x);
    expect C == {2, 4};
  }

  // Test case for combination {1}/O|S|>=2:
  //   POST Q1: C == S + {x}
  {
    var S: set<int> := {-1, 1, 2, 3, 5};
    var x := -2;
    var C := AddElement(S, x);
    expect C == {-2, -1, 1, 2, 3, 5};
  }

  // Test case for combination {1}/Ox=0:
  //   POST Q1: C == S + {x}
  {
    var S: set<int> := {};
    var x := 0;
    var C := AddElement(S, x);
    expect C == {0};
  }

  // Test case for combination {1}/R5:
  //   POST Q1: C == S + {x}
  {
    var S: set<int> := {};
    var x := 3;
    var C := AddElement(S, x);
    expect C == {3};
  }

  // Test case for combination {1}/R6:
  //   POST Q1: C == S + {x}
  {
    var S: set<int> := {-2, 1, 3, 5};
    var x := -1;
    var C := AddElement(S, x);
    expect C == {-2, -1, 1, 3, 5};
  }

  // Test case for combination {1}/R7:
  //   POST Q1: C == S + {x}
  {
    var S: set<int> := {-2, 0, 1, 2, 3, 4, 5};
    var x := -2;
    var C := AddElement(S, x);
    expect C == {-2, 0, 1, 2, 3, 4, 5};
  }

  // Test case for combination {1}/R8:
  //   POST Q1: C == S + {x}
  {
    var S: set<int> := {-1, 0, 3};
    var x := -1;
    var C := AddElement(S, x);
    expect C == {-1, 0, 3};
  }

  // Test case for combination {1}/R9:
  //   POST Q1: C == S + {x}
  {
    var S: set<int> := {-1, 0, 1, 2, 3, 4};
    var x := -1;
    var C := AddElement(S, x);
    expect C == {-1, 0, 1, 2, 3, 4};
  }

  // Test case for combination {1}/R10:
  //   POST Q1: C == S + {x}
  {
    var S: set<int> := {-1, 0, 1, 2, 3, 4, 5};
    var x := -1;
    var C := AddElement(S, x);
    expect C == {-1, 0, 1, 2, 3, 4, 5};
  }

}

method TestsForRemoveElement()
{
  // Test case for combination {1}:
  //   PRE:  x in S
  //   POST Q1: C == S - {x}
  {
    var S: set<int> := {-2};
    var x := -2;
    var C := RemoveElement(S, x);
    expect C == {};
  }

  // Test case for combination {1}/O|S|>=2:
  //   PRE:  x in S
  //   POST Q1: C == S - {x}
  {
    var S: set<int> := {-2, -1, 4};
    var x := -2;
    var C := RemoveElement(S, x);
    expect C == {-1, 4};
  }

  // Test case for combination {1}/Ox=0:
  //   PRE:  x in S
  //   POST Q1: C == S - {x}
  {
    var S: set<int> := {0};
    var x := 0;
    var C := RemoveElement(S, x);
    expect C == {};
  }

  // Test case for combination {1}/Ox>0:
  //   PRE:  x in S
  //   POST Q1: C == S - {x}
  {
    var S: set<int> := {5};
    var x := 5;
    var C := RemoveElement(S, x);
    expect C == {};
  }

  // Test case for combination {1}/O|C|=1:
  //   PRE:  x in S
  //   POST Q1: C == S - {x}
  {
    var S: set<int> := {2, 3};
    var x := 2;
    var C := RemoveElement(S, x);
    expect C == {3};
  }

  // Test case for combination {1}/R6:
  //   PRE:  x in S
  //   POST Q1: C == S - {x}
  {
    var S: set<int> := {0, 2, 4, 5};
    var x := 4;
    var C := RemoveElement(S, x);
    expect C == {0, 2, 5};
  }

  // Test case for combination {1}/R7:
  //   PRE:  x in S
  //   POST Q1: C == S - {x}
  {
    var S: set<int> := {-2, -1, 0, 1, 3, 4};
    var x := -2;
    var C := RemoveElement(S, x);
    expect C == {-1, 0, 1, 3, 4};
  }

  // Test case for combination {1}/R8:
  //   PRE:  x in S
  //   POST Q1: C == S - {x}
  {
    var S: set<int> := {-2, 0, 1, 3, 5};
    var x := -2;
    var C := RemoveElement(S, x);
    expect C == {0, 1, 3, 5};
  }

  // Test case for combination {1}/R9:
  //   PRE:  x in S
  //   POST Q1: C == S - {x}
  {
    var S: set<int> := {-2, -1, 1, 3, 4};
    var x := -2;
    var C := RemoveElement(S, x);
    expect C == {-1, 1, 3, 4};
  }

  // Test case for combination {1}/R10:
  //   PRE:  x in S
  //   POST Q1: C == S - {x}
  {
    var S: set<int> := {-2, -1, 1, 3};
    var x := -2;
    var C := RemoveElement(S, x);
    expect C == {-1, 1, 3};
  }

}

method TestsForSetContainsNat()
{
  // Test case for combination {1}:
  //   PRE:  |S| > 0
  //   POST Q1: r == (x in S)
  {
    var S: set<nat> := {1, 2, 3, 4, 5, 6, 7};
    var x := 10;
    var r := SetContainsNat(S, x);
    expect r == false;
  }

  // Test case for combination {1}/Bx=0:
  //   PRE:  |S| > 0
  //   POST Q1: r == (x in S)
  {
    var S: set<nat> := {0, 1, 2, 3, 4, 5, 6, 7};
    var x := 0;
    var r := SetContainsNat(S, x);
    expect r == true || r == false;
    expect r == true; // observed from implementation
  }

  // Test case for combination {1}/Bx=1:
  //   PRE:  |S| > 0
  //   POST Q1: r == (x in S)
  {
    var S: set<nat> := {0, 1, 2, 3, 4, 5, 6, 7};
    var x := 1;
    var r := SetContainsNat(S, x);
    expect r == true || r == false;
    expect r == true; // observed from implementation
  }

  // Test case for combination {1}/O|S|=1:
  //   PRE:  |S| > 0
  //   POST Q1: r == (x in S)
  {
    var S: set<nat> := {7};
    var x := 2;
    var r := SetContainsNat(S, x);
    expect r == false || r == true;
    expect r == false; // observed from implementation
  }

  // Test case for combination {1}/R5:
  //   PRE:  |S| > 0
  //   POST Q1: r == (x in S)
  {
    var S: set<nat> := {0, 1, 2, 3, 4, 5, 6, 7};
    var x := 3;
    var r := SetContainsNat(S, x);
    expect r == true || r == false;
    expect r == true; // observed from implementation
  }

  // Test case for combination {1}/R6:
  //   PRE:  |S| > 0
  //   POST Q1: r == (x in S)
  {
    var S: set<nat> := {0, 1, 2, 3, 4, 5, 6, 7};
    var x := 4;
    var r := SetContainsNat(S, x);
    expect r == true || r == false;
    expect r == true; // observed from implementation
  }

  // Test case for combination {1}/R7:
  //   PRE:  |S| > 0
  //   POST Q1: r == (x in S)
  {
    var S: set<nat> := {0};
    var x := 5;
    var r := SetContainsNat(S, x);
    expect r == false || r == true;
    expect r == false; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   PRE:  |S| > 0
  //   POST Q1: r == (x in S)
  {
    var S: set<nat> := {6};
    var x := 6;
    var r := SetContainsNat(S, x);
    expect r == true || r == false;
    expect r == true; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   PRE:  |S| > 0
  //   POST Q1: r == (x in S)
  {
    var S: set<nat> := {0, 1, 2, 3, 4, 5, 6, 7};
    var x := 7;
    var r := SetContainsNat(S, x);
    expect r == true || r == false;
    expect r == true; // observed from implementation
  }

  // Test case for combination {1}/R10:
  //   PRE:  |S| > 0
  //   POST Q1: r == (x in S)
  {
    var S: set<nat> := {0, 1, 2, 3, 4, 5, 6, 7};
    var x := 6;
    var r := SetContainsNat(S, x);
    expect r == true || r == false;
    expect r == true; // observed from implementation
  }

}

method TestsForSetUnionNat()
{
  // Test case for combination {1}:
  //   POST Q1: C == A + B
  {
    var A: set<nat> := {};
    var B: set<nat> := {};
    var C := SetUnionNat(A, B);
    expect C == {};
  }

  // Test case for combination {1}/O|A|=1:
  //   POST Q1: C == A + B
  {
    var A: set<nat> := {4};
    var B: set<nat> := {4};
    var C := SetUnionNat(A, B);
    expect C == {4};
  }

  // Test case for combination {1}/O|A|>=2:
  //   POST Q1: C == A + B
  {
    var A: set<nat> := {0, 6, 7};
    var B: set<nat> := {0, 6, 7};
    var C := SetUnionNat(A, B);
    expect C == {0, 6, 7};
  }

  // Test case for combination {1}/R4:
  //   POST Q1: C == A + B
  {
    var A: set<nat> := {0, 1, 2, 3, 4, 5, 6, 7};
    var B: set<nat> := {};
    var C := SetUnionNat(A, B);
    expect C == {0, 1, 2, 3, 4, 5, 6, 7};
  }

  // Test case for combination {1}/R5:
  //   POST Q1: C == A + B
  {
    var A: set<nat> := {4, 5, 7};
    var B: set<nat> := {7};
    var C := SetUnionNat(A, B);
    expect C == {4, 5, 7};
  }

  // Test case for combination {1}/R6:
  //   POST Q1: C == A + B
  {
    var A: set<nat> := {3, 4, 5};
    var B: set<nat> := {0, 4, 5, 6};
    var C := SetUnionNat(A, B);
    expect C == {0, 3, 4, 5, 6};
  }

  // Test case for combination {1}/R7:
  //   POST Q1: C == A + B
  {
    var A: set<nat> := {0, 3, 4};
    var B: set<nat> := {3, 6, 7};
    var C := SetUnionNat(A, B);
    expect C == {0, 3, 4, 6, 7};
  }

  // Test case for combination {1}/R8:
  //   POST Q1: C == A + B
  {
    var A: set<nat> := {5};
    var B: set<nat> := {5};
    var C := SetUnionNat(A, B);
    expect C == {5};
  }

  // Test case for combination {1}/R9:
  //   POST Q1: C == A + B
  {
    var A: set<nat> := {0, 2, 3, 6};
    var B: set<nat> := {3, 5};
    var C := SetUnionNat(A, B);
    expect C == {0, 2, 3, 5, 6};
  }

  // Test case for combination {1}/R10:
  //   POST Q1: C == A + B
  {
    var A: set<nat> := {6};
    var B: set<nat> := {4, 5};
    var C := SetUnionNat(A, B);
    expect C == {4, 5, 6};
  }

}

method TestsForSetContainsChar()
{
  // Test case for combination {1}:
  //   PRE:  |S| > 0
  //   POST Q1: r == (c in S)
  {
    var S: set<char> := {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'};
    var c := 'v';
    var r := SetContainsChar(S, c);
    expect r == false;
  }

  // Test case for combination {1}/O|S|=1:
  //   PRE:  |S| > 0
  //   POST Q1: r == (c in S)
  {
    var S: set<char> := {'d'};
    var c := 'v';
    var r := SetContainsChar(S, c);
    expect r == false;
  }

  // Test case for combination {1}/Or=true:
  //   PRE:  |S| > 0
  //   POST Q1: r == (c in S)
  {
    var S: set<char> := {'c', 'd', 'h'};
    var c := 'h';
    var r := SetContainsChar(S, c);
    expect r == true || r == false;
    expect r == true; // observed from implementation
  }

  // Test case for combination {1}/R4:
  //   PRE:  |S| > 0
  //   POST Q1: r == (c in S)
  {
    var S: set<char> := {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'};
    var c := 'g';
    var r := SetContainsChar(S, c);
    expect r == true || r == false;
    expect r == true; // observed from implementation
  }

  // Test case for combination {1}/R5:
  //   PRE:  |S| > 0
  //   POST Q1: r == (c in S)
  {
    var S: set<char> := {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'};
    var c := 'f';
    var r := SetContainsChar(S, c);
    expect r == true || r == false;
    expect r == true; // observed from implementation
  }

  // Test case for combination {1}/R6:
  //   PRE:  |S| > 0
  //   POST Q1: r == (c in S)
  {
    var S: set<char> := {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'};
    var c := 'e';
    var r := SetContainsChar(S, c);
    expect r == true || r == false;
    expect r == true; // observed from implementation
  }

  // Test case for combination {1}/R7:
  //   PRE:  |S| > 0
  //   POST Q1: r == (c in S)
  {
    var S: set<char> := {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'};
    var c := 'd';
    var r := SetContainsChar(S, c);
    expect r == true || r == false;
    expect r == true; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   PRE:  |S| > 0
  //   POST Q1: r == (c in S)
  {
    var S: set<char> := {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'};
    var c := 'c';
    var r := SetContainsChar(S, c);
    expect r == true || r == false;
    expect r == true; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   PRE:  |S| > 0
  //   POST Q1: r == (c in S)
  {
    var S: set<char> := {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'};
    var c := 'b';
    var r := SetContainsChar(S, c);
    expect r == true || r == false;
    expect r == true; // observed from implementation
  }

  // Test case for combination {1}/R10:
  //   PRE:  |S| > 0
  //   POST Q1: r == (c in S)
  {
    var S: set<char> := {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'};
    var c := 'a';
    var r := SetContainsChar(S, c);
    expect r == true || r == false;
    expect r == true; // observed from implementation
  }

}

method TestsForSetUnionChar()
{
  // Test case for combination {1}:
  //   POST Q1: C == A + B
  {
    var A: set<char> := {};
    var B: set<char> := {};
    var C := SetUnionChar(A, B);
    expect C == {};
  }

  // Test case for combination {1}/O|A|=1:
  //   POST Q1: C == A + B
  {
    var A: set<char> := {'c'};
    var B: set<char> := {'c'};
    var C := SetUnionChar(A, B);
    expect C == {'c'};
  }

  // Test case for combination {1}/O|A|>=2:
  //   POST Q1: C == A + B
  {
    var A: set<char> := {'a', 'c', 'd', 'g', 'h'};
    var B: set<char> := {'c', 'f'};
    var C := SetUnionChar(A, B);
    expect C == {'a', 'c', 'd', 'f', 'g', 'h'};
  }

  // Test case for combination {1}/O|B|=1:
  //   POST Q1: C == A + B
  {
    var A: set<char> := {'g'};
    var B: set<char> := {'g'};
    var C := SetUnionChar(A, B);
    expect C == {'g'};
  }

  // Test case for combination {1}/O|C|=1:
  //   POST Q1: C == A + B
  {
    var A: set<char> := {'g'};
    var B: set<char> := {};
    var C := SetUnionChar(A, B);
    expect C == {'g'};
  }

  // Test case for combination {1}/R6:
  //   POST Q1: C == A + B
  {
    var A: set<char> := {'c', 'e', 'f'};
    var B: set<char> := {'c', 'd', 'e', 'f', 'h'};
    var C := SetUnionChar(A, B);
    expect C == {'c', 'd', 'e', 'f', 'h'};
  }

  // Test case for combination {1}/R7:
  //   POST Q1: C == A + B
  {
    var A: set<char> := {'c', 'e', 'f'};
    var B: set<char> := {'b', 'e', 'f', 'h'};
    var C := SetUnionChar(A, B);
    expect C == {'b', 'c', 'e', 'f', 'h'};
  }

  // Test case for combination {1}/R8:
  //   POST Q1: C == A + B
  {
    var A: set<char> := {'a', 'b'};
    var B: set<char> := {'a', 'b'};
    var C := SetUnionChar(A, B);
    expect C == {'a', 'b'};
  }

  // Test case for combination {1}/R9:
  //   POST Q1: C == A + B
  {
    var A: set<char> := {'d', 'e', 'g'};
    var B: set<char> := {'d', 'e', 'g'};
    var C := SetUnionChar(A, B);
    expect C == {'d', 'e', 'g'};
  }

  // Test case for combination {1}/R10:
  //   POST Q1: C == A + B
  {
    var A: set<char> := {'e', 'f', 'g', 'h'};
    var B: set<char> := {'e', 'f', 'g', 'h'};
    var C := SetUnionChar(A, B);
    expect C == {'e', 'f', 'g', 'h'};
  }

}

method TestsForSetContainsColor()
{
  // Test case for combination {1}:
  //   PRE:  |S| > 0
  //   POST Q1: r == (c in S)
  {
    var S: set<Color> := {Red, White, Blue};
    var c := Blue;
    var r := SetContainsColor(S, c);
    expect r == true || r == false;
    expect c == Color.Blue; // observed from implementation
    expect r == true; // observed from implementation
  }

  // Test case for combination {1}/O|S|=1:
  //   PRE:  |S| > 0
  //   POST Q1: r == (c in S)
  {
    var S: set<Color> := {Blue};
    var c := Blue;
    var r := SetContainsColor(S, c);
    expect r == true || r == false;
    expect c == Color.Blue; // observed from implementation
    expect r == true; // observed from implementation
  }

  // Test case for combination {1}/Oc=Red:
  //   PRE:  |S| > 0
  //   POST Q1: r == (c in S)
  {
    var S: set<Color> := {Red, White, Blue};
    var c := Red;
    var r := SetContainsColor(S, c);
    expect r == true || r == false;
    expect c == Color.Red; // observed from implementation
    expect r == true; // observed from implementation
  }

  // Test case for combination {1}/Oc=White:
  //   PRE:  |S| > 0
  //   POST Q1: r == (c in S)
  {
    var S: set<Color> := {Red, White, Blue};
    var c := White;
    var r := SetContainsColor(S, c);
    expect r == true || r == false;
    expect c == Color.White; // observed from implementation
    expect r == true; // observed from implementation
  }

  // Test case for combination {1}/Or=false:
  //   PRE:  |S| > 0
  //   POST Q1: r == (c in S)
  {
    var S: set<Color> := {Blue};
    var c := Red;
    var r := SetContainsColor(S, c);
    expect r == false || r == true;
    expect c == Color.Red; // observed from implementation
    expect r == false; // observed from implementation
  }

  // Test case for combination {1}/R6:
  //   PRE:  |S| > 0
  //   POST Q1: r == (c in S)
  {
    var S: set<Color> := {Red};
    var c := Blue;
    var r := SetContainsColor(S, c);
    expect r == false || r == true;
    expect c == Color.Blue; // observed from implementation
    expect r == false; // observed from implementation
  }

  // Test case for combination {1}/R7:
  //   PRE:  |S| > 0
  //   POST Q1: r == (c in S)
  {
    var S: set<Color> := {Red, Blue};
    var c := Blue;
    var r := SetContainsColor(S, c);
    expect r == true || r == false;
    expect c == Color.Blue; // observed from implementation
    expect r == true; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   PRE:  |S| > 0
  //   POST Q1: r == (c in S)
  {
    var S: set<Color> := {Red, Blue};
    var c := Red;
    var r := SetContainsColor(S, c);
    expect r == true || r == false;
    expect c == Color.Red; // observed from implementation
    expect r == true; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   PRE:  |S| > 0
  //   POST Q1: r == (c in S)
  {
    var S: set<Color> := {Red, Blue};
    var c := White;
    var r := SetContainsColor(S, c);
    expect r == false || r == true;
    expect c == Color.White; // observed from implementation
    expect r == false; // observed from implementation
  }

  // Test case for combination {1}/R10:
  //   PRE:  |S| > 0
  //   POST Q1: r == (c in S)
  {
    var S: set<Color> := {Blue};
    var c := White;
    var r := SetContainsColor(S, c);
    expect r == false || r == true;
    expect c == Color.White; // observed from implementation
    expect r == false; // observed from implementation
  }

}

method TestsForSetUnionColor()
{
  // Test case for combination {1}:
  //   POST Q1: C == A + B
  {
    var A: set<Color> := {};
    var B: set<Color> := {};
    var C := SetUnionColor(A, B);
    expect C == {};
  }

  // Test case for combination {1}/O|A|=1:
  //   POST Q1: C == A + B
  {
    var A: set<Color> := {Blue};
    var B: set<Color> := {Blue};
    var C := SetUnionColor(A, B);
    expect C == {Color.Blue};
  }

  // Test case for combination {1}/O|A|>=2:
  //   POST Q1: C == A + B
  {
    var A: set<Color> := {White, Blue};
    var B: set<Color> := {White};
    var C := SetUnionColor(A, B);
    expect C == {Color.White, Color.Blue};
  }

  // Test case for combination {1}/O|B|>=2:
  //   POST Q1: C == A + B
  {
    var A: set<Color> := {Red, White};
    var B: set<Color> := {Red, White};
    var C := SetUnionColor(A, B);
    expect C == {Color.Red, Color.White};
  }

  // Test case for combination {1}/R5:
  //   POST Q1: C == A + B
  {
    var A: set<Color> := {Red, Blue};
    var B: set<Color> := {White};
    var C := SetUnionColor(A, B);
    expect C == {Color.Red, Color.White, Color.Blue};
  }

  // Test case for combination {1}/R6:
  //   POST Q1: C == A + B
  {
    var A: set<Color> := {Red, White, Blue};
    var B: set<Color> := {White};
    var C := SetUnionColor(A, B);
    expect C == {Color.Red, Color.White, Color.Blue};
  }

  // Test case for combination {1}/R7:
  //   POST Q1: C == A + B
  {
    var A: set<Color> := {};
    var B: set<Color> := {White};
    var C := SetUnionColor(A, B);
    expect C == {Color.White};
  }

  // Test case for combination {1}/R8:
  //   POST Q1: C == A + B
  {
    var A: set<Color> := {Blue};
    var B: set<Color> := {White};
    var C := SetUnionColor(A, B);
    expect C == {Color.White, Color.Blue};
  }

  // Test case for combination {1}/R9:
  //   POST Q1: C == A + B
  {
    var A: set<Color> := {Red};
    var B: set<Color> := {White};
    var C := SetUnionColor(A, B);
    expect C == {Color.Red, Color.White};
  }

  // Test case for combination {1}/R10:
  //   POST Q1: C == A + B
  {
    var A: set<Color> := {Red, White};
    var B: set<Color> := {White};
    var C := SetUnionColor(A, B);
    expect C == {Color.Red, Color.White};
  }

}

method Main()
{
  TestsForSetContains();
  print "TestsForSetContains: all non-failing tests passed!\n";
  TestsForSetUnion();
  print "TestsForSetUnion: all non-failing tests passed!\n";
  TestsForSetIntersection();
  print "TestsForSetIntersection: all non-failing tests passed!\n";
  TestsForSetDifference();
  print "TestsForSetDifference: all non-failing tests passed!\n";
  TestsForSetSubset();
  print "TestsForSetSubset: all non-failing tests passed!\n";
  TestsForAllPositive();
  print "TestsForAllPositive: all non-failing tests passed!\n";
  TestsForHasZero();
  print "TestsForHasZero: all non-failing tests passed!\n";
  TestsForSubsetForall();
  print "TestsForSubsetForall: all non-failing tests passed!\n";
  TestsForAddElement();
  print "TestsForAddElement: all non-failing tests passed!\n";
  TestsForRemoveElement();
  print "TestsForRemoveElement: all non-failing tests passed!\n";
  TestsForSetContainsNat();
  print "TestsForSetContainsNat: all non-failing tests passed!\n";
  TestsForSetUnionNat();
  print "TestsForSetUnionNat: all non-failing tests passed!\n";
  TestsForSetContainsChar();
  print "TestsForSetContainsChar: all non-failing tests passed!\n";
  TestsForSetUnionChar();
  print "TestsForSetUnionChar: all non-failing tests passed!\n";
  TestsForSetContainsColor();
  print "TestsForSetContainsColor: all non-failing tests passed!\n";
  TestsForSetUnionColor();
  print "TestsForSetUnionColor: all non-failing tests passed!\n";
}
