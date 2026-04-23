// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Dafny_Learning_Experience_tmp_tmpuxvcet_u_week1_7_MaxSum__181-181_AOI.dfy
// Method: MaxSum
// Generated: 2026-04-22 21:31:41

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
  // Test case for combination {1}/Rel:
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

  // Test case for combination {2}/Rel:
  //   POST Q1: s == x + y
  //   POST Q2: m != x
  //   POST Q3: m == y
  //   POST Q4: x <= m
  //   POST Q5: y <= m
  {
    var x := -10;
    var y := -9;
    var s, m := MaxSum(x, y);
    expect s == -19;
    expect m == -9;
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

  // Test case for combination {1}/Ox>0:
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

}

method Main()
{
  TestsForMaxSum();
  print "TestsForMaxSum: all non-failing tests passed!\n";
}
