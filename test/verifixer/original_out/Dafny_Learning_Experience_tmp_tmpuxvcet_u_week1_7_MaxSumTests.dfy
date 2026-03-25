// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Dafny_Learning_Experience_tmp_tmpuxvcet_u_week1_7_MaxSum.dfy
// Method: MaxSum
// Generated: 2026-03-25 22:37:00

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
  } else if y > x {
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


method Passing()
{
  // Test case for combination {1}:
  //   POST: s == x + y
  //   POST: m == x
  //   POST: x <= m
  //   POST: y <= m
  {
    var x := 1;
    var y := -1;
    var s, m := MaxSum(x, y);
    expect s == 0;
    expect m == 1;
  }

  // Test case for combination {2}:
  //   POST: s == x + y
  //   POST: m == y
  //   POST: x <= m
  //   POST: y <= m
  {
    var x := -1;
    var y := 1;
    var s, m := MaxSum(x, y);
    expect s == 0;
    expect m == 1;
  }

  // Test case for combination {1,2}:
  //   POST: s == x + y
  //   POST: m == x
  //   POST: x <= m
  //   POST: y <= m
  //   POST: m == y
  {
    var x := 0;
    var y := 0;
    var s, m := MaxSum(x, y);
    expect s == 0;
    expect m == 0;
  }

  // Test case for combination {1}:
  //   POST: s == x + y
  //   POST: m == x
  //   POST: x <= m
  //   POST: y <= m
  {
    var x := 2;
    var y := -2;
    var s, m := MaxSum(x, y);
    expect s == 0;
    expect m == 2;
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
