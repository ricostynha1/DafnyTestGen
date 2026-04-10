// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\stunning-palm-tree_tmp_tmpr84c2iwh_ch1.dfy
// Method: Triple
// Generated: 2026-04-08 19:18:59

// stunning-palm-tree_tmp_tmpr84c2iwh_ch1.dfy

method Triple(x: int) returns (r: int)
  ensures r == 3 * x
  decreases x
{
  var y := 2 * x;
  r := y + x;
  assert r == 3 * x;
}

method Caller()
{
  var t := Triple(18);
  assert t < 100;
}

method MinUnderSpec(x: int, y: int) returns (r: int)
  ensures r <= x && r <= y
  decreases x, y
{
  if x <= y {
    r := x - 1;
  } else {
    r := y - 1;
  }
}

method Min(x: int, y: int) returns (r: int)
  ensures r <= x && r <= y
  ensures r == x || r == y
  decreases x, y
{
  if x <= y {
    r := x;
  } else {
    r := y;
  }
}

method MaxSum(x: int, y: int)
    returns (s: int, m: int)
  ensures s == x + y
  ensures x <= m && y <= m
  ensures m == x || m == y
  decreases x, y

method MaxSumCaller()
{
  var s, m := MaxSum(1928, 1);
  assert s == 1929;
  assert m == 1928;
}

method ReconstructFromMaxSum(s: int, m: int)
    returns (x: int, y: int)
  requires s - m <= m
  ensures s == x + y
  ensures (m == y || m == x) && x <= m && y <= m
  decreases s, m
{
  x := m;
  y := s - m;
}

method TestMaxSum(x: int, y: int)
  decreases x, y
{
  var s, m := MaxSum(x, y);
  var xx, yy := ReconstructFromMaxSum(s, m);
  assert (xx == x && yy == y) || (xx == y && yy == x);
}

function Average(a: int, b: int): int
  decreases a, b
{
  (a + b) / 2
}

method Triple'(x: int) returns (r: int)
  ensures Average(2 * r, 6 * x) == 6 * x
  decreases x
{
  r := x + x + x;
}


method GeneratedTests_Triple()
{
  // Test case for combination {1}:
  //   POST: r == 3 * x
  //   ENSURES: r == 3 * x
  {
    var x := 0;
    var r := Triple(x);
    expect r == 0;
  }

  // Test case for combination {1}/Bx=1:
  //   POST: r == 3 * x
  //   ENSURES: r == 3 * x
  {
    var x := 1;
    var r := Triple(x);
    expect r == 3;
  }

  // Test case for combination {1}/Or>0:
  //   POST: r == 3 * x
  //   ENSURES: r == 3 * x
  {
    var x := 2;
    var r := Triple(x);
    expect r == 6;
  }

  // Test case for combination {1}/Or<0:
  //   POST: r == 3 * x
  //   ENSURES: r == 3 * x
  {
    var x := -1;
    var r := Triple(x);
    expect r == -3;
  }

}

method GeneratedTests_MinUnderSpec()
{
  // Test case for combination {1}:
  //   POST: r <= x
  //   POST: r <= y
  //   ENSURES: r <= x && r <= y
  {
    var x := 0;
    var y := 0;
    var r := MinUnderSpec(x, y);
    expect r <= x;
    expect r <= y;
  }

  // Test case for combination {1}/Bx=0,y=1:
  //   POST: r <= x
  //   POST: r <= y
  //   ENSURES: r <= x && r <= y
  {
    var x := 0;
    var y := 1;
    var r := MinUnderSpec(x, y);
    expect r <= x;
    expect r <= y;
  }

  // Test case for combination {1}/Bx=1,y=0:
  //   POST: r <= x
  //   POST: r <= y
  //   ENSURES: r <= x && r <= y
  {
    var x := 1;
    var y := 0;
    var r := MinUnderSpec(x, y);
    expect r <= x;
    expect r <= y;
  }

  // Test case for combination {1}/Bx=1,y=1:
  //   POST: r <= x
  //   POST: r <= y
  //   ENSURES: r <= x && r <= y
  {
    var x := 1;
    var y := 1;
    var r := MinUnderSpec(x, y);
    expect r <= x;
    expect r <= y;
  }

  // Test case for combination {1}/Or>0:
  //   POST: r <= x
  //   POST: r <= y
  //   ENSURES: r <= x && r <= y
  {
    var x := 2;
    var y := 2;
    var r := MinUnderSpec(x, y);
    expect r <= x;
    expect r <= y;
  }

  // Test case for combination {1}/Or<0:
  //   POST: r <= x
  //   POST: r <= y
  //   ENSURES: r <= x && r <= y
  {
    var x := -1;
    var y := -1;
    var r := MinUnderSpec(x, y);
    expect r <= x;
    expect r <= y;
  }

  // Test case for combination {1}/Or=0:
  //   POST: r <= x
  //   POST: r <= y
  //   ENSURES: r <= x && r <= y
  {
    var x := 2;
    var y := 0;
    var r := MinUnderSpec(x, y);
    expect r == 0;
  }

}

