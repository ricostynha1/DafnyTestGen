// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\SetOps.dfy
// Method: SetContains
// Generated: 2026-04-02 13:47:59

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


method GeneratedTests_SetContains()
{
  // Test case for combination {1}:
  //   PRE:  |S| > 0
  //   POST: r == (x in S)
  {
    var S: set<int> := {-2, -1, 0, 1, 2, 3, 4};
    var x := 0;
    var r := SetContains(S, x);
    expect r == (x in S);
  }

  // Test case for combination {1}/BS=1,x=0:
  //   PRE:  |S| > 0
  //   POST: r == (x in S)
  {
    var S: set<int> := {1};
    var x := 0;
    var r := SetContains(S, x);
    expect r == (x in S);
  }

  // Test case for combination {1}/BS=1,x=1:
  //   PRE:  |S| > 0
  //   POST: r == (x in S)
  {
    var S: set<int> := {1};
    var x := 1;
    var r := SetContains(S, x);
    expect r == (x in S);
  }

  // Test case for combination {1}/BS=2,x=0:
  //   PRE:  |S| > 0
  //   POST: r == (x in S)
  {
    var S: set<int> := {4, 5};
    var x := 0;
    var r := SetContains(S, x);
    expect r == (x in S);
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
    expect C == A + B;
  }

  // Test case for combination {1}/BA=0,B=1:
  //   POST: C == A + B
  {
    var A: set<int> := {};
    var B: set<int> := {1};
    var C := SetUnion(A, B);
    expect C == A + B;
  }

  // Test case for combination {1}/BA=0,B=2:
  //   POST: C == A + B
  {
    var A: set<int> := {};
    var B: set<int> := {2, 5};
    var C := SetUnion(A, B);
    expect C == A + B;
  }

  // Test case for combination {1}/BA=0,B=3:
  //   POST: C == A + B
  {
    var A: set<int> := {};
    var B: set<int> := {-2, -1, 1};
    var C := SetUnion(A, B);
    expect C == A + B;
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
    expect C == A * B;
  }

  // Test case for combination {1}/BA=0,B=1:
  //   POST: C == A * B
  {
    var A: set<int> := {};
    var B: set<int> := {1};
    var C := SetIntersection(A, B);
    expect C == A * B;
  }

  // Test case for combination {1}/BA=0,B=2:
  //   POST: C == A * B
  {
    var A: set<int> := {};
    var B: set<int> := {2, 5};
    var C := SetIntersection(A, B);
    expect C == A * B;
  }

  // Test case for combination {1}/BA=0,B=3:
  //   POST: C == A * B
  {
    var A: set<int> := {};
    var B: set<int> := {-2, -1, 1};
    var C := SetIntersection(A, B);
    expect C == A * B;
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
    expect C == A - B;
  }

  // Test case for combination {1}/BA=0,B=1:
  //   POST: C == A - B
  {
    var A: set<int> := {};
    var B: set<int> := {1};
    var C := SetDifference(A, B);
    expect C == A - B;
  }

  // Test case for combination {1}/BA=0,B=2:
  //   POST: C == A - B
  {
    var A: set<int> := {};
    var B: set<int> := {2, 5};
    var C := SetDifference(A, B);
    expect C == A - B;
  }

  // Test case for combination {1}/BA=0,B=3:
  //   POST: C == A - B
  {
    var A: set<int> := {};
    var B: set<int> := {-2, -1, 1};
    var C := SetDifference(A, B);
    expect C == A - B;
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
    expect A <= B || !(A <= B); // PRE-CHECK
    var r := SetSubset(A, B);
    expect r == true;
  }

  // Test case for combination P{2}/{1}:
  //   PRE:  A <= B || !(A <= B)
  //   POST: r == (A <= B)
  {
    var A: set<int> := {2};
    var B: set<int> := {-1};
    expect A <= B || !(A <= B); // PRE-CHECK
    var r := SetSubset(A, B);
    expect r == false;
  }

  // Test case for combination P{1}/{1}/BA=3,B=3:
  //   PRE:  A <= B || !(A <= B)
  //   POST: r == (A <= B)
  {
    var A: set<int> := {-2, -1, 1};
    var B: set<int> := {-2, -1, 1};
    expect A <= B || !(A <= B); // PRE-CHECK
    var r := SetSubset(A, B);
    expect r == true;
  }

  // Test case for combination P{1}/{1}/BA=2,B=2:
  //   PRE:  A <= B || !(A <= B)
  //   POST: r == (A <= B)
  {
    var A: set<int> := {1, 5};
    var B: set<int> := {1, 5};
    expect A <= B || !(A <= B); // PRE-CHECK
    var r := SetSubset(A, B);
    expect r == true;
  }

}

