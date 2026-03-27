// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\SetOps.dfy
// Method: SetContains
// Generated: 2026-03-27 19:24:54

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
  ensures x in C
  ensures forall y :: y in S ==> y in C
{
  C := S + {x};
}

method RemoveElement(S: set<int>, x: int) returns (C: set<int>)
  requires x in S
  ensures C == S - {x}
  ensures x !in C
  ensures forall y :: y in S && y != x ==> y in C
{
  C := S - {x};
}


method GeneratedTests_SetContains()
{
  // Test case for combination {1}:
  //   PRE:  |S| > 0
  //   POST: r == (x in S)
  {
    var S: set<int> := {0, 1, 2, 3, 4, 5, 6};
    var x := 0;
    var r := SetContains(S, x);
    expect r == true;
  }

  // Test case for combination {1}:
  //   PRE:  |S| > 0
  //   POST: r == (x in S)
  {
    var S: set<int> := {0, 1, 2, 3, 4, 5, 6, 7};
    var x := 1;
    var r := SetContains(S, x);
    expect r == true;
  }

  // Test case for combination {1}/BS=1,x=0:
  //   PRE:  |S| > 0
  //   POST: r == (x in S)
  {
    var S: set<int> := {0};
    var x := 0;
    var r := SetContains(S, x);
    expect r == true;
  }

  // Test case for combination {1}/BS=1,x=1:
  //   PRE:  |S| > 0
  //   POST: r == (x in S)
  {
    var S: set<int> := {0};
    var x := 1;
    var r := SetContains(S, x);
    expect r == false;
  }

}

method GeneratedTests_SetUnion()
{
  // Test case for combination {1}:
  //   POST: C == A + B
  {
    var A: set<int> := {};
    var B: set<int> := {};
    var C := SetUnion(A, B);
    expect C == {};
  }

  // Test case for combination {1}:
  //   POST: C == A + B
  {
    var A: set<int> := {2, 3, 4, 6};
    var B: set<int> := {2, 3, 4, 6};
    var C := SetUnion(A, B);
    expect C == {2, 3, 4, 6};
  }

  // Test case for combination {1}/BA=3,B=1:
  //   POST: C == A + B
  {
    var A: set<int> := {0, 2, 5};
    var B: set<int> := {7};
    var C := SetUnion(A, B);
    expect C == {0, 2, 5, 7};
  }

  // Test case for combination {1}/BA=3,B=0:
  //   POST: C == A + B
  {
    var A: set<int> := {0, 1, 7};
    var B: set<int> := {};
    var C := SetUnion(A, B);
    expect C == {0, 1, 7};
  }

}

method GeneratedTests_SetIntersection()
{
  // Test case for combination {1}:
  //   POST: C == A * B
  {
    var A: set<int> := {};
    var B: set<int> := {};
    var C := SetIntersection(A, B);
    expect C == {};
  }

  // Test case for combination {1}:
  //   POST: C == A * B
  {
    var A: set<int> := {2, 3, 4, 6};
    var B: set<int> := {2, 3, 4, 6};
    var C := SetIntersection(A, B);
    expect C == {2, 3, 4, 6};
  }

  // Test case for combination {1}/BA=3,B=1:
  //   POST: C == A * B
  {
    var A: set<int> := {0, 2, 5};
    var B: set<int> := {7};
    var C := SetIntersection(A, B);
    expect C == {};
  }

  // Test case for combination {1}/BA=3,B=0:
  //   POST: C == A * B
  {
    var A: set<int> := {0, 1, 7};
    var B: set<int> := {};
    var C := SetIntersection(A, B);
    expect C == {};
  }

}

