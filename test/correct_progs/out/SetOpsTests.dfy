// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\SetOps.dfy
// Method: SetContains
// Generated: 2026-04-21 23:37:51

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
    var S: set<int> := {2, 5};
    var x := -1;
    var r := SetContains(S, x);
    expect r == false || r == true;
    expect r == false; // observed from implementation
  }

  // Test case for combination {1}/O|S|=1:
  //   PRE:  |S| > 0
  //   POST Q1: r == (x in S)
  {
    var S: set<int> := {0};
    var x := -1;
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

  // Test case for combination {1}/Ox>0:
  //   PRE:  |S| > 0
  //   POST Q1: r == (x in S)
  {
    var S: set<int> := {3};
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
    var A: set<int> := {-2};
    var B: set<int> := {-2};
    var C := SetUnion(A, B);
    expect C == {-2};
  }

  // Test case for combination {1}/O|A|>=2:
  //   POST Q1: C == A + B
  {
    var A: set<int> := {0, 1, 3, 5};
    var B: set<int> := {1, 2};
    var C := SetUnion(A, B);
    expect C == {0, 1, 2, 3, 5};
  }

  // Test case for combination {1}/R4:
  //   POST Q1: C == A + B
  {
    var A: set<int> := {1, 3, 4, 5};
    var B: set<int> := {1, 3, 4, 5};
    var C := SetUnion(A, B);
    expect C == {1, 3, 4, 5};
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
    var A: set<int> := {-2, 0, 2, 3, 4};
    var B: set<int> := {-2, 0, 2, 3, 4};
    var C := SetIntersection(A, B);
    expect C == {-2, 0, 2, 3, 4};
  }

  // Test case for combination {1}/R4:
  //   POST Q1: C == A * B
  {
    var A: set<int> := {-1};
    var B: set<int> := {-2, 0, 5};
    var C := SetIntersection(A, B);
    expect C == {};
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
    var A: set<int> := {4};
    var B: set<int> := {4};
    var C := SetDifference(A, B);
    expect C == {};
  }

  // Test case for combination {1}/O|A|>=2:
  //   POST Q1: C == A - B
  {
    var A: set<int> := {-2, -1, 3, 4};
    var B: set<int> := {-2, -1, 3, 4};
    var C := SetDifference(A, B);
    expect C == {};
  }

  // Test case for combination {1}/O|C|=1:
  //   POST Q1: C == A - B
  {
    var A: set<int> := {-1};
    var B: set<int> := {1, 2, 3, 4};
    var C := SetDifference(A, B);
    expect C == {-1};
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
    var A: set<int> := {-1, 0};
    var B: set<int> := {};
    var r := SetSubset(A, B);
    expect r == false;
  }

  // Test case for combination P{1}/{1}/O|A|=1:
  //   PRE:  A <= B || !(A <= B)
  //   POST Q1: r == (A <= B)
  {
    var A: set<int> := {3};
    var B: set<int> := {3};
    var r := SetSubset(A, B);
    expect r == true;
  }

  // Test case for combination P{1}/{1}/O|A|>=2:
  //   PRE:  A <= B || !(A <= B)
  //   POST Q1: r == (A <= B)
  {
    var A: set<int> := {1, 2};
    var B: set<int> := {1, 2, 4, 5};
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
    var S: set<int> := {5};
    var r := AllPositive(S);
    expect r == true;
  }

  // Test case for combination {1}/O|S|>=2:
  //   POST Q1: r == forall x: int :: x in S ==> x > 0
  {
    var S: set<int> := {0, 2, 3, 4};
    var r := AllPositive(S);
    expect r == false;
  }

  // Test case for combination {1}/R4:
  //   POST Q1: r == forall x: int :: x in S ==> x > 0
  {
    var S: set<int> := {0, 1};
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
    var A: set<int> := {0, 1, 2, 3, 4};
    var B: set<int> := {0, 1, 2, 3, 4};
    var r := SubsetForall(A, B);
    expect r == true;
  }

  // Test case for combination {1}/Or=false:
  //   POST Q1: r == forall x: int :: x in A ==> x in B
  {
    var A: set<int> := {-1};
    var B: set<int> := {-2, 4, 5};
    var r := SubsetForall(A, B);
    expect r == false || r == true;
    expect r == false; // observed from implementation
  }

}

