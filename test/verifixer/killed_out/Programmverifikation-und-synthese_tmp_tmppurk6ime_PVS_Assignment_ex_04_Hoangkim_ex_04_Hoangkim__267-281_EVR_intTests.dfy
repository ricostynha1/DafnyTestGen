// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Programmverifikation-und-synthese_tmp_tmppurk6ime_PVS_Assignment_ex_04_Hoangkim_ex_04_Hoangkim__267-281_EVR_int.dfy
// Method: sumOdds
// Generated: 2026-03-25 22:56:02

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


method GeneratedTests_sumOdds()
{
  // Test case for combination {1}:
  //   PRE:  n > 0
  //   POST: sum == n * n
  {
    var n := 1;
    var sum := sumOdds(n);
    expect sum == 1;
  }

  // Test case for combination {1}:
  //   PRE:  n > 0
  //   POST: sum == n * n
  {
    var n := 3;
    var sum := sumOdds(n);
    expect sum == 9;
  }

  // Test case for combination {1}/Bn=2:
  //   PRE:  n > 0
  //   POST: sum == n * n
  {
    var n := 2;
    var sum := sumOdds(n);
    expect sum == 4;
  }

}

method GeneratedTests_intDiv()
{
  // Test case for combination {1}:
  //   PRE:  n >= d && n >= 0 && d > 0
  //   POST: d * q + r == n
  //   POST: 0 <= q <= n / 2
  //   POST: 0 <= r < d
  {
    var n := 2;
    var d := 2;
    var q, r := intDiv(n, d);
    expect q == 1;
    expect r == 0;
  }

  // Test case for combination {1}:
  //   PRE:  n >= d && n >= 0 && d > 0
  //   POST: d * q + r == n
  //   POST: 0 <= q <= n / 2
  //   POST: 0 <= r < d
  {
    var n := 6;
    var d := 3;
    var q, r := intDiv(n, d);
    expect q == 2;
    expect r == 0;
  }

  // Test case for combination {1}/R3:
  //   PRE:  n >= d && n >= 0 && d > 0
  //   POST: d * q + r == n
  //   POST: 0 <= q <= n / 2
  //   POST: 0 <= r < d
  {
    var n := 6;
    var d := 4;
    var q, r := intDiv(n, d);
    expect q == 1;
    expect r == 2;
  }

}

method GeneratedTests_intDivImpl()
{
  // Test case for combination {1}:
  //   PRE:  n >= d && n >= 0 && d > 0
  //   POST: d * q + r == n
  //   POST: 0 <= q <= n / 2
  //   POST: 0 <= r < d
  {
    var n := 2;
    var d := 2;
    var q, r := intDivImpl(n, d);
    expect q == 1;
    expect r == 0;
  }

  // Test case for combination {1}:
  //   PRE:  n >= d && n >= 0 && d > 0
  //   POST: d * q + r == n
  //   POST: 0 <= q <= n / 2
  //   POST: 0 <= r < d
  {
    var n := 6;
    var d := 3;
    var q, r := intDivImpl(n, d);
    expect q == 2;
    expect r == 0;
  }

  // Test case for combination {1}/R3:
  //   PRE:  n >= d && n >= 0 && d > 0
  //   POST: d * q + r == n
  //   POST: 0 <= q <= n / 2
  //   POST: 0 <= r < d
  {
    var n := 6;
    var d := 4;
    var q, r := intDivImpl(n, d);
    expect q == 1;
    expect r == 2;
  }

}

method Main()
{
  GeneratedTests_sumOdds();
  print "GeneratedTests_sumOdds: all tests passed!\n";
  GeneratedTests_intDiv();
  print "GeneratedTests_intDiv: all tests passed!\n";
  GeneratedTests_intDivImpl();
  print "GeneratedTests_intDivImpl: all tests passed!\n";
}
