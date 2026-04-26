// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Dafny_tmp_tmpmvs2dmry_examples2__2012_VER_x0.dfy
// Method: add_by_inc
// Generated: 2026-04-24 19:45:47

// Dafny_tmp_tmpmvs2dmry_examples2.dfy

method add_by_inc(x: nat, y: nat) returns (z: nat)
  ensures z == x + y
  decreases x, y
{
  z := x;
  var i := 0;
  while i < y
    invariant 0 <= i <= y
    invariant z == x + i
    decreases y - i
  {
    z := z + 1;
    i := i + 1;
  }
  assert z == x + y;
  assert i == y;
}

method Product(m: nat, n: nat) returns (res: nat)
  ensures res == m * n
  decreases m, n
{
  var m1: nat := m;
  res := 0;
  while m1 != 0
    invariant 0 <= m1 <= m
    invariant res == (m - m1) * n
    decreases m1
  {
    var n1: nat := n;
    while n1 != 0
      invariant 0 <= n1 <= n
      invariant res == (m - m1) * n + n - n1
      decreases n1
    {
      res := res + 1;
      n1 := n1 - 1;
    }
    m1 := m1 - 1;
  }
}

method gcdCalc(m: nat, n: nat) returns (res: nat)
  requires m > 0 && n > 0
  ensures res == gcd(m, n)
  decreases m, n
{
  var m1: nat := m;
  var n1: nat := n;
  while m1 != n1
    invariant 0 < m1 <= m
    invariant 0 < n1 <= n
    invariant gcd(m, n) == gcd(m1, n1)
    decreases m1 + n1
  {
    if m1 > n1 {
      m1 := m1 - n1;
    } else {
      n1 := n1 - m1;
    }
  }
  return n1;
}

function gcd(m: nat, n: nat): nat
  requires m > 0 && n > 0
  decreases m + n
{
  if m == n then
    n
  else if m > n then
    gcd(m - n, n)
  else
    gcd(m, n - m)
}

method exp_by_sqr(x0: real, n0: nat) returns (r: real)
  requires x0 >= 0.0
  ensures r == exp(x0, n0)
  decreases x0, n0
{
  if n0 == 0 {
    return 1.0;
  }
  if x0 == 0.0 {
    return 0.0;
  }
  var x, n, y := x0, n0, 1.0;
  while n > 1
    invariant 1 <= n <= n0
    invariant exp(x0, n0) == exp(x, n) * y
    decreases n
  {
    if n % 2 == 0 {
      assume exp(x, n) == exp(x * x, n / 2);
      x := x * x;
      n := n / 2;
    } else {
      assume exp(x, n) == exp(x * x, (n - 1) / 2) * x;
      y := x * y;
      x := x * x;
      n := (n - 1) / 2;
    }
  }
  return x * x0;
}

function exp(x: real, n: nat): real
  decreases n
{
  if n == 0 then
    1.0
  else if x == 0.0 then
    0.0
  else if n == 0 && x == 0.0 then
    1.0
  else
    x * exp(x, n - 1)
}


method TestsForadd_by_inc()
{
  // Test case for combination {1}:
  //   POST Q1: z == x + y
  {
    var x := 0;
    var y := 0;
    var z := add_by_inc(x, y);
    expect z == 0;
  }

  // Test case for combination {1}/Bx=1:
  //   POST Q1: z == x + y
  {
    var x := 1;
    var y := 0;
    var z := add_by_inc(x, y);
    expect z == 1;
  }

  // Test case for combination {1}/By=1:
  //   POST Q1: z == x + y
  {
    var x := 0;
    var y := 1;
    var z := add_by_inc(x, y);
    expect z == 1;
  }

  // Test case for combination {1}/Ox>=2:
  //   POST Q1: z == x + y
  {
    var x := 2;
    var y := 0;
    var z := add_by_inc(x, y);
    expect z == 2;
  }

  // Test case for combination {1}/Oy>=2:
  //   POST Q1: z == x + y
  {
    var x := 3;
    var y := 2;
    var z := add_by_inc(x, y);
    expect z == 5;
  }

  // Test case for combination {1}/R6:
  //   POST Q1: z == x + y
  {
    var x := 4;
    var y := 0;
    var z := add_by_inc(x, y);
    expect z == 4;
  }

  // Test case for combination {1}/R7:
  //   POST Q1: z == x + y
  {
    var x := 5;
    var y := 1;
    var z := add_by_inc(x, y);
    expect z == 6;
  }

  // Test case for combination {1}/R8:
  //   POST Q1: z == x + y
  {
    var x := 6;
    var y := 0;
    var z := add_by_inc(x, y);
    expect z == 6;
  }

  // Test case for combination {1}/R9:
  //   POST Q1: z == x + y
  {
    var x := 7;
    var y := 1;
    var z := add_by_inc(x, y);
    expect z == 8;
  }

  // Test case for combination {1}/R10:
  //   POST Q1: z == x + y
  {
    var x := 1;
    var y := 1;
    var z := add_by_inc(x, y);
    expect z == 2;
  }

}

