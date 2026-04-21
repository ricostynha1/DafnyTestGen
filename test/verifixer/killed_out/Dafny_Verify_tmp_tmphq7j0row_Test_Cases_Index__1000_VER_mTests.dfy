// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Dafny_Verify_tmp_tmphq7j0row_Test_Cases_Index__1000_VER_m.dfy
// Method: Index
// Generated: 2026-04-08 16:48:04

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


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  1 <= n
  //   POST: 0 <= i < n
  //   ENSURES: 0 <= i < n
  {
    var n := 1;
    var i := Index(n);
    expect i == 0;
  }

  // Test case for combination {1}/Bn=2:
  //   PRE:  1 <= n
  //   POST: 0 <= i < n
  //   ENSURES: 0 <= i < n
  {
    var n := 2;
    var i := Index(n);
    expect i == 1;
    expect 0 <= i < n;
  }

  // Test case for combination {1}/Oi>0:
  //   PRE:  1 <= n
  //   POST: 0 <= i < n
  //   ENSURES: 0 <= i < n
  {
    var n := 3;
    var i := Index(n);
    expect i == 1;
    expect 0 <= i < n;
  }

  // Test case for combination {1}/Oi=0:
  //   PRE:  1 <= n
  //   POST: 0 <= i < n
  //   ENSURES: 0 <= i < n
  {
    var n := 4;
    var i := Index(n);
    expect i == 2;
  }

  // Test case for combination {1}:
  //   POST: m <= x
  //   POST: m <= y
  //   POST: m == x
  //   POST: m == y
  //   ENSURES: m <= x && m <= y
  //   ENSURES: m == x || m == y
  {
    var x := 0;
    var y := 0;
    var m := Min(x, y);
    expect m == 0;
  }

  // Test case for combination {2}:
  //   POST: m <= x
  //   POST: m <= y
  //   POST: m == x
  //   POST: !(m == y)
  //   ENSURES: m <= x && m <= y
  //   ENSURES: m == x || m == y
  {
    var x := 0;
    var y := 1;
    var m := Min(x, y);
    expect m == 0;
  }

  // Test case for combination {3}:
  //   POST: m <= x
  //   POST: m <= y
  //   POST: !(m == x)
  //   POST: m == y
  //   ENSURES: m <= x && m <= y
  //   ENSURES: m == x || m == y
  {
    var x := 0;
    var y := -1;
    var m := Min(x, y);
    expect m == -1;
  }

  // Test case for combination {1}/Bx=1,y=1:
  //   POST: m <= x
  //   POST: m <= y
  //   POST: m == x
  //   POST: m == y
  //   ENSURES: m <= x && m <= y
  //   ENSURES: m == x || m == y
  {
    var x := 1;
    var y := 1;
    var m := Min(x, y);
    expect m == 1;
  }

  // Test case for combination {1}/Om<0:
  //   POST: m <= x
  //   POST: m <= y
  //   POST: m == x
  //   POST: m == y
  //   ENSURES: m <= x && m <= y
  //   ENSURES: m == x || m == y
  {
    var x := -1;
    var y := -1;
    var m := Min(x, y);
    expect m == -1;
  }

  // Test case for combination {2}/Om>0:
  //   POST: m <= x
  //   POST: m <= y
  //   POST: m == x
  //   POST: !(m == y)
  //   ENSURES: m <= x && m <= y
  //   ENSURES: m == x || m == y
  {
    var x := 1;
    var y := 2;
    var m := Min(x, y);
    expect m == 1;
  }

  // Test case for combination {2}/Om<0:
  //   POST: m <= x
  //   POST: m <= y
  //   POST: m == x
  //   POST: !(m == y)
  //   ENSURES: m <= x && m <= y
  //   ENSURES: m == x || m == y
  {
    var x := -1;
    var y := 0;
    var m := Min(x, y);
    expect m == -1;
  }

  // Test case for combination {3}/Om>0:
  //   POST: m <= x
  //   POST: m <= y
  //   POST: !(m == x)
  //   POST: m == y
  //   ENSURES: m <= x && m <= y
  //   ENSURES: m == x || m == y
  {
    var x := 2;
    var y := 1;
    var m := Min(x, y);
    expect m == 1;
  }

  // Test case for combination {3}/Om=0:
  //   POST: m <= x
  //   POST: m <= y
  //   POST: !(m == x)
  //   POST: m == y
  //   ENSURES: m <= x && m <= y
  //   ENSURES: m == x || m == y
  {
    var x := 1;
    var y := 0;
    var m := Min(x, y);
    expect m == 0;
  }

  // Test case for combination {1}:
  //   POST: s == x + y
  //   POST: x >= y
  //   POST: m == x
  //   ENSURES: s == x + y
  //   ENSURES: m == if x >= y then x else y
  {
    var x := 0;
    var y := 0;
    var s, m := MaxSum(x, y);
    expect s == 0;
    expect m == 0;
  }

  // Test case for combination {2}:
  //   POST: s == x + y
  //   POST: !(x >= y)
  //   POST: m == y
  //   ENSURES: s == x + y
  //   ENSURES: m == if x >= y then x else y
  {
    var x := -1;
    var y := 0;
    var s, m := MaxSum(x, y);
    expect s == -1;
    expect m == 0;
  }

  // Test case for combination {1}/Bx=1,y=0:
  //   POST: s == x + y
  //   POST: x >= y
  //   POST: m == x
  //   ENSURES: s == x + y
  //   ENSURES: m == if x >= y then x else y
  {
    var x := 1;
    var y := 0;
    var s, m := MaxSum(x, y);
    expect s == 1;
    expect m == 1;
  }

  // Test case for combination {1}/Bx=1,y=1:
  //   POST: s == x + y
  //   POST: x >= y
  //   POST: m == x
  //   ENSURES: s == x + y
  //   ENSURES: m == if x >= y then x else y
  {
    var x := 1;
    var y := 1;
    var s, m := MaxSum(x, y);
    expect s == 2;
    expect m == 1;
  }

  // Test case for combination {1}/Os<0:
  //   POST: s == x + y
  //   POST: x >= y
  //   POST: m == x
  //   ENSURES: s == x + y
  //   ENSURES: m == if x >= y then x else y
  {
    var x := 2;
    var y := -3;
    var s, m := MaxSum(x, y);
    expect s == -1;
    expect m == 2;
  }

  // Test case for combination {1}/Os=0:
  //   POST: s == x + y
  //   POST: x >= y
  //   POST: m == x
  //   ENSURES: s == x + y
  //   ENSURES: m == if x >= y then x else y
  {
    var x := 4;
    var y := -4;
    var s, m := MaxSum(x, y);
    expect s == 0;
    expect m == 4;
  }

  // Test case for combination {1}/Om>0:
  //   POST: s == x + y
  //   POST: x >= y
  //   POST: m == x
  //   ENSURES: s == x + y
  //   ENSURES: m == if x >= y then x else y
  {
    var x := 3;
    var y := -5;
    var s, m := MaxSum(x, y);
    expect s == -2;
    expect m == 3;
  }

  // Test case for combination {1}/Om<0:
  //   POST: s == x + y
  //   POST: x >= y
  //   POST: m == x
  //   ENSURES: s == x + y
  //   ENSURES: m == if x >= y then x else y
  {
    var x := -1;
    var y := -6;
    var s, m := MaxSum(x, y);
    expect s == -7;
    expect m == -1;
  }

  // Test case for combination {2}/Os>0:
  //   POST: s == x + y
  //   POST: !(x >= y)
  //   POST: m == y
  //   ENSURES: s == x + y
  //   ENSURES: m == if x >= y then x else y
  {
    var x := 0;
    var y := 1;
    var s, m := MaxSum(x, y);
    expect s == 1;
    expect m == 1;
  }

  // Test case for combination {2}/Os=0:
  //   POST: s == x + y
  //   POST: !(x >= y)
  //   POST: m == y
  //   ENSURES: s == x + y
  //   ENSURES: m == if x >= y then x else y
  {
    var x := -2;
    var y := 2;
    var s, m := MaxSum(x, y);
    expect s == 0;
    expect m == 2;
  }

  // Test case for combination {2}/Om>0:
  //   POST: s == x + y
  //   POST: !(x >= y)
  //   POST: m == y
  //   ENSURES: s == x + y
  //   ENSURES: m == if x >= y then x else y
  {
    var x := 1;
    var y := 3;
    var s, m := MaxSum(x, y);
    expect s == 4;
    expect m == 3;
  }

  // Test case for combination {2}/Om<0:
  //   POST: s == x + y
  //   POST: !(x >= y)
  //   POST: m == y
  //   ENSURES: s == x + y
  //   ENSURES: m == if x >= y then x else y
  {
    var x := -3;
    var y := -2;
    var s, m := MaxSum(x, y);
    expect s == -5;
    expect m == -2;
  }

  // Test case for combination {2}/Om=0:
  //   POST: s == x + y
  //   POST: !(x >= y)
  //   POST: m == y
  //   ENSURES: s == x + y
  //   ENSURES: m == if x >= y then x else y
  {
    var x := -2;
    var y := 0;
    var s, m := MaxSum(x, y);
    expect s == -2;
    expect m == 0;
  }

  // Test case for combination {1}:
  //   PRE:  s <= 2 * m
  //   POST: s == x + y
  //   POST: m == x
  //   POST: m == y
  //   POST: x <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == x || m == y) && x <= m && y <= m
  {
    var s := 0;
    var m := 0;
    var x, y := ReconstructFromMaxSum(s, m);
    expect x == 0;
    expect y == 0;
  }

  // Test case for combination {2}/Oy=0:
  //   PRE:  s <= 2 * m
  //   POST: s == x + y
  //   POST: m == x
  //   POST: !(m == y)
  //   POST: x <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == x || m == y) && x <= m && y <= m
  {
    var s := 4;
    var m := 4;
    var x, y := ReconstructFromMaxSum(s, m);
    expect x == 4;
    expect y == 0;
  }

}

