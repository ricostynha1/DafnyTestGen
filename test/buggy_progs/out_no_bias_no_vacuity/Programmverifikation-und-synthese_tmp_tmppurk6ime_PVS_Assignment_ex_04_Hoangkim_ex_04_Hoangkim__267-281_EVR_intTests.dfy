// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Programmverifikation-und-synthese_tmp_tmppurk6ime_PVS_Assignment_ex_04_Hoangkim_ex_04_Hoangkim__267-281_EVR_int.dfy
// Method: sumOdds
// Generated: 2026-04-24 22:43:26

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
    sum := 0;
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
  while r >= d
    invariant r == n - q * d
    invariant d <= r
    decreases r - d
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

  // Test case for combination {1}/R3:
  //   PRE:  n > 0
  //   POST Q1: sum == n * n
  {
    var n := 3;
    var sum := sumOdds(n);
    expect sum == 9;
  }

  // Test case for combination {1}/R4:
  //   PRE:  n > 0
  //   POST Q1: sum == n * n
  {
    var n := 4;
    var sum := sumOdds(n);
    expect sum == 16;
  }

  // Test case for combination {1}/R5:
  //   PRE:  n > 0
  //   POST Q1: sum == n * n
  {
    var n := 5;
    var sum := sumOdds(n);
    expect sum == 25;
  }

  // Test case for combination {1}/R6:
  //   PRE:  n > 0
  //   POST Q1: sum == n * n
  {
    var n := 6;
    var sum := sumOdds(n);
    expect sum == 36;
  }

  // Test case for combination {1}/R7:
  //   PRE:  n > 0
  //   POST Q1: sum == n * n
  {
    var n := 7;
    var sum := sumOdds(n);
    expect sum == 49;
  }

  // Test case for combination {1}/R8:
  //   PRE:  n > 0
  //   POST Q1: sum == n * n
  {
    var n := 8;
    var sum := sumOdds(n);
    expect sum == 64;
  }

  // Test case for combination {1}/R9:
  //   PRE:  n > 0
  //   POST Q1: sum == n * n
  {
    var n := 9;
    var sum := sumOdds(n);
    expect sum == 81;
  }

  // Test case for combination {1}/R10:
  //   PRE:  n > 0
  //   POST Q1: sum == n * n
  {
    var n := 10;
    var sum := sumOdds(n);
    expect sum == 100;
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
    var n := 12;
    var d := 2;
    // var q, r := intDiv(n, d);
    // expect q == 6;
    // expect r == 0;
  }

  // Test case for combination {1}/Bd=n:
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

  // Test case for combination {1}/Bd=n-1:
  //   PRE:  n >= d && n >= 0 && d > 0
  //   POST Q1: d * q + r == n
  //   POST Q2: 0 <= q
  //   POST Q3: q <= n / 2
  //   POST Q4: 0 <= r
  //   POST Q5: r < d
  {
    var n := 4;
    var d := 3;
    // var q, r := intDiv(n, d);
    // expect q == 1;
    // expect r == 1;
  }

  // Test case for combination {1}/R3:
  //   PRE:  n >= d && n >= 0 && d > 0
  //   POST Q1: d * q + r == n
  //   POST Q2: 0 <= q
  //   POST Q3: q <= n / 2
  //   POST Q4: 0 <= r
  //   POST Q5: r < d
  {
    var n := 8;
    var d := 4;
    // var q, r := intDiv(n, d);
    // expect q == 2;
    // expect r == 0;
  }

  // Test case for combination {1}/R4:
  //   PRE:  n >= d && n >= 0 && d > 0
  //   POST Q1: d * q + r == n
  //   POST Q2: 0 <= q
  //   POST Q3: q <= n / 2
  //   POST Q4: 0 <= r
  //   POST Q5: r < d
  {
    var n := 6;
    var d := 4;
    // var q, r := intDiv(n, d);
    // expect q == 1;
    // expect r == 2;
  }

  // Test case for combination {1}/R5:
  //   PRE:  n >= d && n >= 0 && d > 0
  //   POST Q1: d * q + r == n
  //   POST Q2: 0 <= q
  //   POST Q3: q <= n / 2
  //   POST Q4: 0 <= r
  //   POST Q5: r < d
  {
    var n := 7;
    var d := 2;
    // var q, r := intDiv(n, d);
    // expect q == 3;
    // expect r == 1;
  }

  // Test case for combination {1}/R6:
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

  // Test case for combination {1}/R7:
  //   PRE:  n >= d && n >= 0 && d > 0
  //   POST Q1: d * q + r == n
  //   POST Q2: 0 <= q
  //   POST Q3: q <= n / 2
  //   POST Q4: 0 <= r
  //   POST Q5: r < d
  {
    var n := 9;
    var d := 2;
    // var q, r := intDiv(n, d);
    // expect q == 4;
    // expect r == 1;
  }

  // Test case for combination {1}/R8:
  //   PRE:  n >= d && n >= 0 && d > 0
  //   POST Q1: d * q + r == n
  //   POST Q2: 0 <= q
  //   POST Q3: q <= n / 2
  //   POST Q4: 0 <= r
  //   POST Q5: r < d
  {
    var n := 4;
    var d := 4;
    // var q, r := intDiv(n, d);
    // expect q == 1;
    // expect r == 0;
  }

  // Test case for combination {1}/R9:
  //   PRE:  n >= d && n >= 0 && d > 0
  //   POST Q1: d * q + r == n
  //   POST Q2: 0 <= q
  //   POST Q3: q <= n / 2
  //   POST Q4: 0 <= r
  //   POST Q5: r < d
  {
    var n := 5;
    var d := 5;
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
    var n := 12;
    var d := 2;
    var q, r := intDivImpl(n, d);
    expect q == 6;
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
    var n := 2;
    var d := 2;
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
    var n := 4;
    var d := 3;
    var q, r := intDivImpl(n, d);
    expect q == 1;
    expect r == 1;
  }

  // Test case for combination {1}/R3:
  //   PRE:  n >= d && n >= 0 && d > 0
  //   POST Q1: d * q + r == n
  //   POST Q2: 0 <= q
  //   POST Q3: q <= n / 2
  //   POST Q4: 0 <= r
  //   POST Q5: r < d
  {
    var n := 8;
    var d := 4;
    var q, r := intDivImpl(n, d);
    expect q == 2;
    expect r == 0;
  }

  // Test case for combination {1}/R4:
  //   PRE:  n >= d && n >= 0 && d > 0
  //   POST Q1: d * q + r == n
  //   POST Q2: 0 <= q
  //   POST Q3: q <= n / 2
  //   POST Q4: 0 <= r
  //   POST Q5: r < d
  {
    var n := 6;
    var d := 4;
    var q, r := intDivImpl(n, d);
    expect q == 1;
    expect r == 2;
  }

  // Test case for combination {1}/R5:
  //   PRE:  n >= d && n >= 0 && d > 0
  //   POST Q1: d * q + r == n
  //   POST Q2: 0 <= q
  //   POST Q3: q <= n / 2
  //   POST Q4: 0 <= r
  //   POST Q5: r < d
  {
    var n := 7;
    var d := 2;
    var q, r := intDivImpl(n, d);
    expect q == 3;
    expect r == 1;
  }

  // Test case for combination {1}/R6:
  //   PRE:  n >= d && n >= 0 && d > 0
  //   POST Q1: d * q + r == n
  //   POST Q2: 0 <= q
  //   POST Q3: q <= n / 2
  //   POST Q4: 0 <= r
  //   POST Q5: r < d
  {
    var n := 5;
    var d := 2;
    var q, r := intDivImpl(n, d);
    expect q == 2;
    expect r == 1;
  }

  // Test case for combination {1}/R7:
  //   PRE:  n >= d && n >= 0 && d > 0
  //   POST Q1: d * q + r == n
  //   POST Q2: 0 <= q
  //   POST Q3: q <= n / 2
  //   POST Q4: 0 <= r
  //   POST Q5: r < d
  {
    var n := 9;
    var d := 2;
    var q, r := intDivImpl(n, d);
    expect q == 4;
    expect r == 1;
  }

  // Test case for combination {1}/R8:
  //   PRE:  n >= d && n >= 0 && d > 0
  //   POST Q1: d * q + r == n
  //   POST Q2: 0 <= q
  //   POST Q3: q <= n / 2
  //   POST Q4: 0 <= r
  //   POST Q5: r < d
  {
    var n := 4;
    var d := 4;
    var q, r := intDivImpl(n, d);
    expect q == 1;
    expect r == 0;
  }

  // Test case for combination {1}/R9:
  //   PRE:  n >= d && n >= 0 && d > 0
  //   POST Q1: d * q + r == n
  //   POST Q2: 0 <= q
  //   POST Q3: q <= n / 2
  //   POST Q4: 0 <= r
  //   POST Q5: r < d
  {
    var n := 5;
    var d := 5;
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