method GeneratedTests_AllPositive()
{
  // Test case for combination {1}:
  //   POST: r == forall x :: x in S ==> x > 0
  {
    var S: set<int> := {};
    var r := AllPositive(S);
    expect r == forall x :: x in S ==> x > 0;
  }

  // Test case for combination {1}/BS=1:
  //   POST: r == forall x :: x in S ==> x > 0
  {
    var S: set<int> := {1};
    var r := AllPositive(S);
    expect r == forall x :: x in S ==> x > 0;
  }

  // Test case for combination {1}/BS=2:
  //   POST: r == forall x :: x in S ==> x > 0
  {
    var S: set<int> := {4, 5};
    var r := AllPositive(S);
    expect r == forall x :: x in S ==> x > 0;
  }

  // Test case for combination {1}/BS=3:
  //   POST: r == forall x :: x in S ==> x > 0
  {
    var S: set<int> := {3, 4, 5};
    var r := AllPositive(S);
    expect r == forall x :: x in S ==> x > 0;
  }

}

method GeneratedTests_HasZero()
{
  // Test case for combination {1}:
  //   POST: r == exists x :: x in S && x == 0
  {
    var S: set<int> := {};
    var r := HasZero(S);
    expect r == exists x :: x in S && x == 0;
  }

  // Test case for combination {1}/BS=1:
  //   POST: r == exists x :: x in S && x == 0
  {
    var S: set<int> := {1};
    var r := HasZero(S);
    expect r == exists x :: x in S && x == 0;
  }

  // Test case for combination {1}/BS=2:
  //   POST: r == exists x :: x in S && x == 0
  {
    var S: set<int> := {4, 5};
    var r := HasZero(S);
    expect r == exists x :: x in S && x == 0;
  }

  // Test case for combination {1}/BS=3:
  //   POST: r == exists x :: x in S && x == 0
  {
    var S: set<int> := {3, 4, 5};
    var r := HasZero(S);
    expect r == exists x :: x in S && x == 0;
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
    expect r == forall x :: x in A ==> x in B;
  }

  // Test case for combination {1}/BA=0,B=1:
  //   POST: r == forall x :: x in A ==> x in B
  {
    var A: set<int> := {};
    var B: set<int> := {4};
    var r := SubsetForall(A, B);
    expect r == true;
  }

  // Test case for combination {1}/BA=0,B=2:
  //   POST: r == forall x :: x in A ==> x in B
  {
    var A: set<int> := {};
    var B: set<int> := {0, 1};
    var r := SubsetForall(A, B);
    expect r == true;
  }

  // Test case for combination {1}/BA=0,B=3:
  //   POST: r == forall x :: x in A ==> x in B
  {
    var A: set<int> := {};
    var B: set<int> := {-2, -1, 2};
    var r := SubsetForall(A, B);
    expect r == true;
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
    expect C == S + {x};
    expect x in C;
    expect forall y :: y in S ==> y in C;
  }

  // Test case for combination {1}/BS=0,x=1:
  //   POST: C == S + {x}
  //   POST: x in C
  //   POST: forall y :: y in S ==> y in C
  {
    var S: set<int> := {};
    var x := 1;
    var C := AddElement(S, x);
    expect C == S + {x};
    expect x in C;
    expect forall y :: y in S ==> y in C;
  }

  // Test case for combination {1}/BS=1,x=0:
  //   POST: C == S + {x}
  //   POST: x in C
  //   POST: forall y :: y in S ==> y in C
  {
    var S: set<int> := {1};
    var x := 0;
    var C := AddElement(S, x);
    expect C == S + {x};
    expect x in C;
    expect forall y :: y in S ==> y in C;
  }

  // Test case for combination {1}/BS=1,x=1:
  //   POST: C == S + {x}
  //   POST: x in C
  //   POST: forall y :: y in S ==> y in C
  {
    var S: set<int> := {1};
    var x := 1;
    var C := AddElement(S, x);
    expect C == S + {x};
    expect x in C;
    expect forall y :: y in S ==> y in C;
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
    var S: set<int> := {2};
    var x := 2;
    var C := RemoveElement(S, x);
    expect C == S - {x};
    expect x !in C;
    expect forall y :: y in S && y != x ==> y in C;
  }

  // Test case for combination {1}/BS=1,x=0:
  //   PRE:  x in S
  //   POST: C == S - {x}
  //   POST: x !in C
  //   POST: forall y :: y in S && y != x ==> y in C
  {
    var S: set<int> := {0};
    var x := 0;
    var C := RemoveElement(S, x);
    expect C == S - {x};
    expect x !in C;
    expect forall y :: y in S && y != x ==> y in C;
  }

  // Test case for combination {1}/BS=1,x=1:
  //   PRE:  x in S
  //   POST: C == S - {x}
  //   POST: x !in C
  //   POST: forall y :: y in S && y != x ==> y in C
  {
    var S: set<int> := {1};
    var x := 1;
    var C := RemoveElement(S, x);
    expect C == S - {x};
    expect x !in C;
    expect forall y :: y in S && y != x ==> y in C;
  }

  // Test case for combination {1}/BS=2,x=0:
  //   PRE:  x in S
  //   POST: C == S - {x}
  //   POST: x !in C
  //   POST: forall y :: y in S && y != x ==> y in C
  {
    var S: set<int> := {0, 1};
    var x := 0;
    var C := RemoveElement(S, x);
    expect C == S - {x};
    expect x !in C;
    expect forall y :: y in S && y != x ==> y in C;
  }

}