method GeneratedTests_Min()
{
  // Test case for combination {1}:
  //   POST: r <= x
  //   POST: r <= y
  //   POST: r == y
  //   POST: r == y
  //   ENSURES: r <= x && r <= y
  //   ENSURES: r == x || r == y
  {
    var x := 0;
    var y := 0;
    var r := Min(x, y);
    expect r == 0;
  }

  // Test case for combination {2}:
  //   POST: r <= x
  //   POST: r <= y
  //   POST: r == y
  //   POST: !(r == y)
  //   ENSURES: r <= x && r <= y
  //   ENSURES: r == x || r == y
  {
    var x := 0;
    var y := 1;
    var r := Min(x, y);
    expect r == 0;
  }

  // Test case for combination {3}:
  //   POST: r <= x
  //   POST: r <= y
  //   POST: !(r == x)
  //   POST: r == y
  //   ENSURES: r <= x && r <= y
  //   ENSURES: r == x || r == y
  {
    var x := 0;
    var y := -1;
    var r := Min(x, y);
    expect r == -1;
  }

  // Test case for combination {1}/Bx=1,y=1:
  //   POST: r <= x
  //   POST: r <= y
  //   POST: r == y
  //   POST: r == y
  //   ENSURES: r <= x && r <= y
  //   ENSURES: r == x || r == y
  {
    var x := 1;
    var y := 1;
    var r := Min(x, y);
    expect r == 1;
  }

  // Test case for combination {1}/Or<0:
  //   POST: r <= x
  //   POST: r <= y
  //   POST: r == y
  //   POST: r == y
  //   ENSURES: r <= x && r <= y
  //   ENSURES: r == x || r == y
  {
    var x := -1;
    var y := -1;
    var r := Min(x, y);
    expect r == -1;
  }

  // Test case for combination {2}/Or>0:
  //   POST: r <= x
  //   POST: r <= y
  //   POST: r == y
  //   POST: !(r == y)
  //   ENSURES: r <= x && r <= y
  //   ENSURES: r == x || r == y
  {
    var x := 1;
    var y := 2;
    var r := Min(x, y);
    expect r == 1;
  }

  // Test case for combination {2}/Or<0:
  //   POST: r <= x
  //   POST: r <= y
  //   POST: r == y
  //   POST: !(r == y)
  //   ENSURES: r <= x && r <= y
  //   ENSURES: r == x || r == y
  {
    var x := -1;
    var y := 0;
    var r := Min(x, y);
    expect r == -1;
  }

  // Test case for combination {3}/Or>0:
  //   POST: r <= x
  //   POST: r <= y
  //   POST: !(r == x)
  //   POST: r == y
  //   ENSURES: r <= x && r <= y
  //   ENSURES: r == x || r == y
  {
    var x := 2;
    var y := 1;
    var r := Min(x, y);
    expect r == 1;
  }

  // Test case for combination {3}/Or=0:
  //   POST: r <= x
  //   POST: r <= y
  //   POST: !(r == x)
  //   POST: r == y
  //   ENSURES: r <= x && r <= y
  //   ENSURES: r == x || r == y
  {
    var x := 1;
    var y := 0;
    var r := Min(x, y);
    expect r == 0;
  }

}

