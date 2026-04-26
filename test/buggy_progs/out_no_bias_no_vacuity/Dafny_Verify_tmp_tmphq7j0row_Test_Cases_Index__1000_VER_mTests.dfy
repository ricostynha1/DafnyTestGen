// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Dafny_Verify_tmp_tmphq7j0row_Test_Cases_Index__1000_VER_m.dfy
// Method: Index
// Generated: 2026-04-24 22:00:47

// Dafny_Verify_tmp_tmphq7j0row_Test_Cases_Index.dfy

method Index(n: int) returns (i: int)
  requires 1 <= n
  ensures 0 <= i < n
  decreases n
{
  i := n / 2;
}

method Min(x: int, y: int) returns (m: int)
  ensures m <= x && m <= y
  ensures m == x || m == y
  decreases x, y
{
  if x >= y {
    m := y;
  } else {
    m := x;
  }
  assert m <= x && m <= y;
}

method Max(x: int, y: int) returns (m: int)
  decreases x, y
{
  if x >= y {
    m := x;
  } else {
    m := y;
  }
  assert m >= x && m >= y;
}

method MaxSum(x: int, y: int)
    returns (s: int, m: int)
  ensures s == x + y
  ensures m == if x >= y then x else y
  decreases x, y
{
  s := x + y;
  if x >= y {
    m := x;
  } else {
    m := y;
  }
}

method MaxSumCaller()
{
  var x: int := 1928;
  var y: int := 1;
  var a, b: int;
  a, b := MaxSum(x, y);
  assert a == 1929;
  assert b == 1928;
}

method ReconstructFromMaxSum(s: int, m: int)
    returns (x: int, y: int)
  requires s <= 2 * m
  ensures s == x + y
  ensures (m == x || m == y) && x <= m && y <= m
  decreases s, m
{
  x := m;
  y := m - m;
}

method TestMaxSum(x: int, y: int)
  decreases x, y
{
  var s, m := MaxSum(x, y);
  var xx, yy := ReconstructFromMaxSum(s, m);
  assert (xx == x && yy == y) || (xx == y && yy == x);
}