method GeneratedTests_SetContainsNat()
{
  // Test case for combination {1}:
  //   PRE:  |S| > 0
  //   POST: r == (x in S)
  {
    var S: set<nat> := {0, 1, 2, 3, 4, 6, 7};
    var x := 0;
    var r := SetContainsNat(S, x);
    expect r == (x in S);
  }

  // Test case for combination {1}/BS=1,x=0:
  //   PRE:  |S| > 0
  //   POST: r == (x in S)
  {
    var S: set<nat> := {0};
    var x := 0;
    var r := SetContainsNat(S, x);
    expect r == (x in S);
  }

  // Test case for combination {1}/BS=1,x=1:
  //   PRE:  |S| > 0
  //   POST: r == (x in S)
  {
    var S: set<nat> := {0};
    var x := 1;
    var r := SetContainsNat(S, x);
    expect r == (x in S);
  }

  // Test case for combination {1}/BS=2,x=0:
  //   PRE:  |S| > 0
  //   POST: r == (x in S)
  {
    var S: set<nat> := {6, 7};
    var x := 0;
    var r := SetContainsNat(S, x);
    expect r == (x in S);
  }

}

method GeneratedTests_SetUnionNat()
{
  // Test case for combination {1}:
  //   POST: C == A + B
  {
    var A: set<nat> := {};
    var B: set<nat> := {};
    var C := SetUnionNat(A, B);
    expect C == A + B;
  }

  // Test case for combination {1}/BA=0,B=1:
  //   POST: C == A + B
  {
    var A: set<nat> := {};
    var B: set<nat> := {2};
    var C := SetUnionNat(A, B);
    expect C == A + B;
  }

  // Test case for combination {1}/BA=0,B=2:
  //   POST: C == A + B
  {
    var A: set<nat> := {};
    var B: set<nat> := {3, 5};
    var C := SetUnionNat(A, B);
    expect C == A + B;
  }

  // Test case for combination {1}/BA=0,B=3:
  //   POST: C == A + B
  {
    var A: set<nat> := {};
    var B: set<nat> := {3, 4, 5};
    var C := SetUnionNat(A, B);
    expect C == A + B;
  }

}

method GeneratedTests_SetContainsChar()
{
  // Test case for combination {1}:
  //   PRE:  |S| > 0
  //   POST: r == (c in S)
  {
    var S: set<char> := {'b', 'c', 'd', 'e', 'f', 'g', 'h'};
    var c := ' ';
    var r := SetContainsChar(S, c);
    expect r == false;
  }

  // Test case for combination {1}/BS=1:
  //   PRE:  |S| > 0
  //   POST: r == (c in S)
  {
    var S: set<char> := {'h'};
    var c := ' ';
    var r := SetContainsChar(S, c);
    expect r == false;
  }

  // Test case for combination {1}/BS=2:
  //   PRE:  |S| > 0
  //   POST: r == (c in S)
  {
    var S: set<char> := {'e', 'h'};
    var c := ' ';
    var r := SetContainsChar(S, c);
    expect r == false;
  }

  // Test case for combination {1}/BS=3:
  //   PRE:  |S| > 0
  //   POST: r == (c in S)
  {
    var S: set<char> := {'e', 'g', 'h'};
    var c := ' ';
    var r := SetContainsChar(S, c);
    expect r == false;
  }

}

