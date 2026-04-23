// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Dafny_Verify_tmp_tmphq7j0row_Test_Cases_Index__1000_VER_m.dfy
// Method: Index
// Generated: 2026-04-22 21:34:34

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
  //   POST Q1: 0 <= i < n
  {
    var n := 10;
    var i := Index(n);
    expect 0 <= i < n;
    expect i == 5; // observed from implementation
  }

  // Test case for combination {1}/Bn=1:
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
    expect i == 1 || i == 0;
    expect i == 1; // observed from implementation
  }

}

method TestsForMin()
{
  // Test case for combination {1}/Rel:
  //   POST Q1: m == x
  //   POST Q2: m <= y
  {
    var x := -10;
    var y := -10;
    var m := Min(x, y);
    expect m == -10;
  }

  // Test case for combination {2}/Rel:
  //   POST Q1: m < x
  //   POST Q2: m == y
  {
    var x := -9;
    var y := -10;
    var m := Min(x, y);
    expect m == -10;
  }

  // Test case for combination {1}/Ox=0:
  //   POST Q1: m == x
  //   POST Q2: m <= y
  {
    var x := 0;
    var y := 10;
    var m := Min(x, y);
    expect m == 0;
  }

  // Test case for combination {1}/Ox>0:
  //   POST Q1: m == x
  //   POST Q2: m <= y
  {
    var x := 10;
    var y := 10;
    var m := Min(x, y);
    expect m == 10;
  }

}

method TestsForMaxSum()
{
  // Test case for combination {1}:
  //   POST Q1: s == x + y
  //   POST Q2: x >= y
  //   POST Q3: m == x
  {
    var x := -10;
    var y := -10;
    var s, m := MaxSum(x, y);
    expect s == -20;
    expect m == -10;
  }

  // Test case for combination {2}:
  //   POST Q1: s == x + y
  //   POST Q2: x < y
  //   POST Q3: m == y
  {
    var x := -10;
    var y := -9;
    var s, m := MaxSum(x, y);
    expect s == -19;
    expect m == -9;
  }

  // Test case for combination {1}/By=x-1:
  //   POST Q1: s == x + y
  //   POST Q2: x >= y
  //   POST Q3: m == x
  {
    var x := -9;
    var y := -10;
    var s, m := MaxSum(x, y);
    expect s == -19;
    expect m == -9;
  }

  // Test case for combination {1}/Ox=0:
  //   POST Q1: s == x + y
  //   POST Q2: x >= y
  //   POST Q3: m == x
  {
    var x := 0;
    var y := -10;
    var s, m := MaxSum(x, y);
    expect s == -10;
    expect m == 0;
  }

}

method TestsForReconstructFromMaxSum()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Rel:
  //   PRE:  s <= 2 * m
  //   POST Q1: s == x + y
  //   POST Q2: m == x
  //   POST Q3: x <= m
  //   POST Q4: y <= m
  {
    var s := -10;
    var m := -5;
    var x, y := ReconstructFromMaxSum(s, m);
    // actual runtime state: y=0
    // expect x == -5; // LHS=-5, RHS=-5
    // expect y == -5; // LHS=0, RHS=-5
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Rel:
  //   PRE:  s <= 2 * m
  //   POST Q1: s == x + y
  //   POST Q2: (m == x || m == y) && x <= m && y <= m
  {
    var s := -10;
    var m := -1;
    var x, y := ReconstructFromMaxSum(s, m);
    // actual runtime state: x=-1, y=0
    // expect (m == x || m == y) && x <= m && y <= m; // got false
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Bx=m-1:
  //   PRE:  s <= 2 * m
  //   POST Q1: s == x + y
  //   POST Q2: m != x
  //   POST Q3: m == y
  //   POST Q4: x <= m
  //   POST Q5: y <= m
  {
    var s := -9;
    var m := -4;
    var x, y := ReconstructFromMaxSum(s, m);
    // actual runtime state: x=-4, y=0
    // expect x == -5 || x == -4; // got true
    // expect y == -4 || y == -5; // got false
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
