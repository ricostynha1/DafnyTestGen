// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\MultisetOps.dfy
// Method: MultisetContains
// Generated: 2026-03-28 00:33:11

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


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  |M| > 0
  //   POST: r == (x in M)
  {
    var M: multiset<int> := multiset{7};
    var x := 0;
    var r := MultisetContains(M, x);
    expect r == false;
  }

  // Test case for combination {1}/BM=1,x=0:
  //   PRE:  |M| > 0
  //   POST: r == (x in M)
  {
    var M: multiset<int> := multiset{0};
    var x := 0;
    var r := MultisetContains(M, x);
    expect r == true;
  }

  // Test case for combination {1}/BM=1,x=1:
  //   PRE:  |M| > 0
  //   POST: r == (x in M)
  {
    var M: multiset<int> := multiset{0};
    var x := 1;
    var r := MultisetContains(M, x);
    expect r == false;
  }

  // Test case for combination {1}/BM=2,x=0:
  //   PRE:  |M| > 0
  //   POST: r == (x in M)
  {
    var M: multiset<int> := multiset{0, 0};
    var x := 0;
    var r := MultisetContains(M, x);
    expect r == true;
  }

  // Test case for combination {1}:
  //   POST: C == A + B
  {
    var A: multiset<int> := multiset{3, 3, 3};
    var B: multiset<int> := multiset{0, 0, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6};
    var C := MultisetUnion(A, B);
    expect C == multiset{0, 0, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6};
  }

  // Test case for combination {1}/BA=0,B=0:
  //   POST: C == A + B
  {
    var A: multiset<int> := multiset{};
    var B: multiset<int> := multiset{};
    var C := MultisetUnion(A, B);
    expect C == multiset{};
  }

  // Test case for combination {1}/BA=0,B=1:
  //   POST: C == A + B
  {
    var A: multiset<int> := multiset{};
    var B: multiset<int> := multiset{0};
    var C := MultisetUnion(A, B);
    expect C == multiset{0};
  }

  // Test case for combination {1}/BA=0,B=2:
  //   POST: C == A + B
  {
    var A: multiset<int> := multiset{};
    var B: multiset<int> := multiset{1, 1};
    var C := MultisetUnion(A, B);
    expect C == multiset{1, 1};
  }

  // Test case for combination {1}:
  //   POST: C == A * B
  {
    var A: multiset<int> := multiset{0, 0, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6};
    var B: multiset<int> := multiset{0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6};
    var C := MultisetIntersection(A, B);
    expect C == multiset{0, 0, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6};
  }

  // Test case for combination {1}/BA=0,B=0:
  //   POST: C == A * B
  {
    var A: multiset<int> := multiset{};
    var B: multiset<int> := multiset{};
    var C := MultisetIntersection(A, B);
    expect C == multiset{};
  }

  // Test case for combination {1}/BA=0,B=1:
  //   POST: C == A * B
  {
    var A: multiset<int> := multiset{};
    var B: multiset<int> := multiset{1};
    var C := MultisetIntersection(A, B);
    expect C == multiset{};
  }

  // Test case for combination {1}/BA=0,B=2:
  //   POST: C == A * B
  {
    var A: multiset<int> := multiset{};
    var B: multiset<int> := multiset{2, 4};
    var C := MultisetIntersection(A, B);
    expect C == multiset{};
  }

  // Test case for combination {1}:
  //   POST: C == A - B
  {
    var A: multiset<int> := multiset{0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 7, 7, 7, 7, 7, 7, 7};
    var B: multiset<int> := multiset{6};
    var C := MultisetDifference(A, B);
    expect C == multiset{0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 7, 7, 7, 7, 7, 7, 7};
  }

  // Test case for combination {1}/BA=0,B=0:
  //   POST: C == A - B
  {
    var A: multiset<int> := multiset{};
    var B: multiset<int> := multiset{};
    var C := MultisetDifference(A, B);
    expect C == multiset{};
  }

  // Test case for combination {1}/BA=0,B=1:
  //   POST: C == A - B
  {
    var A: multiset<int> := multiset{};
    var B: multiset<int> := multiset{4};
    var C := MultisetDifference(A, B);
    expect C == multiset{};
  }

  // Test case for combination {1}/BA=0,B=2:
  //   POST: C == A - B
  {
    var A: multiset<int> := multiset{};
    var B: multiset<int> := multiset{4, 5};
    var C := MultisetDifference(A, B);
    expect C == multiset{};
  }

  // Test case for combination P{1}/{1}:
  //   PRE:  A <= B || !(A <= B)
  //   POST: r == (A <= B)
  {
    var A: multiset<int> := multiset{};
    var B: multiset<int> := multiset{};
    var r := MultisetSubset(A, B);
    expect r == true;
  }

  // Test case for combination P{2}/{1}:
  //   PRE:  A <= B || !(A <= B)
  //   POST: r == (A <= B)
  {
    var A: multiset<int> := multiset{7};
    var B: multiset<int> := multiset{};
    var r := MultisetSubset(A, B);
    expect r == false;
  }

  // Test case for combination P{1}/{1}/BA=3,B=3:
  //   PRE:  A <= B || !(A <= B)
  //   POST: r == (A <= B)
  {
    var A: multiset<int> := multiset{0, 0, 0};
    var B: multiset<int> := multiset{0, 0, 0};
    var r := MultisetSubset(A, B);
    expect r == true;
  }

  // Test case for combination P{1}/{1}/BA=2,B=2:
  //   PRE:  A <= B || !(A <= B)
  //   POST: r == (A <= B)
  {
    var A: multiset<int> := multiset{0, 0};
    var B: multiset<int> := multiset{0, 0};
    var r := MultisetSubset(A, B);
    expect r == true;
  }

  // Test case for combination {1}:
  //   POST: r == M[x]
  {
    var M: multiset<int> := multiset{0, 0, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6};
    var x := 7;
    var r := MultisetCount(M, x);
    expect r == 0;
  }

  // Test case for combination {1}/BM=0,x=0:
  //   POST: r == M[x]
  {
    var M: multiset<int> := multiset{};
    var x := 0;
    var r := MultisetCount(M, x);
    expect r == 0;
  }

  // Test case for combination {1}/BM=0,x=1:
  //   POST: r == M[x]
  {
    var M: multiset<int> := multiset{};
    var x := 1;
    var r := MultisetCount(M, x);
    expect r == 0;
  }

  // Test case for combination {1}/BM=1,x=0:
  //   POST: r == M[x]
  {
    var M: multiset<int> := multiset{0};
    var x := 0;
    var r := MultisetCount(M, x);
    expect r == 1;
  }

  // Test case for combination {1}:
  //   POST: C == M + multiset{x}
  //   POST: x in C
  {
    var M: multiset<int> := multiset{0, 0, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 7};
    var x := 7;
    var C := AddElement(M, x);
    expect C == multiset{0, 0, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 7, 7};
  }

  // Test case for combination {1}/BM=0,x=0:
  //   POST: C == M + multiset{x}
  //   POST: x in C
  {
    var M: multiset<int> := multiset{};
    var x := 0;
    var C := AddElement(M, x);
    expect C == multiset{0};
  }

  // Test case for combination {1}/BM=0,x=1:
  //   POST: C == M + multiset{x}
  //   POST: x in C
  {
    var M: multiset<int> := multiset{};
    var x := 1;
    var C := AddElement(M, x);
    expect C == multiset{1};
  }

  // Test case for combination {1}/BM=1,x=0:
  //   POST: C == M + multiset{x}
  //   POST: x in C
  {
    var M: multiset<int> := multiset{0};
    var x := 0;
    var C := AddElement(M, x);
    expect C == multiset{0, 0};
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
