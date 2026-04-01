// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Dafny_Verify_tmp_tmphq7j0row_Test_Cases_Index__1000_VER_m.dfy
// Method: Index
// Generated: 2026-04-01 22:27:12

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
  {
    var n := 1;
    expect 1 <= n; // PRE-CHECK
    var i := Index(n);
    expect i == 0;
  }

  // Test case for combination {1}/Bn=2:
  //   PRE:  1 <= n
  //   POST: 0 <= i < n
  {
    var n := 2;
    expect 1 <= n; // PRE-CHECK
    var i := Index(n);
    // expect i == 1; // (actual runtime value — not uniquely determined by spec)
    expect 0 <= i < n;
  }

  // Test case for combination {1}/R3:
  //   PRE:  1 <= n
  //   POST: 0 <= i < n
  {
    var n := 3;
    expect 1 <= n; // PRE-CHECK
    var i := Index(n);
    // expect i == 1; // (actual runtime value — not uniquely determined by spec)
    expect 0 <= i < n;
  }

  // Test case for combination {1}:
  //   POST: m <= x
  //   POST: m <= y
  //   POST: m == x
  {
    var x := 0;
    var y := 1;
    var m := Min(x, y);
    expect m == 0;
  }

  // Test case for combination {2}:
  //   POST: m <= x
  //   POST: m <= y
  //   POST: m == y
  {
    var x := 0;
    var y := -1;
    var m := Min(x, y);
    expect m == -1;
  }

  // Test case for combination {1,2}:
  //   POST: m <= x
  //   POST: m <= y
  //   POST: m == x
  //   POST: m == y
  {
    var x := 0;
    var y := 0;
    var m := Min(x, y);
    expect m == 0;
  }

  // Test case for combination {2}/Bx=1,y=0:
  //   POST: m <= x
  //   POST: m <= y
  //   POST: m == y
  {
    var x := 1;
    var y := 0;
    var m := Min(x, y);
    expect m == 0;
  }

  // Test case for combination {1}:
  //   POST: s == x + y
  //   POST: m == if x >= y then x else y
  {
    var x := 0;
    var y := 0;
    var s, m := MaxSum(x, y);
    expect s == 0;
    expect m == 0;
  }

  // Test case for combination {1}/Bx=0,y=1:
  //   POST: s == x + y
  //   POST: m == if x >= y then x else y
  {
    var x := 0;
    var y := 1;
    var s, m := MaxSum(x, y);
    expect s == 1;
    expect m == 1;
  }

  // Test case for combination {1}/Bx=1,y=0:
  //   POST: s == x + y
  //   POST: m == if x >= y then x else y
  {
    var x := 1;
    var y := 0;
    var s, m := MaxSum(x, y);
    expect s == 1;
    expect m == 1;
  }

  // Test case for combination {1}/Bx=1,y=1:
  //   POST: s == x + y
  //   POST: m == if x >= y then x else y
  {
    var x := 1;
    var y := 1;
    var s, m := MaxSum(x, y);
    expect s == 2;
    expect m == 1;
  }

  // Test case for combination {1,2}:
  //   PRE:  s <= 2 * m
  //   POST: s == x + y
  //   POST: m == x
  //   POST: x <= m
  //   POST: y <= m
  //   POST: m == y
  {
    var s := 0;
    var m := 0;
    expect s <= 2 * m; // PRE-CHECK
    var x, y := ReconstructFromMaxSum(s, m);
    expect x == 0;
    expect y == 0;
  }

  // Test case for combination {1}/Bs=1,m=1:
  //   PRE:  s <= 2 * m
  //   POST: s == x + y
  //   POST: m == x
  //   POST: x <= m
  //   POST: y <= m
  {
    var s := 1;
    var m := 1;
    expect s <= 2 * m; // PRE-CHECK
    var x, y := ReconstructFromMaxSum(s, m);
    expect x == 1;
    expect y == 0;
  }

}

method Failing()
{
  // Test case for combination {1}:
  //   PRE:  s <= 2 * m
  //   POST: s == x + y
  //   POST: m == x
  //   POST: x <= m
  //   POST: y <= m
  {
    var s := 0;
    var m := 1;
    // expect s <= 2 * m; // PRE-CHECK
    var x, y := ReconstructFromMaxSum(s, m);
    // expect x == 1;
    // expect y == -1;
  }

}

method Main()
{
  Passing();
  Failing();
}