method TestsForProduct()
{
  // Test case for combination {1}:
  //   POST Q1: res == m * n
  {
    var m := 0;
    var n := 14;
    var res := Product(m, n);
    expect res == 0;
  }

  // Test case for combination {1}/Bm=1:
  //   POST Q1: res == m * n
  {
    var m := 1;
    var n := 0;
    var res := Product(m, n);
    expect res == 0;
  }

  // Test case for combination {1}/Bn=1:
  //   POST Q1: res == m * n
  {
    var m := 0;
    var n := 1;
    var res := Product(m, n);
    expect res == 0;
  }

  // Test case for combination {1}/Om>=2:
  //   POST Q1: res == m * n
  {
    var m := 2;
    var n := 15;
    var res := Product(m, n);
    expect res == 30;
  }

  // Test case for combination {1}/Ores=1:
  //   POST Q1: res == m * n
  {
    var m := 1;
    var n := 1;
    var res := Product(m, n);
    expect res == 1;
  }

  // Test case for combination {1}/R6:
  //   POST Q1: res == m * n
  {
    var m := 0;
    var n := 27;
    var res := Product(m, n);
    expect res == 0;
  }

  // Test case for combination {1}/R7:
  //   POST Q1: res == m * n
  {
    var m := 0;
    var n := 44;
    var res := Product(m, n);
    expect res == 0;
  }

  // Test case for combination {1}/R8:
  //   POST Q1: res == m * n
  {
    var m := 4;
    var n := 28;
    var res := Product(m, n);
    expect res == 112;
  }

  // Test case for combination {1}/R9:
  //   POST Q1: res == m * n
  {
    var m := 118;
    var n := 0;
    var res := Product(m, n);
    expect res == 0;
  }

  // Test case for combination {1}/R10:
  //   POST Q1: res == m * n
  {
    var m := 0;
    var n := 182;
    var res := Product(m, n);
    expect res == 0;
  }

}

method TestsForgcdCalc()
{
  // Test case for combination {1}:
  //   PRE:  m > 0 && n > 0
  //   POST Q1: res == gcd(m, n)
  {
    var m := 1;
    var n := 1;
    var res := gcdCalc(m, n);
    expect res == 1;
  }

  // Test case for combination {2}:
  //   PRE:  m > 0 && n > 0
  //   POST Q1: res == gcd(m, n)
  {
    var m := 177;
    var n := 1;
    var res := gcdCalc(m, n);
    expect res == 1;
  }

  // Test case for combination {3}:
  //   PRE:  m > 0 && n > 0
  //   POST Q1: res == gcd(m, n)
  {
    var m := 1;
    var n := 177;
    var res := gcdCalc(m, n);
    expect res == 1;
  }

  // Test case for combination {2}/Bm=2:
  //   PRE:  m > 0 && n > 0
  //   POST Q1: res == gcd(m, n)
  {
    var m := 2;
    var n := 1;
    var res := gcdCalc(m, n);
    expect res == 1;
  }

  // Test case for combination {2}/Bn=2:
  //   PRE:  m > 0 && n > 0
  //   POST Q1: res == gcd(m, n)
  {
    var m := 3;
    var n := 2;
    var res := gcdCalc(m, n);
    expect res == 1;
  }

  // Test case for combination {3}/Bm=2:
  //   PRE:  m > 0 && n > 0
  //   POST Q1: res == gcd(m, n)
  {
    var m := 2;
    var n := 3;
    var res := gcdCalc(m, n);
    expect res == 1;
  }

  // Test case for combination {3}/Bn=2:
  //   PRE:  m > 0 && n > 0
  //   POST Q1: res == gcd(m, n)
  {
    var m := 1;
    var n := 2;
    var res := gcdCalc(m, n);
    expect res == 1;
  }

  // Test case for combination {1}/Om>=2:
  //   PRE:  m > 0 && n > 0
  //   POST Q1: res == gcd(m, n)
  {
    var m := 2;
    var n := 2;
    var res := gcdCalc(m, n);
    expect res == 2;
  }

  // Test case for combination {1}/R3:
  //   PRE:  m > 0 && n > 0
  //   POST Q1: res == gcd(m, n)
  {
    var m := 3;
    var n := 3;
    var res := gcdCalc(m, n);
    expect res == 3;
  }

  // Test case for combination {1}/R4:
  //   PRE:  m > 0 && n > 0
  //   POST Q1: res == gcd(m, n)
  {
    var m := 4;
    var n := 4;
    var res := gcdCalc(m, n);
    expect res == 4;
  }

}

