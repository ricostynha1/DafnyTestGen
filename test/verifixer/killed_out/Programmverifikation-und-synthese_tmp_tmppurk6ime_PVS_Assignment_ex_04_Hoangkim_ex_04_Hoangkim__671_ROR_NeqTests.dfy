// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Programmverifikation-und-synthese_tmp_tmppurk6ime_PVS_Assignment_ex_04_Hoangkim_ex_04_Hoangkim__671_ROR_Neq.dfy
// Method: sumOdds
// Generated: 2026-04-22 21:53:17

// Programmverifikation-und-synthese_tmp_tmppurk6ime_PVS_Assignment_ex_04_Hoangkim_ex_04_Hoangkim.dfy

method sumOdds(n: nat) returns (sum: nat)
  requires n > 0
  ensures sum == n * n
  decreases n
{
  sum := 1;
  var i := 0;
  while i < n - 1
    invariant 0 <= i < n
    invariant sum == (i + 1) * (i + 1)
    decreases n - 1 - i
  {
    i := i + 1;
    sum := sum + 2 * i + 1;
  }
  assert sum == n * n;
}

method intDiv(n: int, d: int)
    returns (q: int, r: int)
  requires n >= d && n >= 0 && d > 0
  ensures d * q + r == n && 0 <= q <= n / 2 && 0 <= r < d
  decreases n, d

method intDivImpl(n: int, d: int)
    returns (q: int, r: int)
  requires n >= d && n >= 0 && d > 0
  ensures d * q + r == n && 0 <= q <= n / 2 && 0 <= r < d
  decreases n, d
{
  q := 0;
  r := n;
  while r != d
    invariant r == n - q * d
    invariant d <= r
    decreases if r <= d then d - r else r - d
  r := r - 1;
  {
    r := r - d;
    q := q + 1;
  }
  assert n == d * q + r;
}


method TestsForsumOdds()
{
  // Test case for combination {1}:
  //   PRE:  n > 0
  //   POST Q1: sum == n * n
  {
    var n := 10;
    var sum := sumOdds(n);
    expect sum == 100;
  }

  // Test case for combination {1}/Bn=1:
  //   PRE:  n > 0
  //   POST Q1: sum == n * n
  {
    var n := 1;
    var sum := sumOdds(n);
    expect sum == 1;
  }

  // Test case for combination {1}/Bn=2:
  //   PRE:  n > 0
  //   POST Q1: sum == n * n
  {
    var n := 2;
    var sum := sumOdds(n);
    expect sum == 4;
  }

  // Test case for combination {1}/R4:
  //   PRE:  n > 0
  //   POST Q1: sum == n * n
  {
    var n := 9;
    var sum := sumOdds(n);
    expect sum == 81;
  }

}

method TestsForintDiv()
{
  // Test case for combination {1}/Rel:
  //   PRE:  n >= d && n >= 0 && d > 0
  //   POST Q1: d * q + r == n
  //   POST Q2: 0 <= q
  //   POST Q3: q <= n / 2
  //   POST Q4: 0 <= r
  //   POST Q5: r < d
  {
    var n := 5;
    var d := 2;
    // var q, r := intDiv(n, d);
    // expect q == 2;
    // expect r == 1;
  }

  // Test case for combination {1}/Bd=n:
  //   PRE:  n >= d && n >= 0 && d > 0
  //   POST Q1: d * q + r == n
  //   POST Q2: 0 <= q
  //   POST Q3: q <= n / 2
  //   POST Q4: 0 <= r
  //   POST Q5: r < d
  {
    var n := 10;
    var d := 10;
    // var q, r := intDiv(n, d);
    // expect q == 1;
    // expect r == 0;
  }

  // Test case for combination {1}/Bd=n-1:
  //   PRE:  n >= d && n >= 0 && d > 0
  //   POST Q1: d * q + r == n
  //   POST Q2: 0 <= q
  //   POST Q3: q <= n / 2
  //   POST Q4: 0 <= r
  //   POST Q5: r < d
  {
    var n := 10;
    var d := 9;
    // var q, r := intDiv(n, d);
    // expect q == 1;
    // expect r == 1;
  }

  // Test case for combination {1}/Bq=n-1:
  //   PRE:  n >= d && n >= 0 && d > 0
  //   POST Q1: d * q + r == n
  //   POST Q2: 0 <= q
  //   POST Q3: q <= n / 2
  //   POST Q4: 0 <= r
  //   POST Q5: r < d
  {
    var n := 2;
    var d := 2;
    // var q, r := intDiv(n, d);
    // expect q == 1;
    // expect r == 0;
  }

}

method TestsForintDivImpl()
{
  // Test case for combination {1}/Rel:
  //   PRE:  n >= d && n >= 0 && d > 0
  //   POST Q1: d * q + r == n
  //   POST Q2: 0 <= q
  //   POST Q3: q <= n / 2
  //   POST Q4: 0 <= r
  //   POST Q5: r < d
  {
    var n := 10;
    var d := 2;
    var q, r := intDivImpl(n, d);
    expect q == 5;
    expect r == 0;
  }

  // Test case for combination {1}/Bd=n:
  //   PRE:  n >= d && n >= 0 && d > 0
  //   POST Q1: d * q + r == n
  //   POST Q2: 0 <= q
  //   POST Q3: q <= n / 2
  //   POST Q4: 0 <= r
  //   POST Q5: r < d
  {
    var n := 10;
    var d := 10;
    var q, r := intDivImpl(n, d);
    expect q == 1;
    expect r == 0;
  }

  // Test case for combination {1}/Bd=n-1:
  //   PRE:  n >= d && n >= 0 && d > 0
  //   POST Q1: d * q + r == n
  //   POST Q2: 0 <= q
  //   POST Q3: q <= n / 2
  //   POST Q4: 0 <= r
  //   POST Q5: r < d
  {
    var n := 10;
    var d := 9;
    var q, r := intDivImpl(n, d);
    expect q == 1;
    expect r == 1;
  }

  // Test case for combination {1}/Bq=n-1:
  //   PRE:  n >= d && n >= 0 && d > 0
  //   POST Q1: d * q + r == n
  //   POST Q2: 0 <= q
  //   POST Q3: q <= n / 2
  //   POST Q4: 0 <= r
  //   POST Q5: r < d
  {
    var n := 2;
    var d := 2;
    var q, r := intDivImpl(n, d);
    expect q == 1;
    expect r == 0;
  }

}

method Main()
{
  TestsForsumOdds();
  print "TestsForsumOdds: all tests passed!\n";
  TestsForintDiv();
  print "TestsForintDiv: all tests passed!\n";
  TestsForintDivImpl();
  print "TestsForintDivImpl: all tests passed!\n";
}
