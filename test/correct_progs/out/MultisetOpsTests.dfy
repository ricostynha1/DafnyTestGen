// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\MultisetOps.dfy
// Method: MultisetContains
// Generated: 2026-04-17 19:28:52

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

// --- multiset<nat> ---

method MultisetContainsNat(M: multiset<nat>, x: nat) returns (r: bool)
  requires |M| > 0
  ensures r == (x in M)
{
  r := x in M;
}

method MultisetUnionNat(A: multiset<nat>, B: multiset<nat>) returns (C: multiset<nat>)
  ensures C == A + B
{
  C := A + B;
}


method TestsForMultisetContains()
{
  // Test case for combination {1}:
  //   PRE:  |M| > 0
  //   POST: r == (x in M)
  //   ENSURES: r == (x in M)
  {
    var M: multiset<int> := multiset{5};
    var x := 0;
    var r := MultisetContains(M, x);
    expect r == false || r == true;
  }

  // Test case for combination {1}/O|M|>=2:
  //   PRE:  |M| > 0
  //   POST: r == (x in M)
  //   ENSURES: r == (x in M)
  {
    var M: multiset<int> := multiset{5, 5};
    var x := 1;
    var r := MultisetContains(M, x);
    expect r == false || r == true;
  }

  // Test case for combination {1}/Ox<0:
  //   PRE:  |M| > 0
  //   POST: r == (x in M)
  //   ENSURES: r == (x in M)
  {
    var M: multiset<int> := multiset{5};
    var x := -1;
    var r := MultisetContains(M, x);
    expect r == false || r == true;
  }

  // Test case for combination {1}/Or=true:
  //   PRE:  |M| > 0
  //   POST: r == (x in M)
  //   ENSURES: r == (x in M)
  {
    var M: multiset<int> := multiset{-2, -2, -2};
    var x := -2;
    var r := MultisetContains(M, x);
    expect r == true || r == false;
  }

}

method TestsForMultisetUnion()
{
  // Test case for combination {1}:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: multiset<int> := multiset{1, 1, 1};
    var B: multiset<int> := multiset{-2, -2, -1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4};
    var C := MultisetUnion(A, B);
    expect C == multiset{-2, -2, -1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4};
  }

  // Test case for combination {1}/O|A|=0:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: multiset<int> := multiset{};
    var B: multiset<int> := multiset{-2, -2, -1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4};
    var C := MultisetUnion(A, B);
    expect C == multiset{-2, -2, -1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4};
  }

  // Test case for combination {1}/O|A|=1:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: multiset<int> := multiset{-1};
    var B: multiset<int> := multiset{-2, -2, -2, -2, -2, -2, -2, -2, -1, -1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4};
    var C := MultisetUnion(A, B);
    expect C == multiset{-2, -2, -2, -2, -2, -2, -2, -2, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4};
  }

  // Test case for combination {1}/O|B|=0:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: multiset<int> := multiset{-2, -2, -1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4};
    var B: multiset<int> := multiset{};
    var C := MultisetUnion(A, B);
    expect C == multiset{-2, -2, -1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4};
  }

}

method TestsForMultisetIntersection()
{
  // Test case for combination {1}:
  //   POST: C == A * B
  //   ENSURES: C == A * B
  {
    var A: multiset<int> := multiset{-2, -2, -1, -1, -1, -1, -1, -1, -1, 0, 0, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4};
    var B: multiset<int> := multiset{-2, -2, -2, -1, -1, -1, -1, -1, -1, -1, -1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4};
    var C := MultisetIntersection(A, B);
    expect C == multiset{-2, -2, -1, -1, -1, -1, -1, -1, -1, 0, 0, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4};
  }

  // Test case for combination {1}/O|A|=0:
  //   POST: C == A * B
  //   ENSURES: C == A * B
  {
    var A: multiset<int> := multiset{};
    var B: multiset<int> := multiset{-1, 0, 1, 2, 3};
    var C := MultisetIntersection(A, B);
    expect C == multiset{};
  }

  // Test case for combination {1}/O|A|=1:
  //   POST: C == A * B
  //   ENSURES: C == A * B
  {
    var A: multiset<int> := multiset{4};
    var B: multiset<int> := multiset{-1, 0, 1, 2, 3};
    var C := MultisetIntersection(A, B);
    expect C == multiset{};
  }

  // Test case for combination {1}/O|B|=0:
  //   POST: C == A * B
  //   ENSURES: C == A * B
  {
    var A: multiset<int> := multiset{-1, 0, 1, 2, 3, 4};
    var B: multiset<int> := multiset{};
    var C := MultisetIntersection(A, B);
    expect C == multiset{};
  }

}