method GeneratedTests_ReconstructFromMaxSum()
{
  // Test case for combination {1}:
  //   PRE:  s - m <= m
  //   POST: s == x + y
  //   POST: m == x
  //   POST: x <= m
  //   POST: y <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == y || m == x) && x <= m && y <= m
  {
    var s := 0;
    var m := 0;
    var x, y := ReconstructFromMaxSum(s, m);
    expect x == 0;
    expect y == 0;
  }

  // Test case for combination {2}:
  //   PRE:  s - m <= m
  //   POST: s == x + y
  //   POST: m == x
  //   POST: x <= m
  //   POST: y <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == y || m == x) && x <= m && y <= m
  {
    var s := 0;
    var m := 1;
    var x, y := ReconstructFromMaxSum(s, m);
    expect x == -1;
    expect y == 1;
  }

  // Test case for combination {2}/Bs=1,m=1:
  //   PRE:  s - m <= m
  //   POST: s == x + y
  //   POST: m == x
  //   POST: x <= m
  //   POST: y <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == y || m == x) && x <= m && y <= m
  {
    var s := 1;
    var m := 1;
    var x, y := ReconstructFromMaxSum(s, m);
    expect x == 0;
    expect y == 1;
  }

  // Test case for combination {1}/Ox>0:
  //   PRE:  s - m <= m
  //   POST: s == x + y
  //   POST: m == x
  //   POST: x <= m
  //   POST: y <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == y || m == x) && x <= m && y <= m
  {
    var s := 2;
    var m := 1;
    var x, y := ReconstructFromMaxSum(s, m);
    expect x == 1;
    expect y == 1;
  }

  // Test case for combination {1}/Ox<0:
  //   PRE:  s - m <= m
  //   POST: s == x + y
  //   POST: m == x
  //   POST: x <= m
  //   POST: y <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == y || m == x) && x <= m && y <= m
  {
    var s := -2;
    var m := -1;
    var x, y := ReconstructFromMaxSum(s, m);
    expect x == -1;
    expect y == -1;
  }

  // Test case for combination {1}/Oy>0:
  //   PRE:  s - m <= m
  //   POST: s == x + y
  //   POST: m == x
  //   POST: x <= m
  //   POST: y <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == y || m == x) && x <= m && y <= m
  {
    var s := 4;
    var m := 2;
    var x, y := ReconstructFromMaxSum(s, m);
    expect x == 2;
    expect y == 2;
  }

  // Test case for combination {1}/Oy<0:
  //   PRE:  s - m <= m
  //   POST: s == x + y
  //   POST: m == x
  //   POST: x <= m
  //   POST: y <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == y || m == x) && x <= m && y <= m
  {
    var s := -4;
    var m := -2;
    var x, y := ReconstructFromMaxSum(s, m);
    expect x == -2;
    expect y == -2;
  }

  // Test case for combination {2}/Ox>0:
  //   PRE:  s - m <= m
  //   POST: s == x + y
  //   POST: m == x
  //   POST: x <= m
  //   POST: y <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == y || m == x) && x <= m && y <= m
  {
    var s := 3;
    var m := 2;
    var x, y := ReconstructFromMaxSum(s, m);
    expect x == 1;
    expect y == 2;
  }

  // Test case for combination {2}/Ox=0:
  //   PRE:  s - m <= m
  //   POST: s == x + y
  //   POST: m == x
  //   POST: x <= m
  //   POST: y <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == y || m == x) && x <= m && y <= m
  {
    var s := 4;
    var m := 4;
    var x, y := ReconstructFromMaxSum(s, m);
    expect x == 0;
    expect y == 4;
  }

  // Test case for combination {2}/Oy>0:
  //   PRE:  s - m <= m
  //   POST: s == x + y
  //   POST: m == x
  //   POST: x <= m
  //   POST: y <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == y || m == x) && x <= m && y <= m
  {
    var s := -1;
    var m := 1;
    var x, y := ReconstructFromMaxSum(s, m);
    expect x == -2;
    expect y == 1;
  }

  // Test case for combination {2}/Oy<0:
  //   PRE:  s - m <= m
  //   POST: s == x + y
  //   POST: m == x
  //   POST: x <= m
  //   POST: y <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == y || m == x) && x <= m && y <= m
  {
    var s := -3;
    var m := -1;
    var x, y := ReconstructFromMaxSum(s, m);
    expect x == -2;
    expect y == -1;
  }

  // Test case for combination {2}/Oy=0:
  //   PRE:  s - m <= m
  //   POST: s == x + y
  //   POST: m == x
  //   POST: x <= m
  //   POST: y <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == y || m == x) && x <= m && y <= m
  {
    var s := -1;
    var m := 0;
    var x, y := ReconstructFromMaxSum(s, m);
    expect x == -1;
    expect y == 0;
  }

  // Test case for combination {3}/Oy<0:
  //   PRE:  s - m <= m
  //   POST: s == x + y
  //   POST: !(m == y)
  //   POST: x <= m
  //   POST: y <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == y || m == x) && x <= m && y <= m
  {
    var s := -5;
    var m := -2;
    var x, y := ReconstructFromMaxSum(s, m);
    expect x == -2;
    expect y == -3;
  }

}

method GeneratedTests_Triple'()
{
  // Test case for combination {1}:
  //   POST: Average(2 * r, 6 * x) == 6 * x
  //   ENSURES: Average(2 * r, 6 * x) == 6 * x
  {
    var x := 0;
    var r := Triple'(x);
    expect r == 0;
  }

  // Test case for combination {1}/Bx=1:
  //   POST: Average(2 * r, 6 * x) == 6 * x
  //   ENSURES: Average(2 * r, 6 * x) == 6 * x
  {
    var x := 1;
    var r := Triple'(x);
    expect r == 3;
  }

  // Test case for combination {1}/Or>0:
  //   POST: Average(2 * r, 6 * x) == 6 * x
  //   ENSURES: Average(2 * r, 6 * x) == 6 * x
  {
    var x := 2;
    var r := Triple'(x);
    expect r == 6;
  }

  // Test case for combination {1}/Or<0:
  //   POST: Average(2 * r, 6 * x) == 6 * x
  //   ENSURES: Average(2 * r, 6 * x) == 6 * x
  {
    var x := -1;
    var r := Triple'(x);
    expect r == -3;
  }

}

method Main()
{
  GeneratedTests_Triple();
  print "GeneratedTests_Triple: all tests passed!\n";
  GeneratedTests_MinUnderSpec();
  print "GeneratedTests_MinUnderSpec: all tests passed!\n";
  GeneratedTests_Min();
  print "GeneratedTests_Min: all tests passed!\n";
  GeneratedTests_ReconstructFromMaxSum();
  print "GeneratedTests_ReconstructFromMaxSum: all tests passed!\n";
  GeneratedTests_Triple'();
  print "GeneratedTests_Triple': all tests passed!\n";
}
