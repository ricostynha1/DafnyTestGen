// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Dafny_Learning_Experience_tmp_tmpuxvcet_u_week1_7_MaxSum__181-181_AOI.dfy
// Method: MaxSum
// Generated: 2026-04-24 13:08:23

// Dafny_Learning_Experience_tmp_tmpuxvcet_u_week1_7_MaxSum.dfy

method MaxSum(x: int, y: int)
    returns (s: int, m: int)
  ensures s == x + y
  ensures (m == x || m == y) && x <= m && y <= m
  decreases x, y
{
  s := x + y;
  if x > y {
    m := x;
  } else if -y > x {
    m := y;
  } else {
    m := x;
  }
  assert m >= y;
}

method OriginalMain()
{
  var m, n := 4, 5;
  var a, b := MaxSum(m, n);
  print "Search return a is ", a, ",,,,, b is ", b, "\n";
}


method TestsForMaxSum()
{
  // Test case for combination {1}:
  //   POST Q1: s == x + y
  //   POST Q2: m == x
  //   POST Q3: x <= m
  //   POST Q4: y <= m
  {
    var x := 10;
    var y := -10;
    var s, m := MaxSum(x, y);
    expect s == 0;
    expect m == 10;
  }

  // Test case for combination {2}:
  //   POST Q1: s == x + y
  //   POST Q2: m != x
  //   POST Q3: m == y
  //   POST Q4: x <= m
  //   POST Q5: y <= m
  {
    var x := -10;
    var y := 2;
    var s, m := MaxSum(x, y);
    expect s == -8;
    expect m == 2;
  }

  // Test case for combination {1}/Ox=0:
  //   POST Q1: s == x + y
  //   POST Q2: m == x
  //   POST Q3: x <= m
  //   POST Q4: y <= m
  {
    var x := 0;
    var y := -10;
    var s, m := MaxSum(x, y);
    expect s == -10;
    expect m == 0;
  }

  // Test case for combination {1}/Ox<0:
  //   POST Q1: s == x + y
  //   POST Q2: m == x
  //   POST Q3: x <= m
  //   POST Q4: y <= m
  {
    var x := -10;
    var y := -10;
    var s, m := MaxSum(x, y);
    expect s == -20;
    expect m == -10;
  }

  // Test case for combination {1}/Oy=0:
  //   POST Q1: s == x + y
  //   POST Q2: m == x
  //   POST Q3: x <= m
  //   POST Q4: y <= m
  {
    var x := 10;
    var y := 0;
    var s, m := MaxSum(x, y);
    expect s == 10;
    expect m == 10;
  }

  // Test case for combination {1}/Oy>0:
  //   POST Q1: s == x + y
  //   POST Q2: m == x
  //   POST Q3: x <= m
  //   POST Q4: y <= m
  {
    var x := 10;
    var y := 10;
    var s, m := MaxSum(x, y);
    expect s == 20;
    expect m == 10;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Ox=0:
  //   POST Q1: s == x + y
  //   POST Q2: m != x
  //   POST Q3: m == y
  //   POST Q4: x <= m
  //   POST Q5: y <= m
  {
    var x := 0;
    var y := 10;
    var s, m := MaxSum(x, y);
    // actual runtime state: m=0
    // expect s == 10; // LHS=10, RHS=10
    // expect m == 10; // LHS=0, RHS=10
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Ox>0:
  //   POST Q1: s == x + y
  //   POST Q2: m != x
  //   POST Q3: m == y
  //   POST Q4: x <= m
  //   POST Q5: y <= m
  {
    var x := 9;
    var y := 10;
    var s, m := MaxSum(x, y);
    // actual runtime state: m=9
    // expect s == 19; // LHS=19, RHS=19
    // expect m == 10; // LHS=9, RHS=10
  }

  // Test case for combination {2}/Oy=0:
  //   POST Q1: s == x + y
  //   POST Q2: m != x
  //   POST Q3: m == y
  //   POST Q4: x <= m
  //   POST Q5: y <= m
  {
    var x := -10;
    var y := 0;
    var s, m := MaxSum(x, y);
    expect s == -10;
    expect m == 0;
  }

  // Test case for combination {2}/Oy<0:
  //   POST Q1: s == x + y
  //   POST Q2: m != x
  //   POST Q3: m == y
  //   POST Q4: x <= m
  //   POST Q5: y <= m
  {
    var x := -2;
    var y := -1;
    var s, m := MaxSum(x, y);
    expect s == -3;
    expect m == -1;
  }

}

method Main()
{
  TestsForMaxSum();
  print "TestsForMaxSum: all non-failing tests passed!\n";
}