method GeneratedTests_SetUnionChar()
{
  // Test case for combination {1}:
  //   POST: C == A + B
  {
    var A: set<char> := {};
    var B: set<char> := {};
    var C := SetUnionChar(A, B);
    expect C == A + B;
  }

  // Test case for combination {1}/BA=0,B=1:
  //   POST: C == A + B
  {
    var A: set<char> := {};
    var B: set<char> := {'c'};
    var C := SetUnionChar(A, B);
    expect C == A + B;
  }

  // Test case for combination {1}/BA=0,B=2:
  //   POST: C == A + B
  {
    var A: set<char> := {};
    var B: set<char> := {'d', 'f'};
    var C := SetUnionChar(A, B);
    expect C == A + B;
  }

  // Test case for combination {1}/BA=0,B=3:
  //   POST: C == A + B
  {
    var A: set<char> := {};
    var B: set<char> := {'d', 'f', 'h'};
    var C := SetUnionChar(A, B);
    expect C == A + B;
  }

}

method GeneratedTests_SetContainsColor()
{
  // Test case for combination {1}:
  //   PRE:  |S| > 0
  //   POST: r == (c in S)
  {
    var S: set<Color> := {White, Blue};
    var c := Red;
    var r := SetContainsColor(S, c);
    expect r == (c in S);
  }

  // Test case for combination {1}/BS=1,c=Red:
  //   PRE:  |S| > 0
  //   POST: r == (c in S)
  {
    var S: set<Color> := {Blue};
    var c := Red;
    var r := SetContainsColor(S, c);
    expect r == (c in S);
  }

  // Test case for combination {1}/BS=1,c=White:
  //   PRE:  |S| > 0
  //   POST: r == (c in S)
  {
    var S: set<Color> := {Blue};
    var c := White;
    var r := SetContainsColor(S, c);
    expect r == (c in S);
  }

  // Test case for combination {1}/BS=1,c=Blue:
  //   PRE:  |S| > 0
  //   POST: r == (c in S)
  {
    var S: set<Color> := {Blue};
    var c := Blue;
    var r := SetContainsColor(S, c);
    expect r == (c in S);
  }

}

method GeneratedTests_SetUnionColor()
{
  // Test case for combination {1}:
  //   POST: C == A + B
  {
    var A: set<Color> := {};
    var B: set<Color> := {};
    var C := SetUnionColor(A, B);
    expect C == A + B;
  }

  // Test case for combination {1}/BA=0,B=1:
  //   POST: C == A + B
  {
    var A: set<Color> := {};
    var B: set<Color> := {Blue};
    var C := SetUnionColor(A, B);
    expect C == A + B;
  }

  // Test case for combination {1}/BA=0,B=2:
  //   POST: C == A + B
  {
    var A: set<Color> := {};
    var B: set<Color> := {Red, Blue};
    var C := SetUnionColor(A, B);
    expect C == A + B;
  }

  // Test case for combination {1}/BA=0,B=3:
  //   POST: C == A + B
  {
    var A: set<Color> := {};
    var B: set<Color> := {Red, White, Blue};
    var C := SetUnionColor(A, B);
    expect C == A + B;
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
  GeneratedTests_SetContainsNat();
  print "GeneratedTests_SetContainsNat: all tests passed!\n";
  GeneratedTests_SetUnionNat();
  print "GeneratedTests_SetUnionNat: all tests passed!\n";
  GeneratedTests_SetContainsChar();
  print "GeneratedTests_SetContainsChar: all tests passed!\n";
  GeneratedTests_SetUnionChar();
  print "GeneratedTests_SetUnionChar: all tests passed!\n";
  GeneratedTests_SetContainsColor();
  print "GeneratedTests_SetContainsColor: all tests passed!\n";
  GeneratedTests_SetUnionColor();
  print "GeneratedTests_SetUnionColor: all tests passed!\n";
}
