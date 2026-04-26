// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\stunning-palm-tree_tmp_tmpr84c2iwh_ch1__285_BBR_false.dfy
// Method: Triple
// Generated: 2026-04-25 00:37:41

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
  if false {
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


method TestsForTriple()
{
  // Test case for combination {1}:
  //   POST Q1: r == 3 * x
  {
    var x := 10;
    var r := Triple(x);
    expect r == 30;
  }

  // Test case for combination {1}/Ox=0:
  //   POST Q1: r == 3 * x
  {
    var x := 0;
    var r := Triple(x);
    expect r == 0;
  }

  // Test case for combination {1}/Ox<0:
  //   POST Q1: r == 3 * x
  {
    var x := -10;
    var r := Triple(x);
    expect r == -30;
  }

  // Test case for combination {1}/R4:
  //   POST Q1: r == 3 * x
  {
    var x := 2;
    var r := Triple(x);
    expect r == 6;
  }

  // Test case for combination {1}/R5:
  //   POST Q1: r == 3 * x
  {
    var x := -9;
    var r := Triple(x);
    expect r == -27;
  }

  // Test case for combination {1}/R6:
  //   POST Q1: r == 3 * x
  {
    var x := 9;
    var r := Triple(x);
    expect r == 27;
  }

  // Test case for combination {1}/R7:
  //   POST Q1: r == 3 * x
  {
    var x := 8;
    var r := Triple(x);
    expect r == 24;
  }

  // Test case for combination {1}/R8:
  //   POST Q1: r == 3 * x
  {
    var x := 7;
    var r := Triple(x);
    expect r == 21;
  }

  // Test case for combination {1}/R9:
  //   POST Q1: r == 3 * x
  {
    var x := 6;
    var r := Triple(x);
    expect r == 18;
  }

  // Test case for combination {1}/R10:
  //   POST Q1: r == 3 * x
  {
    var x := -8;
    var r := Triple(x);
    expect r == -24;
  }

}

method TestsForMinUnderSpec()
{
  // Test case for combination {1}:
  //   POST Q1: r <= x && r <= y
  {
    var x := -10;
    var y := 2;
    var r := MinUnderSpec(x, y);
    expect r <= x && r <= y;
  }

  // Test case for combination {1}/Br=x-1:
  //   POST Q1: r <= x && r <= y
  {
    var x := -10;
    var y := -1;
    var r := MinUnderSpec(x, y);
    expect r <= x && r <= y;
  }

  // Test case for combination {1}/Br=y:
  //   POST Q1: r <= x && r <= y
  {
    var x := 10;
    var y := 10;
    var r := MinUnderSpec(x, y);
    expect r <= x && r <= y;
  }

  // Test case for combination {1}/Br=y-1:
  //   POST Q1: r <= x && r <= y
  {
    var x := 9;
    var y := 10;
    var r := MinUnderSpec(x, y);
    expect r <= x && r <= y;
  }

  // Test case for combination {1}/Ox=0:
  //   POST Q1: r <= x && r <= y
  {
    var x := 0;
    var y := -1;
    var r := MinUnderSpec(x, y);
    expect r <= x && r <= y;
  }

  // Test case for combination {1}/Oy=0:
  //   POST Q1: r <= x && r <= y
  {
    var x := -1;
    var y := 0;
    var r := MinUnderSpec(x, y);
    expect r <= x && r <= y;
  }

  // Test case for combination {1}/Or=0:
  //   POST Q1: r <= x && r <= y
  {
    var x := 8;
    var y := 10;
    var r := MinUnderSpec(x, y);
    expect r <= x && r <= y;
  }

  // Test case for combination {1}/R8:
  //   POST Q1: r <= x && r <= y
  {
    var x := -10;
    var y := -10;
    var r := MinUnderSpec(x, y);
    expect r <= x && r <= y;
  }

  // Test case for combination {1}/R9:
  //   POST Q1: r <= x && r <= y
  {
    var x := 10;
    var y := -10;
    var r := MinUnderSpec(x, y);
    expect r <= x && r <= y;
  }

  // Test case for combination {1}/R10:
  //   POST Q1: r <= x && r <= y
  {
    var x := 10;
    var y := -9;
    var r := MinUnderSpec(x, y);
    expect r <= x && r <= y;
  }

}

method TestsForMin()
{
  // Test case for combination {1}:
  //   POST Q1: r == x
  //   POST Q2: r <= y
  {
    var x := 10;
    var y := 10;
    var r := Min(x, y);
    expect r == 10;
  }

  // Test case for combination {2}:
  //   POST Q1: r < x
  //   POST Q2: r == y
  {
    var x := 10;
    var y := -10;
    var r := Min(x, y);
    expect r == -10;
  }

  // Test case for combination {1}/Ox=0:
  //   POST Q1: r == x
  //   POST Q2: r <= y
  {
    var x := 0;
    var y := 10;
    var r := Min(x, y);
    expect r == 0;
  }

  // Test case for combination {1}/Ox<0:
  //   POST Q1: r == x
  //   POST Q2: r <= y
  {
    var x := -10;
    var y := -10;
    var r := Min(x, y);
    expect r == -10;
  }

  // Test case for combination {1}/Oy=0:
  //   POST Q1: r == x
  //   POST Q2: r <= y
  {
    var x := -10;
    var y := 0;
    var r := Min(x, y);
    expect r == -10;
  }

  // Test case for combination {2}/Ox=0:
  //   POST Q1: r < x
  //   POST Q2: r == y
  {
    var x := 0;
    var y := -10;
    var r := Min(x, y);
    expect r == -10;
  }

  // Test case for combination {2}/Ox<0:
  //   POST Q1: r < x
  //   POST Q2: r == y
  {
    var x := -9;
    var y := -10;
    var r := Min(x, y);
    expect r == -10;
  }

  // Test case for combination {2}/Oy=0:
  //   POST Q1: r < x
  //   POST Q2: r == y
  {
    var x := 10;
    var y := 0;
    var r := Min(x, y);
    expect r == 0;
  }

  // Test case for combination {2}/Oy>0:
  //   POST Q1: r < x
  //   POST Q2: r == y
  {
    var x := 10;
    var y := 9;
    var r := Min(x, y);
    expect r == 9;
  }

  // Test case for combination {1}/R5:
  //   POST Q1: r == x
  //   POST Q2: r <= y
  {
    var x := -10;
    var y := 10;
    var r := Min(x, y);
    expect r == -10;
  }

}

method TestsForMaxSum()
{
  // Test case for combination {1}:
  //   POST Q1: s == x + y
  //   POST Q2: x <= m
  //   POST Q3: y <= m
  //   POST Q4: m == x
  {
    var x := 10;
    var y := -10;
    // var s, m := MaxSum(x, y);
    // expect s == 0;
    // expect m == 10;
  }

  // Test case for combination {2}:
  //   POST Q1: s == x + y
  //   POST Q2: x <= m
  //   POST Q3: y <= m
  //   POST Q4: m != x
  //   POST Q5: m == y
  {
    var x := -10;
    var y := 2;
    // var s, m := MaxSum(x, y);
    // expect s == -8;
    // expect m == 2;
  }

  // Test case for combination {1}/Ox=0:
  //   POST Q1: s == x + y
  //   POST Q2: x <= m
  //   POST Q3: y <= m
  //   POST Q4: m == x
  {
    var x := 0;
    var y := -10;
    // var s, m := MaxSum(x, y);
    // expect s == -10;
    // expect m == 0;
  }

  // Test case for combination {1}/Ox<0:
  //   POST Q1: s == x + y
  //   POST Q2: x <= m
  //   POST Q3: y <= m
  //   POST Q4: m == x
  {
    var x := -10;
    var y := -10;
    // var s, m := MaxSum(x, y);
    // expect s == -20;
    // expect m == -10;
  }

  // Test case for combination {1}/Oy=0:
  //   POST Q1: s == x + y
  //   POST Q2: x <= m
  //   POST Q3: y <= m
  //   POST Q4: m == x
  {
    var x := 10;
    var y := 0;
    // var s, m := MaxSum(x, y);
    // expect s == 10;
    // expect m == 10;
  }

  // Test case for combination {1}/Oy>0:
  //   POST Q1: s == x + y
  //   POST Q2: x <= m
  //   POST Q3: y <= m
  //   POST Q4: m == x
  {
    var x := 10;
    var y := 10;
    // var s, m := MaxSum(x, y);
    // expect s == 20;
    // expect m == 10;
  }

  // Test case for combination {2}/Ox=0:
  //   POST Q1: s == x + y
  //   POST Q2: x <= m
  //   POST Q3: y <= m
  //   POST Q4: m != x
  //   POST Q5: m == y
  {
    var x := 0;
    var y := 10;
    // var s, m := MaxSum(x, y);
    // expect s == 10;
    // expect m == 10;
  }

  // Test case for combination {2}/Ox>0:
  //   POST Q1: s == x + y
  //   POST Q2: x <= m
  //   POST Q3: y <= m
  //   POST Q4: m != x
  //   POST Q5: m == y
  {
    var x := 9;
    var y := 10;
    // var s, m := MaxSum(x, y);
    // expect s == 19;
    // expect m == 10;
  }

  // Test case for combination {2}/Oy=0:
  //   POST Q1: s == x + y
  //   POST Q2: x <= m
  //   POST Q3: y <= m
  //   POST Q4: m != x
  //   POST Q5: m == y
  {
    var x := -10;
    var y := 0;
    // var s, m := MaxSum(x, y);
    // expect s == -10;
    // expect m == 0;
  }

  // Test case for combination {2}/Oy<0:
  //   POST Q1: s == x + y
  //   POST Q2: x <= m
  //   POST Q3: y <= m
  //   POST Q4: m != x
  //   POST Q5: m == y
  {
    var x := -2;
    var y := -1;
    // var s, m := MaxSum(x, y);
    // expect s == -3;
    // expect m == -1;
  }

}

method TestsForReconstructFromMaxSum()
{
  // Test case for combination {1}:
  //   PRE:  s - m <= m
  //   POST Q1: s == x + y
  //   POST Q2: m == y
  //   POST Q3: x <= m
  //   POST Q4: y <= m
  {
    var s := 10;
    var m := 10;
    var x, y := ReconstructFromMaxSum(s, m);
    expect x == 0 || x == 10;
    expect y == 10 || y == 0;
  }

  // Test case for combination {2}:
  //   PRE:  s - m <= m
  //   POST Q1: s == x + y
  //   POST Q2: m != y
  //   POST Q3: m == x
  //   POST Q4: x <= m
  //   POST Q5: y <= m
  {
    var s := -10;
    var m := 2;
    var x, y := ReconstructFromMaxSum(s, m);
    expect x == 2 || x == -12;
    expect y == -12 || y == 2;
  }

  // Test case for combination {1}/Bx=m:
  //   PRE:  s - m <= m
  //   POST Q1: s == x + y
  //   POST Q2: m == y
  //   POST Q3: x <= m
  //   POST Q4: y <= m
  {
    var s := -10;
    var m := -5;
    var x, y := ReconstructFromMaxSum(s, m);
    expect x == -5;
    expect y == -5;
  }

  // Test case for combination {2}/By=m-1:
  //   PRE:  s - m <= m
  //   POST Q1: s == x + y
  //   POST Q2: m != y
  //   POST Q3: m == x
  //   POST Q4: x <= m
  //   POST Q5: y <= m
  {
    var s := 3;
    var m := 2;
    var x, y := ReconstructFromMaxSum(s, m);
    expect x == 2 || x == 1;
    expect y == 1 || y == 2;
  }

  // Test case for combination {2}/Os=0:
  //   PRE:  s - m <= m
  //   POST Q1: s == x + y
  //   POST Q2: m != y
  //   POST Q3: m == x
  //   POST Q4: x <= m
  //   POST Q5: y <= m
  {
    var s := 0;
    var m := 10;
    var x, y := ReconstructFromMaxSum(s, m);
    expect x == 10 || x == -10;
    expect y == -10 || y == 10;
  }

  // Test case for combination {2}/Om=0:
  //   PRE:  s - m <= m
  //   POST Q1: s == x + y
  //   POST Q2: m != y
  //   POST Q3: m == x
  //   POST Q4: x <= m
  //   POST Q5: y <= m
  {
    var s := -10;
    var m := 0;
    var x, y := ReconstructFromMaxSum(s, m);
    expect x == 0 || x == -10;
    expect y == -10 || y == 0;
  }

  // Test case for combination {2}/Om<0:
  //   PRE:  s - m <= m
  //   POST Q1: s == x + y
  //   POST Q2: m != y
  //   POST Q3: m == x
  //   POST Q4: x <= m
  //   POST Q5: y <= m
  {
    var s := -3;
    var m := -1;
    var x, y := ReconstructFromMaxSum(s, m);
    expect x == -1 || x == -2;
    expect y == -2 || y == -1;
  }

}

method TestsForTriple'()
{
  // Test case for combination {1}:
  //   POST Q1: Average(2 * r, 6 * x) == 6 * x
  {
    var x := -10;
    var r := Triple'(x);
    expect r == -30;
  }

  // Test case for combination {1}/Ox=0:
  //   POST Q1: Average(2 * r, 6 * x) == 6 * x
  {
    var x := 0;
    var r := Triple'(x);
    expect r == 0;
  }

  // Test case for combination {1}/Ox>0:
  //   POST Q1: Average(2 * r, 6 * x) == 6 * x
  {
    var x := 10;
    var r := Triple'(x);
    expect r == 30;
  }

  // Test case for combination {1}/R4:
  //   POST Q1: Average(2 * r, 6 * x) == 6 * x
  {
    var x := -9;
    var r := Triple'(x);
    expect r == -27;
  }

  // Test case for combination {1}/R5:
  //   POST Q1: Average(2 * r, 6 * x) == 6 * x
  {
    var x := -8;
    var r := Triple'(x);
    expect r == -24;
  }

  // Test case for combination {1}/R6:
  //   POST Q1: Average(2 * r, 6 * x) == 6 * x
  {
    var x := 9;
    var r := Triple'(x);
    expect r == 27;
  }

  // Test case for combination {1}/R7:
  //   POST Q1: Average(2 * r, 6 * x) == 6 * x
  {
    var x := 8;
    var r := Triple'(x);
    expect r == 24;
  }

  // Test case for combination {1}/R8:
  //   POST Q1: Average(2 * r, 6 * x) == 6 * x
  {
    var x := 7;
    var r := Triple'(x);
    expect r == 21;
  }

  // Test case for combination {1}/R9:
  //   POST Q1: Average(2 * r, 6 * x) == 6 * x
  {
    var x := 6;
    var r := Triple'(x);
    expect r == 18;
  }

  // Test case for combination {1}/R10:
  //   POST Q1: Average(2 * r, 6 * x) == 6 * x
  {
    var x := 5;
    var r := Triple'(x);
    expect r == 15;
  }

}

method Main()
{
  TestsForTriple();
  print "TestsForTriple: all tests passed!\n";
  TestsForMinUnderSpec();
  print "TestsForMinUnderSpec: all tests passed!\n";
  TestsForMin();
  print "TestsForMin: all tests passed!\n";
  TestsForMaxSum();
  print "TestsForMaxSum: all tests passed!\n";
  TestsForReconstructFromMaxSum();
  print "TestsForReconstructFromMaxSum: all tests passed!\n";
  TestsForTriple'();
  print "TestsForTriple': all tests passed!\n";
}
