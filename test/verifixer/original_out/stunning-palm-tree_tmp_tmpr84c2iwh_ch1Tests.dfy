// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\stunning-palm-tree_tmp_tmpr84c2iwh_ch1.dfy
// Method: Triple
// Generated: 2026-04-22 21:38:20

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


method TestsForTriple()
{
  // Test case for combination {1}:
  //   POST Q1: r == 3 * x
  {
    var x := -10;
    var r := Triple(x);
    expect r == -30;
  }

  // Test case for combination {1}/Ox=0:
  //   POST Q1: r == 3 * x
  {
    var x := 0;
    var r := Triple(x);
    expect r == 0;
  }

  // Test case for combination {1}/Ox>0:
  //   POST Q1: r == 3 * x
  {
    var x := 10;
    var r := Triple(x);
    expect r == 30;
  }

  // Test case for combination {1}/R4:
  //   POST Q1: r == 3 * x
  {
    var x := -9;
    var r := Triple(x);
    expect r == -27;
  }

}

method TestsForMinUnderSpec()
{
  // Test case for combination {1}/Rel:
  //   POST Q1: r <= x && r <= y
  {
    var x := -9;
    var y := -10;
    var r := MinUnderSpec(x, y);
    expect r <= x && r <= y;
  }

  // Test case for combination {1}/Br=x:
  //   POST Q1: r <= x && r <= y
  {
    var x := -10;
    var y := -10;
    var r := MinUnderSpec(x, y);
    expect r <= x && r <= y;
  }

  // Test case for combination {1}/Ox=0:
  //   POST Q1: r <= x && r <= y
  {
    var x := 0;
    var y := -10;
    var r := MinUnderSpec(x, y);
    expect r <= x && r <= y;
  }

}

method TestsForMin()
{
  // Test case for combination {1}/Rel:
  //   POST Q1: r == x
  //   POST Q2: r <= y
  {
    var x := -10;
    var y := -10;
    var r := Min(x, y);
    expect r == -10;
  }

  // Test case for combination {2}/Rel:
  //   POST Q1: r < x
  //   POST Q2: r == y
  {
    var x := -9;
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

  // Test case for combination {1}/Ox>0:
  //   POST Q1: r == x
  //   POST Q2: r <= y
  {
    var x := 10;
    var y := 10;
    var r := Min(x, y);
    expect r == 10;
  }

}

method TestsForMaxSum()
{
  // Test case for combination {1}/Rel:
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

  // Test case for combination {2}/Rel:
  //   POST Q1: s == x + y
  //   POST Q2: x <= m
  //   POST Q3: y <= m
  //   POST Q4: m != x
  //   POST Q5: m == y
  {
    var x := -10;
    var y := -9;
    // var s, m := MaxSum(x, y);
    // expect s == -19;
    // expect m == -9;
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

  // Test case for combination {1}/Ox>0:
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

}

method TestsForReconstructFromMaxSum()
{
  // Test case for combination {1}/Rel:
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

  // Test case for combination {2}/Rel:
  //   PRE:  s - m <= m
  //   POST Q1: s == x + y
  //   POST Q2: (m == y || m == x) && x <= m && y <= m
  {
    var s := -10;
    var m := -4;
    var x, y := ReconstructFromMaxSum(s, m);
    expect (m == y || m == x) && x <= m && y <= m;
  }

  // Test case for combination {2}/By=m-1:
  //   PRE:  s - m <= m
  //   POST Q1: s == x + y
  //   POST Q2: m != y
  //   POST Q3: m == x
  //   POST Q4: x <= m
  //   POST Q5: y <= m
  {
    var s := -9;
    var m := -4;
    var x, y := ReconstructFromMaxSum(s, m);
    expect x == -4 || x == -5;
    expect y == -5 || y == -4;
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