method GeneratedTests_SetDifference()
{
  // Test case for combination {1}:
  //   POST: C == A - B
  {
    var A: set<int> := {};
    var B: set<int> := {};
    var C := SetDifference(A, B);
    expect C == {};
  }

  // Test case for combination {1}:
  //   POST: C == A - B
  {
    var A: set<int> := {2, 3, 4, 6};
    var B: set<int> := {2, 3, 4, 6};
    var C := SetDifference(A, B);
    expect C == {};
  }

  // Test case for combination {1}/BA=3,B=1:
  //   POST: C == A - B
  {
    var A: set<int> := {0, 2, 5};
    var B: set<int> := {7};
    var C := SetDifference(A, B);
    expect C == {0, 2, 5};
  }

  // Test case for combination {1}/BA=3,B=0:
  //   POST: C == A - B
  {
    var A: set<int> := {0, 1, 7};
    var B: set<int> := {};
    var C := SetDifference(A, B);
    expect C == {0, 1, 7};
  }

}

method GeneratedTests_SetSubset()
{
  // Test case for combination P{1}/{1}:
  //   PRE:  A <= B || !(A <= B)
  //   POST: r == (A <= B)
  {
    var A: set<int> := {};
    var B: set<int> := {};
    var r := SetSubset(A, B);
    expect r == true;
  }

  // Test case for combination P{2}/{1}:
  //   PRE:  A <= B || !(A <= B)
  //   POST: r == (A <= B)
  {
    var A: set<int> := {4};
    var B: set<int> := {1};
    var r := SetSubset(A, B);
    expect r == false;
  }

  // Test case for combination P{1}/{1}:
  //   PRE:  A <= B || !(A <= B)
  //   POST: r == (A <= B)
  {
    var A: set<int> := {5};
    var B: set<int> := {2, 3, 4, 5};
    var r := SetSubset(A, B);
    expect r == true;
  }

  // Test case for combination P{2}/{1}:
  //   PRE:  A <= B || !(A <= B)
  //   POST: r == (A <= B)
  {
    var A: set<int> := {0};
    var B: set<int> := {2, 5};
    var r := SetSubset(A, B);
    expect r == false;
  }

}

method GeneratedTests_AllPositive()
{
  // Test case for combination {1}:
  //   POST: r == forall x :: x in S ==> x > 0
  {
    var S: set<int> := {};
    var r := AllPositive(S);
    expect r == true;
  }

  // Test case for combination {1}:
  //   POST: r == forall x :: x in S ==> x > 0
  {
    var S: set<int> := {6, 7};
    var r := AllPositive(S);
  }

  // Test case for combination {1}/BS=1:
  //   POST: r == forall x :: x in S ==> x > 0
  {
    var S: set<int> := {0};
    var r := AllPositive(S);
  }

  // Test case for combination {1}/BS=2:
  //   POST: r == forall x :: x in S ==> x > 0
  {
    var S: set<int> := {1, 6};
    var r := AllPositive(S);
  }

}

method GeneratedTests_HasZero()
{
  // Test case for combination {1}:
  //   POST: r == exists x :: x in S && x == 0
  {
    var S: set<int> := {};
    var r := HasZero(S);
    expect r == false;
  }

  // Test case for combination {1}:
  //   POST: r == exists x :: x in S && x == 0
  {
    var S: set<int> := {6, 7};
    var r := HasZero(S);
    expect r == false;
  }

  // Test case for combination {1}/BS=1:
  //   POST: r == exists x :: x in S && x == 0
  {
    var S: set<int> := {0};
    var r := HasZero(S);
  }

  // Test case for combination {1}/BS=2:
  //   POST: r == exists x :: x in S && x == 0
  {
    var S: set<int> := {1, 6};
    var r := HasZero(S);
  }

}

method GeneratedTests_SubsetForall()
{
  // Test case for combination {1}:
  //   POST: r == forall x :: x in A ==> x in B
  {
    var A: set<int> := {};
    var B: set<int> := {};
    var r := SubsetForall(A, B);
    expect r == true;
  }

  // Test case for combination {1}:
  //   POST: r == forall x :: x in A ==> x in B
  {
    var A: set<int> := {3, 5, 6, 7};
    var B: set<int> := {3, 5, 6, 7};
    var r := SubsetForall(A, B);
    expect r == true;
  }

  // Test case for combination {1}/BA=3,B=1:
  //   POST: r == forall x :: x in A ==> x in B
  {
    var A: set<int> := {0, 1, 2};
    var B: set<int> := {7};
    var r := SubsetForall(A, B);
  }

  // Test case for combination {1}/BA=3,B=0:
  //   POST: r == forall x :: x in A ==> x in B
  {
    var A: set<int> := {1, 3, 7};
    var B: set<int> := {};
    var r := SubsetForall(A, B);
  }

}