method TestsForMultisetDifference()
{
  // Test case for combination {1}:
  //   POST: C == A - B
  //   ENSURES: C == A - B
  {
    var A: multiset<int> := multiset{-2, -2, -2, -2, -2, -2, -2, -2, -1, -1, -1, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 5};
    var B: multiset<int> := multiset{4};
    var C := MultisetDifference(A, B);
    expect C == multiset{-2, -2, -2, -2, -2, -2, -2, -2, -1, -1, -1, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 5};
  }

  // Test case for combination {1}/O|A|=0:
  //   POST: C == A - B
  //   ENSURES: C == A - B
  {
    var A: multiset<int> := multiset{};
    var B: multiset<int> := multiset{-2, -1, 0, 1, 2, 3, 4};
    var C := MultisetDifference(A, B);
    expect C == multiset{};
  }

  // Test case for combination {1}/O|A|=1:
  //   POST: C == A - B
  //   ENSURES: C == A - B
  {
    var A: multiset<int> := multiset{3};
    var B: multiset<int> := multiset{-1, 0, 1, 2, 4, 5};
    var C := MultisetDifference(A, B);
    expect C == multiset{3};
  }

  // Test case for combination {1}/O|B|=0:
  //   POST: C == A - B
  //   ENSURES: C == A - B
  {
    var A: multiset<int> := multiset{-2, -2, -1, -1, -1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 4, 5};
    var B: multiset<int> := multiset{};
    var C := MultisetDifference(A, B);
    expect C == multiset{-2, -2, -1, -1, -1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 4, 5};
  }

}

method TestsForMultisetSubset()
{
  // Test case for combination P{1}/{1}:
  //   PRE:  A <= B || !(A <= B)
  //   POST: r == (A <= B)
  //   ENSURES: r == (A <= B)
  {
    var A: multiset<int> := multiset{};
    var B: multiset<int> := multiset{};
    var r := MultisetSubset(A, B);
    expect r == true;
  }

  // Test case for combination P{2}/{1}:
  //   PRE:  A <= B || !(A <= B)
  //   POST: r == (A <= B)
  //   ENSURES: r == (A <= B)
  {
    var A: multiset<int> := multiset{5};
    var B: multiset<int> := multiset{};
    var r := MultisetSubset(A, B);
    expect r == false;
  }

  // Test case for combination P{1}/{1}/O|A|=1:
  //   PRE:  A <= B || !(A <= B)
  //   POST: r == (A <= B)
  //   ENSURES: r == (A <= B)
  {
    var A: multiset<int> := multiset{-2};
    var B: multiset<int> := multiset{-2};
    var r := MultisetSubset(A, B);
    expect r == true;
  }

  // Test case for combination P{1}/{1}/O|A|>=2:
  //   PRE:  A <= B || !(A <= B)
  //   POST: r == (A <= B)
  //   ENSURES: r == (A <= B)
  {
    var A: multiset<int> := multiset{5, 5};
    var B: multiset<int> := multiset{5, 5};
    var r := MultisetSubset(A, B);
    expect r == true;
  }

}

method TestsForMultisetCount()
{
  // Test case for combination {1}:
  //   POST: r == M[x]
  //   ENSURES: r == M[x]
  {
    var M: multiset<int> := multiset{-2, -2, -1, -1, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4};
    var x := 5;
    var r := MultisetCount(M, x);
    expect r == 0;
  }

  // Test case for combination {1}/O|M|=0:
  //   POST: r == M[x]
  //   ENSURES: r == M[x]
  {
    var M: multiset<int> := multiset{};
    var x := 5;
    var r := MultisetCount(M, x);
    expect r == 0;
  }

  // Test case for combination {1}/O|M|=1:
  //   POST: r == M[x]
  //   ENSURES: r == M[x]
  {
    var M: multiset<int> := multiset{-2};
    var x := 5;
    var r := MultisetCount(M, x);
    expect r == 0;
  }

  // Test case for combination {1}/Ox=0:
  //   POST: r == M[x]
  //   ENSURES: r == M[x]
  {
    var M: multiset<int> := multiset{};
    var x := 0;
    var r := MultisetCount(M, x);
    expect r == 0;
  }

}