method Failing()
{
  // Test case for combination {2}:
  //   PRE:  s <= 2 * m
  //   POST: s == x + y
  //   POST: m == x
  //   POST: !(m == y)
  //   POST: x <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == x || m == y) && x <= m && y <= m
  {
    var s := 0;
    var m := 1;
    var x, y := ReconstructFromMaxSum(s, m);
    // expect x == 1;
    // expect y == -1;
  }

  // Test case for combination {1}/Bs=2,m=1:
  //   PRE:  s <= 2 * m
  //   POST: s == x + y
  //   POST: m == x
  //   POST: m == y
  //   POST: x <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == x || m == y) && x <= m && y <= m
  {
    var s := 2;
    var m := 1;
    var x, y := ReconstructFromMaxSum(s, m);
    // expect x == 1;
    // expect y == 1;
  }

  // Test case for combination {1}/Ox<0:
  //   PRE:  s <= 2 * m
  //   POST: s == x + y
  //   POST: m == x
  //   POST: m == y
  //   POST: x <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == x || m == y) && x <= m && y <= m
  {
    var s := -2;
    var m := -1;
    var x, y := ReconstructFromMaxSum(s, m);
    // expect x == -1;
    // expect y == -1;
  }

  // Test case for combination {1}/Oy>0:
  //   PRE:  s <= 2 * m
  //   POST: s == x + y
  //   POST: m == x
  //   POST: m == y
  //   POST: x <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == x || m == y) && x <= m && y <= m
  {
    var s := 4;
    var m := 2;
    var x, y := ReconstructFromMaxSum(s, m);
    // expect x == 2;
    // expect y == 2;
  }

  // Test case for combination {1}/Oy<0:
  //   PRE:  s <= 2 * m
  //   POST: s == x + y
  //   POST: m == x
  //   POST: m == y
  //   POST: x <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == x || m == y) && x <= m && y <= m
  {
    var s := -4;
    var m := -2;
    var x, y := ReconstructFromMaxSum(s, m);
    // expect x == -2;
    // expect y == -2;
  }

  // Test case for combination {2}/Ox<0:
  //   PRE:  s <= 2 * m
  //   POST: s == x + y
  //   POST: m == x
  //   POST: !(m == y)
  //   POST: x <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == x || m == y) && x <= m && y <= m
  {
    var s := -3;
    var m := -1;
    var x, y := ReconstructFromMaxSum(s, m);
    // expect x == -1;
    // expect y == -2;
  }

  // Test case for combination {2}/Ox=0:
  //   PRE:  s <= 2 * m
  //   POST: s == x + y
  //   POST: m == x
  //   POST: !(m == y)
  //   POST: x <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == x || m == y) && x <= m && y <= m
  {
    var s := -1;
    var m := 0;
    var x, y := ReconstructFromMaxSum(s, m);
    // expect x == 0;
    // expect y == -1;
  }

  // Test case for combination {2}/Oy>0:
  //   PRE:  s <= 2 * m
  //   POST: s == x + y
  //   POST: m == x
  //   POST: !(m == y)
  //   POST: x <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == x || m == y) && x <= m && y <= m
  {
    var s := 3;
    var m := 2;
    var x, y := ReconstructFromMaxSum(s, m);
    // expect x == 2;
    // expect y == 1;
  }

  // Test case for combination {2}/Oy<0:
  //   PRE:  s <= 2 * m
  //   POST: s == x + y
  //   POST: m == x
  //   POST: !(m == y)
  //   POST: x <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == x || m == y) && x <= m && y <= m
  {
    var s := -5;
    var m := -2;
    var x, y := ReconstructFromMaxSum(s, m);
    // expect x == -2;
    // expect y == -3;
  }

  // Test case for combination {3}/Oy>0:
  //   PRE:  s <= 2 * m
  //   POST: s == x + y
  //   POST: !(m == x)
  //   POST: m == y
  //   POST: x <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == x || m == y) && x <= m && y <= m
  {
    var s := -1;
    var m := 1;
    var x, y := ReconstructFromMaxSum(s, m);
    // expect x == -2;
    // expect y == 1;
  }

}

method Main()
{
  Passing();
  Failing();
}