method TestsForexp_by_sqr()
{
  // Test case for combination {1}:
  //   PRE:  x0 >= 0.0
  //   POST Q1: r == exp(x0, n0)
  {
    var x0 := 0.0;
    var n0 := 0;
    var r := exp_by_sqr(x0, n0);
    expect r == 1.0;
  }

  // Test case for combination {2}:
  //   PRE:  x0 >= 0.0
  //   POST Q1: r == exp(x0, n0)
  {
    var x0 := 0.0;
    var n0 := 1;
    var r := exp_by_sqr(x0, n0);
    expect r == 0.0;
  }

  // Test case for combination {2}/Bn0=2:
  //   PRE:  x0 >= 0.0
  //   POST Q1: r == exp(x0, n0)
  {
    var x0 := 0.0;
    var n0 := 2;
    var r := exp_by_sqr(x0, n0);
    expect r == 0.0;
  }

  // Test case for combination {1}/Ox0>0:
  //   PRE:  x0 >= 0.0
  //   POST Q1: r == exp(x0, n0)
  {
    var x0 := 1.0;
    var n0 := 0;
    var r := exp_by_sqr(x0, n0);
    expect r == 1.0;
  }

  // Test case for combination {1}/Or>0:
  //   PRE:  x0 >= 0.0
  //   POST Q1: r == exp(x0, n0)
  {
    var x0 := 2.0;
    var n0 := 0;
    var r := exp_by_sqr(x0, n0);
    expect r == 1.0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Ox0>0:
  //   PRE:  x0 >= 0.0
  //   POST Q1: r == exp(x0, n0)
  {
    var x0 := 0.5;
    var n0 := 1;
    var r := exp_by_sqr(x0, n0);
    // expect r == 0.5; // got 0.25
  }

  // Test case for combination {2}/Or>0:
  //   PRE:  x0 >= 0.0
  //   POST Q1: r == exp(x0, n0)
  {
    var x0 := 0.0;
    var n0 := 3;
    var r := exp_by_sqr(x0, n0);
    expect r == 0.0;
  }

  // Test case for combination {1}/R4:
  //   PRE:  x0 >= 0.0
  //   POST Q1: r == exp(x0, n0)
  {
    var x0 := 0.5;
    var n0 := 0;
    var r := exp_by_sqr(x0, n0);
    expect r == 1.0;
  }

  // Test case for combination {1}/R5:
  //   PRE:  x0 >= 0.0
  //   POST Q1: r == exp(x0, n0)
  {
    var x0 := -1.0;
    var n0 := 0;
    var r := exp_by_sqr(x0, n0);
    expect r == 1.0;
  }

  // Test case for combination {1}/R6:
  //   PRE:  x0 >= 0.0
  //   POST Q1: r == exp(x0, n0)
  {
    var x0 := -2.0;
    var n0 := 0;
    var r := exp_by_sqr(x0, n0);
    expect r == 1.0;
  }

}

method Main()
{
  TestsForadd_by_inc();
  print "TestsForadd_by_inc: all non-failing tests passed!\n";
  TestsForProduct();
  print "TestsForProduct: all non-failing tests passed!\n";
  TestsForgcdCalc();
  print "TestsForgcdCalc: all non-failing tests passed!\n";
  TestsForexp_by_sqr();
  print "TestsForexp_by_sqr: all non-failing tests passed!\n";
}
