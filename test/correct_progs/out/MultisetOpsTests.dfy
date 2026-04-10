// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\MultisetOps.dfy
// Method: MultisetContains
// Generated: 2026-04-10 22:58:51

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


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  |M| > 0
  //   POST: r == (x in M)
  //   ENSURES: r == (x in M)
  {
    var M: multiset<int> := multiset{5};
    var x := 0;
    var r := MultisetContains(M, x);
    expect r == false;
  }

  // Test case for combination {1}/BM=1,x=0:
  //   PRE:  |M| > 0
  //   POST: r == (x in M)
  //   ENSURES: r == (x in M)
  {
    var M: multiset<int> := multiset{-2};
    var x := 0;
    var r := MultisetContains(M, x);
    expect r == false;
  }

  // Test case for combination {1}/BM=1,x=1:
  //   PRE:  |M| > 0
  //   POST: r == (x in M)
  //   ENSURES: r == (x in M)
  {
    var M: multiset<int> := multiset{-2};
    var x := 1;
    var r := MultisetContains(M, x);
    expect r == false;
  }

  // Test case for combination {1}/BM=2,x=0:
  //   PRE:  |M| > 0
  //   POST: r == (x in M)
  //   ENSURES: r == (x in M)
  {
    var M: multiset<int> := multiset{-2, -2};
    var x := 0;
    var r := MultisetContains(M, x);
    expect r == false;
  }

  // Test case for combination {1}/Or=true:
  //   PRE:  |M| > 0
  //   POST: r == (x in M)
  //   ENSURES: r == (x in M)
  {
    var M: multiset<int> := multiset{-1, 4, 4, 4, 4};
    var x := -1;
    var r := MultisetContains(M, x);
    expect r == true;
  }

  // Test case for combination {1}/Or=false:
  //   PRE:  |M| > 0
  //   POST: r == (x in M)
  //   ENSURES: r == (x in M)
  {
    var M: multiset<int> := multiset{0};
    var x := 5;
    var r := MultisetContains(M, x);
    expect r == false;
  }

  // Test case for combination {1}:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: multiset<int> := multiset{1, 1, 1};
    var B: multiset<int> := multiset{-2, -2, -1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4};
    var C := MultisetUnion(A, B);
    expect C == multiset{-2, -2, -1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4};
  }

  // Test case for combination {1}/BA=0,B=0:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: multiset<int> := multiset{};
    var B: multiset<int> := multiset{};
    var C := MultisetUnion(A, B);
    expect C == multiset{};
  }

  // Test case for combination {1}/BA=0,B=1:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: multiset<int> := multiset{};
    var B: multiset<int> := multiset{-2};
    var C := MultisetUnion(A, B);
    expect C == multiset{-2};
  }

  // Test case for combination {1}/BA=0,B=2:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: multiset<int> := multiset{};
    var B: multiset<int> := multiset{4, 5};
    var C := MultisetUnion(A, B);
    expect C == multiset{4, 5};
  }

  // Test case for combination {1}/O|C|>=3:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: multiset<int> := multiset{2, 2, 2, 2, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5};
    var B: multiset<int> := multiset{-1, -1, -1, -1, -1, 2, 3, 3, 3, 3, 3};
    var C := MultisetUnion(A, B);
    expect C == multiset{-1, -1, -1, -1, -1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5};
  }

  // Test case for combination {1}/O|C|>=2:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: multiset<int> := multiset{3, 3};
    var B: multiset<int> := multiset{3};
    var C := MultisetUnion(A, B);
    expect C == multiset{3, 3, 3};
  }

  // Test case for combination {1}/O|C|>=1:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: multiset<int> := multiset{-2, -2, -2, -1, 2, 3, 4, 5};
    var B: multiset<int> := multiset{0, 1};
    var C := MultisetUnion(A, B);
    expect C == multiset{-2, -2, -2, -1, 0, 1, 2, 3, 4, 5};
  }

  // Test case for combination {1}:
  //   POST: C == A * B
  //   ENSURES: C == A * B
  {
    var A: multiset<int> := multiset{-2, -2, -1, -1, -1, -1, -1, -1, -1, 0, 0, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4};
    var B: multiset<int> := multiset{-2, -2, -2, -1, -1, -1, -1, -1, -1, -1, -1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4};
    var C := MultisetIntersection(A, B);
    expect C == multiset{-2, -2, -1, -1, -1, -1, -1, -1, -1, 0, 0, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4};
  }

  // Test case for combination {1}/BA=0,B=0:
  //   POST: C == A * B
  //   ENSURES: C == A * B
  {
    var A: multiset<int> := multiset{};
    var B: multiset<int> := multiset{};
    var C := MultisetIntersection(A, B);
    expect C == multiset{};
  }

  // Test case for combination {1}/BA=0,B=1:
  //   POST: C == A * B
  //   ENSURES: C == A * B
  {
    var A: multiset<int> := multiset{};
    var B: multiset<int> := multiset{-1};
    var C := MultisetIntersection(A, B);
    expect C == multiset{};
  }

  // Test case for combination {1}/BA=0,B=2:
  //   POST: C == A * B
  //   ENSURES: C == A * B
  {
    var A: multiset<int> := multiset{};
    var B: multiset<int> := multiset{0, 2};
    var C := MultisetIntersection(A, B);
    expect C == multiset{};
  }

  // Test case for combination {1}/O|C|>=3:
  //   POST: C == A * B
  //   ENSURES: C == A * B
  {
    var A: multiset<int> := multiset{-2, -1, 0, 2, 3, 3, 3, 3, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5};
    var B: multiset<int> := multiset{-2, -2, 1, 3, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5};
    var C := MultisetIntersection(A, B);
    expect C == multiset{-2, 3, 3, 3, 3, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5};
  }

  // Test case for combination {1}/O|C|>=2:
  //   POST: C == A * B
  //   ENSURES: C == A * B
  {
    var A: multiset<int> := multiset{1, 4, 5};
    var B: multiset<int> := multiset{-1, -1, 3, 4, 4, 5};
    var C := MultisetIntersection(A, B);
    expect C == multiset{4, 5};
  }

  // Test case for combination {1}/O|C|>=1:
  //   POST: C == A * B
  //   ENSURES: C == A * B
  {
    var A: multiset<int> := multiset{-1, -1, 3};
    var B: multiset<int> := multiset{-2, -1, 4};
    var C := MultisetIntersection(A, B);
    expect C == multiset{-1};
  }

  // Test case for combination {1}:
  //   POST: C == A - B
  //   ENSURES: C == A - B
  {
    var A: multiset<int> := multiset{-2, -2, -2, -2, -2, -2, -2, -2, -1, -1, -1, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 5};
    var B: multiset<int> := multiset{4};
    var C := MultisetDifference(A, B);
    expect C == multiset{-2, -2, -2, -2, -2, -2, -2, -2, -1, -1, -1, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 5};
  }

  // Test case for combination {1}/BA=0,B=0:
  //   POST: C == A - B
  //   ENSURES: C == A - B
  {
    var A: multiset<int> := multiset{};
    var B: multiset<int> := multiset{};
    var C := MultisetDifference(A, B);
    expect C == multiset{};
  }

  // Test case for combination {1}/BA=0,B=1:
  //   POST: C == A - B
  //   ENSURES: C == A - B
  {
    var A: multiset<int> := multiset{};
    var B: multiset<int> := multiset{2};
    var C := MultisetDifference(A, B);
    expect C == multiset{};
  }

  // Test case for combination {1}/BA=0,B=2:
  //   POST: C == A - B
  //   ENSURES: C == A - B
  {
    var A: multiset<int> := multiset{};
    var B: multiset<int> := multiset{2, 3};
    var C := MultisetDifference(A, B);
    expect C == multiset{};
  }

  // Test case for combination {1}/O|C|>=3:
  //   POST: C == A - B
  //   ENSURES: C == A - B
  {
    var A: multiset<int> := multiset{-2, -2, -2, -2, -2, -2, -1, -1, -1, 0, 0, 0, 1, 2, 2, 2, 2, 2, 2, 2, 3, 4, 4};
    var B: multiset<int> := multiset{5};
    var C := MultisetDifference(A, B);
    expect C == multiset{-2, -2, -2, -2, -2, -2, -1, -1, -1, 0, 0, 0, 1, 2, 2, 2, 2, 2, 2, 2, 3, 4, 4};
  }

  // Test case for combination {1}/O|C|>=2:
  //   POST: C == A - B
  //   ENSURES: C == A - B
  {
    var A: multiset<int> := multiset{-2, -2, -2, -2, -2, -2, -2, -1, -1, 0, 4, 5, 5, 5, 5, 5, 5, 5};
    var B: multiset<int> := multiset{1, 2, 2, 4, 4};
    var C := MultisetDifference(A, B);
    expect C == multiset{-2, -2, -2, -2, -2, -2, -2, -1, -1, 0, 5, 5, 5, 5, 5, 5, 5};
  }

  // Test case for combination {1}/O|C|>=1:
  //   POST: C == A - B
  //   ENSURES: C == A - B
  {
    var A: multiset<int> := multiset{-2, -1, 2, 2, 2, 5, 5};
    var B: multiset<int> := multiset{0};
    var C := MultisetDifference(A, B);
    expect C == multiset{-2, -1, 2, 2, 2, 5, 5};
  }

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

  // Test case for combination P{1}/{1}/BA=0,B=1:
  //   PRE:  A <= B || !(A <= B)
  //   POST: r == (A <= B)
  //   ENSURES: r == (A <= B)
  {
    var A: multiset<int> := multiset{};
    var B: multiset<int> := multiset{-2};
    var r := MultisetSubset(A, B);
    expect r == true;
  }

  // Test case for combination P{1}/{1}/BA=0,B=2:
  //   PRE:  A <= B || !(A <= B)
  //   POST: r == (A <= B)
  //   ENSURES: r == (A <= B)
  {
    var A: multiset<int> := multiset{};
    var B: multiset<int> := multiset{-2, -2};
    var r := MultisetSubset(A, B);
    expect r == true;
  }

  // Test case for combination P{1}/{1}/Or=true:
  //   PRE:  A <= B || !(A <= B)
  //   POST: r == (A <= B)
  //   ENSURES: r == (A <= B)
  {
    var A: multiset<int> := multiset{};
    var B: multiset<int> := multiset{1};
    var r := MultisetSubset(A, B);
    expect r == true;
  }

  // Test case for combination P{2}/{1}/Or=false:
  //   PRE:  A <= B || !(A <= B)
  //   POST: r == (A <= B)
  //   ENSURES: r == (A <= B)
  {
    var A: multiset<int> := multiset{5};
    var B: multiset<int> := multiset{1};
    var r := MultisetSubset(A, B);
    expect r == false;
  }

  // Test case for combination {1}:
  //   POST: r == M[x]
  //   ENSURES: r == M[x]
  {
    var M: multiset<int> := multiset{-2, -2, -1, -1, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4};
    var x := 5;
    var r := MultisetCount(M, x);
    expect r == 0;
  }

  // Test case for combination {1}/BM=0,x=0:
  //   POST: r == M[x]
  //   ENSURES: r == M[x]
  {
    var M: multiset<int> := multiset{};
    var x := 0;
    var r := MultisetCount(M, x);
    expect r == 0;
  }

  // Test case for combination {1}/BM=0,x=1:
  //   POST: r == M[x]
  //   ENSURES: r == M[x]
  {
    var M: multiset<int> := multiset{};
    var x := 1;
    var r := MultisetCount(M, x);
    expect r == 0;
  }

  // Test case for combination {1}/BM=1,x=0:
  //   POST: r == M[x]
  //   ENSURES: r == M[x]
  {
    var M: multiset<int> := multiset{-2};
    var x := 0;
    var r := MultisetCount(M, x);
    expect r == 0;
  }

  // Test case for combination {1}/Or>=2:
  //   POST: r == M[x]
  //   ENSURES: r == M[x]
  {
    var M: multiset<int> := multiset{-1, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 4, 5, 5, 5, 5, 5, 5};
    var x := -1;
    var r := MultisetCount(M, x);
    expect r == 5;
  }

  // Test case for combination {1}/Or=1:
  //   POST: r == M[x]
  //   ENSURES: r == M[x]
  {
    var M: multiset<int> := multiset{-2, -2, -2, -2, -1, -1, -1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 5, 5, 5, 5, 5, 5, 5, 5};
    var x := 3;
    var r := MultisetCount(M, x);
    expect r == 1;
  }

  // Test case for combination {1}/Or=0:
  //   POST: r == M[x]
  //   ENSURES: r == M[x]
  {
    var M: multiset<int> := multiset{-2, -2, -2, -1, -1, 0, 0, 0, 0, 0, 4, 4, 4, 5, 5};
    var x := 2;
    var r := MultisetCount(M, x);
    expect r == 0;
  }

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

  // Test case for combination {1}/BM=0,x=0:
  //   POST: C == M + multiset{x}
  //   POST: x in C
  //   ENSURES: C == M + multiset{x}
  //   ENSURES: x in C
  {
    var M: multiset<int> := multiset{};
    var x := 0;
    var C := AddElement(M, x);
    expect C == multiset{0};
  }

  // Test case for combination {1}/BM=0,x=1:
  //   POST: C == M + multiset{x}
  //   POST: x in C
  //   ENSURES: C == M + multiset{x}
  //   ENSURES: x in C
  {
    var M: multiset<int> := multiset{};
    var x := 1;
    var C := AddElement(M, x);
    expect C == multiset{1};
  }

  // Test case for combination {1}/BM=1,x=0:
  //   POST: C == M + multiset{x}
  //   POST: x in C
  //   ENSURES: C == M + multiset{x}
  //   ENSURES: x in C
  {
    var M: multiset<int> := multiset{0};
    var x := 0;
    var C := AddElement(M, x);
    expect C == multiset{0, 0};
  }

  // Test case for combination {1}/O|C|>=3:
  //   POST: C == M + multiset{x}
  //   POST: x in C
  //   ENSURES: C == M + multiset{x}
  //   ENSURES: x in C
  {
    var M: multiset<int> := multiset{4, 5};
    var x := 5;
    var C := AddElement(M, x);
    expect C == multiset{4, 5, 5};
  }

  // Test case for combination {1}/O|C|>=2:
  //   POST: C == M + multiset{x}
  //   POST: x in C
  //   ENSURES: C == M + multiset{x}
  //   ENSURES: x in C
  {
    var M: multiset<int> := multiset{2};
    var x := 5;
    var C := AddElement(M, x);
    expect C == multiset{2, 5};
  }

  // Test case for combination {1}/O|C|>=1:
  //   POST: C == M + multiset{x}
  //   POST: x in C
  //   ENSURES: C == M + multiset{x}
  //   ENSURES: x in C
  {
    var M: multiset<int> := multiset{-2, 1};
    var x := 5;
    var C := AddElement(M, x);
    expect C == multiset{-2, 1, 5};
  }

  // Test case for combination {1}:
  //   PRE:  |M| > 0
  //   POST: r == (x in M)
  //   ENSURES: r == (x in M)
  {
    var M: multiset<nat> := multiset{7};
    var x := 0;
    var r := MultisetContainsNat(M, x);
    expect r == false;
  }

  // Test case for combination {1}/BM=1,x=0:
  //   PRE:  |M| > 0
  //   POST: r == (x in M)
  //   ENSURES: r == (x in M)
  {
    var M: multiset<nat> := multiset{0};
    var x := 0;
    var r := MultisetContainsNat(M, x);
    expect r == true;
  }

  // Test case for combination {1}/BM=1,x=1:
  //   PRE:  |M| > 0
  //   POST: r == (x in M)
  //   ENSURES: r == (x in M)
  {
    var M: multiset<nat> := multiset{0};
    var x := 1;
    var r := MultisetContainsNat(M, x);
    expect r == false;
  }

  // Test case for combination {1}/BM=2,x=0:
  //   PRE:  |M| > 0
  //   POST: r == (x in M)
  //   ENSURES: r == (x in M)
  {
    var M: multiset<nat> := multiset{0, 0};
    var x := 0;
    var r := MultisetContainsNat(M, x);
    expect r == true;
  }

  // Test case for combination {1}/Or=true:
  //   PRE:  |M| > 0
  //   POST: r == (x in M)
  //   ENSURES: r == (x in M)
  {
    var M: multiset<nat> := multiset{0, 1};
    var x := 0;
    var r := MultisetContainsNat(M, x);
    expect r == true;
  }

  // Test case for combination {1}/Or=false:
  //   PRE:  |M| > 0
  //   POST: r == (x in M)
  //   ENSURES: r == (x in M)
  {
    var M: multiset<nat> := multiset{2};
    var x := 0;
    var r := MultisetContainsNat(M, x);
    expect r == false;
  }

  // Test case for combination {1}:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: multiset<nat> := multiset{3, 3, 3};
    var B: multiset<nat> := multiset{0, 0, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6};
    var C := MultisetUnionNat(A, B);
    expect C == multiset{0, 0, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6};
  }

  // Test case for combination {1}/BA=0,B=0:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: multiset<nat> := multiset{};
    var B: multiset<nat> := multiset{};
    var C := MultisetUnionNat(A, B);
    expect C == multiset{};
  }

  // Test case for combination {1}/BA=0,B=1:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: multiset<nat> := multiset{};
    var B: multiset<nat> := multiset{0};
    var C := MultisetUnionNat(A, B);
    expect C == multiset{0};
  }

  // Test case for combination {1}/BA=0,B=2:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: multiset<nat> := multiset{};
    var B: multiset<nat> := multiset{1, 1};
    var C := MultisetUnionNat(A, B);
    expect C == multiset{1, 1};
  }

  // Test case for combination {1}/O|C|>=3:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: multiset<nat> := multiset{0, 0};
    var B: multiset<nat> := multiset{7};
    var C := MultisetUnionNat(A, B);
    expect C == multiset{0, 0, 7};
  }

  // Test case for combination {1}/O|C|>=2:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: multiset<nat> := multiset{2};
    var B: multiset<nat> := multiset{2, 3, 3, 3, 3, 3};
    var C := MultisetUnionNat(A, B);
    expect C == multiset{2, 2, 3, 3, 3, 3, 3};
  }

  // Test case for combination {1}/O|C|>=1:
  //   POST: C == A + B
  //   ENSURES: C == A + B
  {
    var A: multiset<nat> := multiset{};
    var B: multiset<nat> := multiset{6};
    var C := MultisetUnionNat(A, B);
    expect C == multiset{6};
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