method GeneratedTests_AddElement()
{
  // Test case for combination {1}:
  //   POST: C == S + {x}
  //   POST: x in C
  //   POST: forall y :: y in S ==> y in C
  {
    var S: set<int> := {};
    var x := 0;
    var C := AddElement(S, x);
    expect C == {0};
  }

  // Test case for combination {1}:
  //   POST: C == S + {x}
  //   POST: x in C
  //   POST: forall y :: y in S ==> y in C
  {
    var S: set<int> := {};
    var x := 5;
    var C := AddElement(S, x);
    expect C == {5};
  }

  // Test case for combination {1}/BS=0,x=1:
  //   POST: C == S + {x}
  //   POST: x in C
  //   POST: forall y :: y in S ==> y in C
  {
    var S: set<int> := {};
    var x := 1;
    var C := AddElement(S, x);
    expect C == {1};
  }

  // Test case for combination {1}/BS=1,x=0:
  //   POST: C == S + {x}
  //   POST: x in C
  //   POST: forall y :: y in S ==> y in C
  {
    var S: set<int> := {4};
    var x := 0;
    var C := AddElement(S, x);
    expect C == {0, 4};
  }

}

method GeneratedTests_RemoveElement()
{
  // Test case for combination {1}:
  //   PRE:  x in S
  //   POST: C == S - {x}
  //   POST: x !in C
  //   POST: forall y :: y in S && y != x ==> y in C
  {
    var S: set<int> := {0};
    var x := 0;
    var C := RemoveElement(S, x);
    expect C == {};
  }

  // Test case for combination {1}:
  //   PRE:  x in S
  //   POST: C == S - {x}
  //   POST: x !in C
  //   POST: forall y :: y in S && y != x ==> y in C
  {
    var S: set<int> := {1};
    var x := 1;
    var C := RemoveElement(S, x);
    expect C == {};
  }

  // Test case for combination {1}/BS=2,x=0:
  //   PRE:  x in S
  //   POST: C == S - {x}
  //   POST: x !in C
  //   POST: forall y :: y in S && y != x ==> y in C
  {
    var S: set<int> := {0, 3};
    var x := 0;
    var C := RemoveElement(S, x);
    expect C == {3};
  }

  // Test case for combination {1}/BS=2,x=1:
  //   PRE:  x in S
  //   POST: C == S - {x}
  //   POST: x !in C
  //   POST: forall y :: y in S && y != x ==> y in C
  {
    var S: set<int> := {1, 3};
    var x := 1;
    var C := RemoveElement(S, x);
    expect C == {3};
  }

}

method Main()
{
  GeneratedTests_SetContains();
  print "GeneratedTests_SetContains: all tests passed!\n";
  GeneratedTests_SetUnion();
  print "GeneratedTests_SetUnion: all tests passed!\n";
  GeneratedTests_SetIntersection();
  print "GeneratedTests_SetIntersection: all tests passed!\n";
  GeneratedTests_SetDifference();
  print "GeneratedTests_SetDifference: all tests passed!\n";
  GeneratedTests_SetSubset();
  print "GeneratedTests_SetSubset: all tests passed!\n";
  GeneratedTests_AllPositive();
  print "GeneratedTests_AllPositive: all tests passed!\n";
  GeneratedTests_HasZero();
  print "GeneratedTests_HasZero: all tests passed!\n";
  GeneratedTests_SubsetForall();
  print "GeneratedTests_SubsetForall: all tests passed!\n";
  GeneratedTests_AddElement();
  print "GeneratedTests_AddElement: all tests passed!\n";
  GeneratedTests_RemoveElement();
  print "GeneratedTests_RemoveElement: all tests passed!\n";
}
