// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Dafny_Learning_Experience_tmp_tmpuxvcet_u_week1_7_MaxSum.dfy
// Method: MaxSum
// Generated: 2026-04-08 19:05:27

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
  //   POST: m == y
  //   POST: x <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == x || m == y) && x <= m && y <= m
  {
    var x := 0;
    var y := 0;
    var s, m := MaxSum(x, y);
    expect s == 0;
    expect m == 0;
  }

  // Test case for combination {2}:
  //   POST: s == x + y
  //   POST: m == x
  //   POST: !(m == y)
  //   POST: x <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == x || m == y) && x <= m && y <= m
  {
    var x := 1;
    var y := -1;
    var s, m := MaxSum(x, y);
    expect s == 0;
    expect m == 1;
  }

  // Test case for combination {3}:
  //   POST: s == x + y
  //   POST: !(m == x)
  //   POST: m == y
  //   POST: x <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == x || m == y) && x <= m && y <= m
  {
    var x := -1;
    var y := 1;
    var s, m := MaxSum(x, y);
    expect s == 0;
    expect m == 1;
  }

  // Test case for combination {1}/Bx=1,y=1:
  //   POST: s == x + y
  //   POST: m == x
  //   POST: m == y
  //   POST: x <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == x || m == y) && x <= m && y <= m
  {
    var x := 1;
    var y := 1;
    var s, m := MaxSum(x, y);
    expect s == 2;
    expect m == 1;
  }

  // Test case for combination {1}/Os<0:
  //   POST: s == x + y
  //   POST: m == x
  //   POST: m == y
  //   POST: x <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == x || m == y) && x <= m && y <= m
  {
    var x := -1;
    var y := -1;
    var s, m := MaxSum(x, y);
    expect s == -2;
    expect m == -1;
  }

  // Test case for combination {1}/Om>0:
  //   POST: s == x + y
  //   POST: m == x
  //   POST: m == y
  //   POST: x <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == x || m == y) && x <= m && y <= m
  {
    var x := 2;
    var y := 2;
    var s, m := MaxSum(x, y);
    expect s == 4;
    expect m == 2;
  }

  // Test case for combination {1}/Om<0:
  //   POST: s == x + y
  //   POST: m == x
  //   POST: m == y
  //   POST: x <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == x || m == y) && x <= m && y <= m
  {
    var x := -2;
    var y := -2;
    var s, m := MaxSum(x, y);
    expect s == -4;
    expect m == -2;
  }

  // Test case for combination {2}/Os>0:
  //   POST: s == x + y
  //   POST: m == x
  //   POST: !(m == y)
  //   POST: x <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == x || m == y) && x <= m && y <= m
  {
    var x := 1;
    var y := 0;
    var s, m := MaxSum(x, y);
    expect s == 1;
    expect m == 1;
  }

  // Test case for combination {2}/Os<0:
  //   POST: s == x + y
  //   POST: m == x
  //   POST: !(m == y)
  //   POST: x <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == x || m == y) && x <= m && y <= m
  {
    var x := 0;
    var y := -1;
    var s, m := MaxSum(x, y);
    expect s == -1;
    expect m == 0;
  }

  // Test case for combination {2}/Om>0:
  //   POST: s == x + y
  //   POST: m == x
  //   POST: !(m == y)
  //   POST: x <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == x || m == y) && x <= m && y <= m
  {
    var x := 2;
    var y := 1;
    var s, m := MaxSum(x, y);
    expect s == 3;
    expect m == 2;
  }

  // Test case for combination {2}/Om<0:
  //   POST: s == x + y
  //   POST: m == x
  //   POST: !(m == y)
  //   POST: x <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == x || m == y) && x <= m && y <= m
  {
    var x := -1;
    var y := -2;
    var s, m := MaxSum(x, y);
    expect s == -3;
    expect m == -1;
  }

  // Test case for combination {2}/Om=0:
  //   POST: s == x + y
  //   POST: m == x
  //   POST: !(m == y)
  //   POST: x <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == x || m == y) && x <= m && y <= m
  {
    var x := 0;
    var y := -2;
    var s, m := MaxSum(x, y);
    expect s == -2;
    expect m == 0;
  }

  // Test case for combination {3}/Os>0:
  //   POST: s == x + y
  //   POST: !(m == x)
  //   POST: m == y
  //   POST: x <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == x || m == y) && x <= m && y <= m
  {
    var x := 0;
    var y := 1;
    var s, m := MaxSum(x, y);
    expect s == 1;
    expect m == 1;
  }

  // Test case for combination {3}/Os<0:
  //   POST: s == x + y
  //   POST: !(m == x)
  //   POST: m == y
  //   POST: x <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == x || m == y) && x <= m && y <= m
  {
    var x := -1;
    var y := 0;
    var s, m := MaxSum(x, y);
    expect s == -1;
    expect m == 0;
  }

  // Test case for combination {3}/Om>0:
  //   POST: s == x + y
  //   POST: !(m == x)
  //   POST: m == y
  //   POST: x <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == x || m == y) && x <= m && y <= m
  {
    var x := -2;
    var y := 2;
    var s, m := MaxSum(x, y);
    expect s == 0;
    expect m == 2;
  }

  // Test case for combination {3}/Om<0:
  //   POST: s == x + y
  //   POST: !(m == x)
  //   POST: m == y
  //   POST: x <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == x || m == y) && x <= m && y <= m
  {
    var x := -3;
    var y := -2;
    var s, m := MaxSum(x, y);
    expect s == -5;
    expect m == -2;
  }

  // Test case for combination {3}/Om=0:
  //   POST: s == x + y
  //   POST: !(m == x)
  //   POST: m == y
  //   POST: x <= m
  //   POST: y <= m
  //   ENSURES: s == x + y
  //   ENSURES: (m == x || m == y) && x <= m && y <= m
  {
    var x := -2;
    var y := 0;
    var s, m := MaxSum(x, y);
    expect s == -2;
    expect m == 0;
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