method TestsForAddElement()
{
  // Test case for combination {1}:
  //   POST: C == M + multiset{x}
  //   POST: x in C
  //   ENSURES: C == M + multiset{x}
  //   ENSURES: x in C
  {
    var M: multiset<int> := multiset{-2, -2, -1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4};
    var x := 5;
    var C := AddElement(M, x);
    expect C == multiset{-2, -2, -1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 5};
  }

  // Test case for combination {1}/O|M|=0:
  //   POST: C == M + multiset{x}
  //   POST: x in C
  //   ENSURES: C == M + multiset{x}
  //   ENSURES: x in C
  {
    var M: multiset<int> := multiset{};
    var x := 5;
    var C := AddElement(M, x);
    expect C == multiset{5};
  }

  // Test case for combination {1}/O|M|=1:
  //   POST: C == M + multiset{x}
  //   POST: x in C
  //   ENSURES: C == M + multiset{x}
  //   ENSURES: x in C
  {
    var M: multiset<int> := multiset{0};
    var x := 5;
    var C := AddElement(M, x);
    expect C == multiset{0, 5};
  }

  // Test case for combination {1}/Ox=0:
  //   POST: C == M + multiset{x}
  //   POST: x in C
  //   ENSURES: C == M + multiset{x}
  //   ENSURES: x in C
  {
    var M: multiset<int> := multiset{-2, -2, -2, -2, -1, -1, 0, 0, 1, 1, 1, 2, 2, 2, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4};
    var x := 0;
    var C := AddElement(M, x);
    expect C == multiset{-2, -2, -2, -2, -1, -1, 0, 0, 0, 1, 1, 1, 2, 2, 2, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4};
  }

}

method TestsForMultisetContainsNat()
{
  // Test case for combination {1}:
  //   PRE:  |M| > 0
  //   POST: r == (x in M)
  //   ENSURES: r == (x in M)
  {
    var M: multiset<nat> := multiset{7};
    var x := 0;
    var r := MultisetContainsNat(M, x);
    expect r == false || r == true;
  }

  // Test case for combination {1}/Bx=1:
  //   PRE:  |M| > 0
  //   POST: r == (x in M)
  //   ENSURES: r == (x in M)
  {
    var M: multiset<nat> := multiset{7};
    var x := 1;
    var r := MultisetContainsNat(M, x);
    expect r == false || r == true;
  }

  // Test case for combination {1}/O|M|>=2:
  //   PRE:  |M| > 0
  //   POST: r == (x in M)
  //   ENSURES: r == (x in M)
  {
    var M: multiset<nat> := multiset{6, 6};
    var x := 0;
    var r := MultisetContainsNat(M, x);
    expect r == false || r == true;
  }

  // Test case for combination {1}/Ox>=2:
  //   PRE:  |M| > 0
  //   POST: r == (x in M)
  //   ENSURES: r == (x in M)
  {
    var M: multiset<nat> := multiset{7};
    var x := 2;
    var r := MultisetContainsNat(M, x);
    expect r == false || r == true;
  }

}

method TestsForMultisetUnionNat()
{
  // Test case for combination {1}:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: multiset<nat> := multiset{3, 3, 3};
    var B: multiset<nat> := multiset{0, 0, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6};
    var C := MultisetUnionNat(A, B);
    expect C == multiset{0, 0, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6};
  }

  // Test case for combination {1}/O|A|=0:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: multiset<nat> := multiset{};
    var B: multiset<nat> := multiset{0, 0, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6};
    var C := MultisetUnionNat(A, B);
    expect C == multiset{0, 0, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6};
  }

  // Test case for combination {1}/O|A|=1:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: multiset<nat> := multiset{1};
    var B: multiset<nat> := multiset{0, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 6, 6, 6, 6, 6, 6, 6, 6};
    var C := MultisetUnionNat(A, B);
    expect C == multiset{0, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 6, 6, 6, 6, 6, 6, 6, 6};
  }

  // Test case for combination {1}/O|B|=0:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: multiset<nat> := multiset{0, 0, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6};
    var B: multiset<nat> := multiset{};
    var C := MultisetUnionNat(A, B);
    expect C == multiset{0, 0, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6};
  }

}

method Main()
{
  TestsForMultisetContains();
  print "TestsForMultisetContains: all non-failing tests passed!\n";
  TestsForMultisetUnion();
  print "TestsForMultisetUnion: all non-failing tests passed!\n";
  TestsForMultisetIntersection();
  print "TestsForMultisetIntersection: all non-failing tests passed!\n";
  TestsForMultisetDifference();
  print "TestsForMultisetDifference: all non-failing tests passed!\n";
  TestsForMultisetSubset();
  print "TestsForMultisetSubset: all non-failing tests passed!\n";
  TestsForMultisetCount();
  print "TestsForMultisetCount: all non-failing tests passed!\n";
  TestsForAddElement();
  print "TestsForAddElement: all non-failing tests passed!\n";
  TestsForMultisetContainsNat();
  print "TestsForMultisetContainsNat: all non-failing tests passed!\n";
  TestsForMultisetUnionNat();
  print "TestsForMultisetUnionNat: all non-failing tests passed!\n";
}