method TestsForIndex()
{
  // Test case for combination {1}/Rel:
  //   PRE:  1 <= n
  //   POST Q1: 0 <= i
  //   POST Q2: i < n
  {
    var n := 1;
    var i := Index(n);
    expect i == 0;
  }

  // Test case for combination {1}/Bn=2:
  //   PRE:  1 <= n
  //   POST Q1: 0 <= i
  //   POST Q2: i < n
  {
    var n := 2;
    var i := Index(n);
    expect i == 0 || i == 1;
    expect i == 1; // observed from implementation
  }

  // Test case for combination {1}/Bi=1:
  //   PRE:  1 <= n
  //   POST Q1: 0 <= i
  //   POST Q2: i < n
  {
    var n := 3;
    var i := Index(n);
    expect i == 1 || i == 0 || i == 2;
    expect i == 1; // observed from implementation
  }

  // Test case for combination {1}/R4:
  //   PRE:  1 <= n
  //   POST Q1: 0 <= i
  //   POST Q2: i < n
  {
    var n := 4;
    var i := Index(n);
    expect i == 0 || i == 1 || i == 2 || i == 3;
    expect i == 2; // observed from implementation
  }

  // Test case for combination {1}/R5:
  //   PRE:  1 <= n
  //   POST Q1: 0 <= i < n
  {
    var n := 5;
    var i := Index(n);
    expect 0 <= i < n;
    expect i == 2; // observed from implementation
  }

  // Test case for combination {1}/R6:
  //   PRE:  1 <= n
  //   POST Q1: 0 <= i < n
  {
    var n := 6;
    var i := Index(n);
    expect 0 <= i < n;
    expect i == 3; // observed from implementation
  }

  // Test case for combination {1}/R7:
  //   PRE:  1 <= n
  //   POST Q1: 0 <= i < n
  {
    var n := 7;
    var i := Index(n);
    expect 0 <= i < n;
    expect i == 3; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   PRE:  1 <= n
  //   POST Q1: 0 <= i < n
  {
    var n := 8;
    var i := Index(n);
    expect 0 <= i < n;
    expect i == 4; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   PRE:  1 <= n
  //   POST Q1: 0 <= i < n
  {
    var n := 9;
    var i := Index(n);
    expect 0 <= i < n;
    expect i == 4; // observed from implementation
  }

}

method TestsForMin()
{
  // Test case for combination {1}/Rel:
  //   POST Q1: m == x
  //   POST Q2: m <= y
  {
    var x := 0;
    var y := 0;
    var m := Min(x, y);
    expect m == 0;
  }

  // Test case for combination {2}/Rel:
  //   POST Q1: m < x
  //   POST Q2: m == y
  {
    var x := 0;
    var y := -2;
    var m := Min(x, y);
    expect m == -2;
  }

  // Test case for combination {1}/Ox>0:
  //   POST Q1: m == x
  //   POST Q2: m <= y
  {
    var x := 1;
    var y := 1;
    var m := Min(x, y);
    expect m == 1;
  }

  // Test case for combination {1}/Ox<0:
  //   POST Q1: m == x
  //   POST Q2: m <= y
  {
    var x := -1;
    var y := 0;
    var m := Min(x, y);
    expect m == -1;
  }

  // Test case for combination {1}/Oy<0:
  //   POST Q1: m == x
  //   POST Q2: m <= y
  {
    var x := -2;
    var y := -2;
    var m := Min(x, y);
    expect m == -2;
  }

  // Test case for combination {2}/Ox>0:
  //   POST Q1: m < x
  //   POST Q2: m == y
  {
    var x := 1;
    var y := 0;
    var m := Min(x, y);
    expect m == 0;
  }

  // Test case for combination {2}/Ox<0:
  //   POST Q1: m < x
  //   POST Q2: m == y
  {
    var x := -1;
    var y := -2;
    var m := Min(x, y);
    expect m == -2;
  }

  // Test case for combination {2}/Oy>0:
  //   POST Q1: m < x
  //   POST Q2: m == y
  {
    var x := 2;
    var y := 1;
    var m := Min(x, y);
    expect m == 1;
  }

  // Test case for combination {1}/Ox=0/R5:
  //   POST Q1: m == x
  //   POST Q2: m <= y
  {
    var x := 0;
    var y := 1;
    var m := Min(x, y);
    expect m == 0;
  }

}

method TestsForMaxSum()
{
  // Test case for combination {1}:
  //   POST Q1: s == x + y
  //   POST Q2: x >= y
  //   POST Q3: m == x
  {
    var x := 0;
    var y := 0;
    var s, m := MaxSum(x, y);
    expect s == 0;
    expect m == 0;
  }

  // Test case for combination {2}:
  //   POST Q1: s == x + y
  //   POST Q2: x < y
  //   POST Q3: m == y
  {
    var x := -1;
    var y := 0;
    var s, m := MaxSum(x, y);
    expect s == -1;
    expect m == 0;
  }

  // Test case for combination {1}/By=x-1:
  //   POST Q1: s == x + y
  //   POST Q2: x >= y
  //   POST Q3: m == x
  {
    var x := 2;
    var y := 1;
    var s, m := MaxSum(x, y);
    expect s == 3;
    expect m == 2;
  }

  // Test case for combination {1}/Ox<0:
  //   POST Q1: s == x + y
  //   POST Q2: x >= y
  //   POST Q3: m == x
  {
    var x := -1;
    var y := -1;
    var s, m := MaxSum(x, y);
    expect s == -2;
    expect m == -1;
  }

  // Test case for combination {2}/Ox=0:
  //   POST Q1: s == x + y
  //   POST Q2: x < y
  //   POST Q3: m == y
  {
    var x := 0;
    var y := 1;
    var s, m := MaxSum(x, y);
    expect s == 1;
    expect m == 1;
  }

  // Test case for combination {2}/Ox>0:
  //   POST Q1: s == x + y
  //   POST Q2: x < y
  //   POST Q3: m == y
  {
    var x := 1;
    var y := 2;
    var s, m := MaxSum(x, y);
    expect s == 3;
    expect m == 2;
  }

  // Test case for combination {2}/Oy<0:
  //   POST Q1: s == x + y
  //   POST Q2: x < y
  //   POST Q3: m == y
  {
    var x := -2;
    var y := -1;
    var s, m := MaxSum(x, y);
    expect s == -3;
    expect m == -1;
  }

  // Test case for combination {2}/Os=0:
  //   POST Q1: s == x + y
  //   POST Q2: x < y
  //   POST Q3: m == y
  {
    var x := -1;
    var y := 1;
    var s, m := MaxSum(x, y);
    expect s == 0;
    expect m == 1;
  }

  // Test case for combination {1}/R4:
  //   POST Q1: s == x + y
  //   POST Q2: x >= y
  //   POST Q3: m == x
  {
    var x := 3;
    var y := -2;
    var s, m := MaxSum(x, y);
    expect s == 1;
    expect m == 3;
  }

  // Test case for combination {1}/R5:
  //   POST Q1: s == x + y
  //   POST Q2: x >= y
  //   POST Q3: m == x
  {
    var x := -2;
    var y := -3;
    var s, m := MaxSum(x, y);
    expect s == -5;
    expect m == -2;
  }

}

method TestsForReconstructFromMaxSum()
{
  // Test case for combination {1}/Rel:
  //   PRE:  s <= 2 * m
  //   POST Q1: s == x + y
  //   POST Q2: m == x
  //   POST Q3: x <= m
  //   POST Q4: y <= m
  {
    var s := 0;
    var m := 0;
    var x, y := ReconstructFromMaxSum(s, m);
    expect x == 0;
    expect y == 0;
  }

  // Test case for combination {1}/By=m-1:
  //   PRE:  s <= 2 * m
  //   POST Q1: s == x + y
  //   POST Q2: m == x
  //   POST Q3: x <= m
  //   POST Q4: y <= m
  {
    var s := -1;
    var m := 0;
    var x, y := ReconstructFromMaxSum(s, m);
    expect x == 0 || x == -1;
    expect y == -1 || y == 0;
    expect x == 0; // observed from implementation
    expect y == 0; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Os>0:
  //   PRE:  s <= 2 * m
  //   POST Q1: s == x + y
  //   POST Q2: m == x
  //   POST Q3: x <= m
  //   POST Q4: y <= m
  {
    var s := 2;
    var m := 1;
    var x, y := ReconstructFromMaxSum(s, m);
    // actual runtime state: y=0
    // expect x == 1; // LHS=1, RHS=1
    // expect y == 1; // LHS=0, RHS=1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Om<0:
  //   PRE:  s <= 2 * m
  //   POST Q1: s == x + y
  //   POST Q2: m == x
  //   POST Q3: x <= m
  //   POST Q4: y <= m
  {
    var s := -2;
    var m := -1;
    var x, y := ReconstructFromMaxSum(s, m);
    // actual runtime state: y=0
    // expect x == -1; // LHS=-1, RHS=-1
    // expect y == -1; // LHS=0, RHS=-1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Os=0:
  //   PRE:  s <= 2 * m
  //   POST Q1: s == x + y
  //   POST Q2: m != x
  //   POST Q3: m == y
  //   POST Q4: x <= m
  //   POST Q5: y <= m
  {
    var s := 0;
    var m := 1;
    var x, y := ReconstructFromMaxSum(s, m);
    // actual runtime state: x=1, y=0
    // expect x == -1 || x == 1; // got true
    // expect y == 1 || y == -1; // got false
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Os>0:
  //   PRE:  s <= 2 * m
  //   POST Q1: s == x + y
  //   POST Q2: m != x
  //   POST Q3: m == y
  //   POST Q4: x <= m
  //   POST Q5: y <= m
  {
    var s := 1;
    var m := 2;
    var x, y := ReconstructFromMaxSum(s, m);
    // actual runtime state: x=2, y=0
    // expect x == -1 || x == 2; // got true
    // expect y == 2 || y == -1; // got false
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Om<0:
  //   PRE:  s <= 2 * m
  //   POST Q1: s == x + y
  //   POST Q2: m != x
  //   POST Q3: m == y
  //   POST Q4: x <= m
  //   POST Q5: y <= m
  {
    var s := -3;
    var m := -1;
    var x, y := ReconstructFromMaxSum(s, m);
    // actual runtime state: x=-1, y=0
    // expect x == -2 || x == -1; // got true
    // expect y == -1 || y == -2; // got false
  }

  // Test case for combination {2}/Ox=0:
  //   PRE:  s <= 2 * m
  //   POST Q1: s == x + y
  //   POST Q2: m != x
  //   POST Q3: m == y
  //   POST Q4: x <= m
  //   POST Q5: y <= m
  {
    var s := 1;
    var m := 1;
    var x, y := ReconstructFromMaxSum(s, m);
    expect x == 0 || x == 1;
    expect y == 1 || y == 0;
    expect x == 1; // observed from implementation
    expect y == 0; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Ox>0:
  //   PRE:  s <= 2 * m
  //   POST Q1: s == x + y
  //   POST Q2: m != x
  //   POST Q3: m == y
  //   POST Q4: x <= m
  //   POST Q5: y <= m
  {
    var s := 5;
    var m := 3;
    var x, y := ReconstructFromMaxSum(s, m);
    // actual runtime state: x=3, y=0
    // expect x == 2 || x == 3; // got true
    // expect y == 3 || y == 2; // got false
  }

}

method Main()
{
  TestsForIndex();
  print "TestsForIndex: all non-failing tests passed!\n";
  TestsForMin();
  print "TestsForMin: all non-failing tests passed!\n";
  TestsForMaxSum();
  print "TestsForMaxSum: all non-failing tests passed!\n";
  TestsForReconstructFromMaxSum();
  print "TestsForReconstructFromMaxSum: all non-failing tests passed!\n";
}