method TestsForAddElement()
{
  // Test case for combination {1}:
  //   POST Q1: C == S + {x}
  {
    var S: set<int> := {};
    var x := -2;
    var C := AddElement(S, x);
    expect C == {-2};
  }

  // Test case for combination {1}/O|S|=1:
  //   POST Q1: C == S + {x}
  {
    var S: set<int> := {-1};
    var x := -2;
    var C := AddElement(S, x);
    expect C == {-2, -1};
  }

  // Test case for combination {1}/O|S|>=2:
  //   POST Q1: C == S + {x}
  {
    var S: set<int> := {-2, -1, 0, 2, 3, 5};
    var x := -1;
    var C := AddElement(S, x);
    expect C == {-2, -1, 0, 2, 3, 5};
  }

  // Test case for combination {1}/Ox=0:
  //   POST Q1: C == S + {x}
  {
    var S: set<int> := {};
    var x := 0;
    var C := AddElement(S, x);
    expect C == {0};
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
    var S: set<int> := {-2, 2};
    var x := -2;
    var C := RemoveElement(S, x);
    expect C == {2};
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

}

method TestsForSetContainsNat()
{
  // Test case for combination {1}:
  //   PRE:  |S| > 0
  //   POST Q1: r == (x in S)
  {
    var S: set<nat> := {1, 2, 3, 4, 5, 6};
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
    var S: set<nat> := {6};
    var x := 2;
    var r := SetContainsNat(S, x);
    expect r == false || r == true;
    expect r == false; // observed from implementation
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
    var A: set<nat> := {2, 3};
    var B: set<nat> := {2, 3, 5};
    var C := SetUnionNat(A, B);
    expect C == {2, 3, 5};
  }

  // Test case for combination {1}/R4:
  //   POST Q1: C == A + B
  {
    var A: set<nat> := {0, 1, 2, 5, 7};
    var B: set<nat> := {5, 7};
    var C := SetUnionNat(A, B);
    expect C == {0, 1, 2, 5, 7};
  }

}

method TestsForSetContainsChar()
{
  // Test case for combination {1}:
  //   PRE:  |S| > 0
  //   POST Q1: r == (c in S)
  {
    var S: set<char> := {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'};
    var c := '~';
    var r := SetContainsChar(S, c);
    expect r == false;
  }

  // Test case for combination {1}/O|S|=1:
  //   PRE:  |S| > 0
  //   POST Q1: r == (c in S)
  {
    var S: set<char> := {'e'};
    var c := '~';
    var r := SetContainsChar(S, c);
    expect r == false;
  }

  // Test case for combination {1}/Or=true:
  //   PRE:  |S| > 0
  //   POST Q1: r == (c in S)
  {
    var S: set<char> := {'g'};
    var c := 'g';
    var r := SetContainsChar(S, c);
    expect r == true || r == false;
    expect r == true; // observed from implementation
  }

  // Test case for combination {1}/R4:
  //   PRE:  |S| > 0
  //   POST Q1: r == (c in S)
  {
    var S: set<char> := {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'};
    var c := 'f';
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
    var A: set<char> := {'d'};
    var B: set<char> := {'d'};
    var C := SetUnionChar(A, B);
    expect C == {'d'};
  }

  // Test case for combination {1}/O|A|>=2:
  //   POST Q1: C == A + B
  {
    var A: set<char> := {'a', 'd', 'f'};
    var B: set<char> := {'c', 'e', 'f'};
    var C := SetUnionChar(A, B);
    expect C == {'a', 'c', 'd', 'e', 'f'};
  }

  // Test case for combination {1}/R4:
  //   POST Q1: C == A + B
  {
    var A: set<char> := {'a', 'c'};
    var B: set<char> := {'f'};
    var C := SetUnionChar(A, B);
    expect C == {'a', 'c', 'f'};
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
