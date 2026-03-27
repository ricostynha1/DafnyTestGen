// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\SetOps.dfy
// Method: SetContains
// Generated: 2026-03-27 19:08:05

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

  // Test case for combination {1}/R3:
  //   PRE:  |S| > 0
  //   POST: r == (x in S)
  {
    var S: set<int> := {2, 3, 4, 5, 6, 7};
    var x := 8;
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
}
