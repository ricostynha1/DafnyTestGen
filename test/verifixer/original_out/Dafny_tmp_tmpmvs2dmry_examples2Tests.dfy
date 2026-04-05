// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Dafny_tmp_tmpmvs2dmry_examples2.dfy
// Method: add_by_inc
// Generated: 2026-04-05 23:36:28

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
  return x * y;
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


method Passing()
{
  // Test case for combination {1}:
  //   POST: z == x + y
  {
    var x := 0;
    var y := 0;
    var z := add_by_inc(x, y);
    expect z == 0;
  }

  // Test case for combination {1}/Bx=0,y=1:
  //   POST: z == x + y
  {
    var x := 0;
    var y := 1;
    var z := add_by_inc(x, y);
    expect z == 1;
  }

  // Test case for combination {1}/Bx=1,y=0:
  //   POST: z == x + y
  {
    var x := 1;
    var y := 0;
    var z := add_by_inc(x, y);
    expect z == 1;
  }

  // Test case for combination {1}/Bx=1,y=1:
  //   POST: z == x + y
  {
    var x := 1;
    var y := 1;
    var z := add_by_inc(x, y);
    expect z == 2;
  }

  // Test case for combination {1}:
  //   POST: res == m * n
  {
    var m := 11;
    var n := 0;
    var res := Product(m, n);
    expect res == 0;
  }

  // Test case for combination {1}/Bm=0,n=0:
  //   POST: res == m * n
  {
    var m := 0;
    var n := 0;
    var res := Product(m, n);
    expect res == 0;
  }

  // Test case for combination {1}/Bm=0,n=1:
  //   POST: res == m * n
  {
    var m := 0;
    var n := 1;
    var res := Product(m, n);
    expect res == 0;
  }

  // Test case for combination {1}/Bm=1,n=0:
  //   POST: res == m * n
  {
    var m := 1;
    var n := 0;
    var res := Product(m, n);
    expect res == 0;
  }

  // Test case for combination {1}:
  //   PRE:  m > 0 && n > 0
  //   POST: res == gcd(m, n)
  {
    var m := 1;
    var n := 1;
    expect m > 0 && n > 0; // PRE-CHECK
    var res := gcdCalc(m, n);
    expect res == 1;
  }

  // Test case for combination {1}/Bm=1,n=2:
  //   PRE:  m > 0 && n > 0
  //   POST: res == gcd(m, n)
  {
    var m := 1;
    var n := 2;
    expect m > 0 && n > 0; // PRE-CHECK
    var res := gcdCalc(m, n);
    expect res == 1;
  }

  // Test case for combination {1}/Bm=2,n=1:
  //   PRE:  m > 0 && n > 0
  //   POST: res == gcd(m, n)
  {
    var m := 2;
    var n := 1;
    expect m > 0 && n > 0; // PRE-CHECK
    var res := gcdCalc(m, n);
    expect res == 1;
  }

  // Test case for combination {1}/Bm=2,n=2:
  //   PRE:  m > 0 && n > 0
  //   POST: res == gcd(m, n)
  {
    var m := 2;
    var n := 2;
    expect m > 0 && n > 0; // PRE-CHECK
    var res := gcdCalc(m, n);
    expect res == 2;
  }

  // Test case for combination {1}:
  //   PRE:  x0 >= 0.0
  //   POST: r == exp(x0, n0)
  {
    var x0 := 0.0;
    var n0 := 0;
    var r := exp_by_sqr(x0, n0);
    expect r == 1.0;
  }

  // Test case for combination {1}/Bx0=0.0,n0=1:
  //   PRE:  x0 >= 0.0
  //   POST: r == exp(x0, n0)
  {
    var x0 := 0.0;
    var n0 := 1;
    var r := exp_by_sqr(x0, n0);
    expect r == 0.0;
  }

  // Test case for combination {1}/Bx0=1.0,n0=0:
  //   PRE:  x0 >= 0.0
  //   POST: r == exp(x0, n0)
  {
    var x0 := 1.0;
    var n0 := 0;
    var r := exp_by_sqr(x0, n0);
    expect r == 1.0;
  }

  // Test case for combination {1}/Bx0=1.0,n0=1:
  //   PRE:  x0 >= 0.0
  //   POST: r == exp(x0, n0)
  {
    var x0 := 1.0;
    var n0 := 1;
    var r := exp_by_sqr(x0, n0);
    expect r == 1.0;
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
