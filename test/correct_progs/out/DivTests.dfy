// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\Div.dfy
// Method: Div
// Generated: 2026-04-10 22:57:34

// Computes the quotient 'q' and remainder 'r' of  the integer division
// of a (non-negative) dividend 'n' by a (positive) divisor 'd'.
method Div(n: nat, d: nat) returns (q: nat, r: nat)
  requires d > 0
  ensures q * d + r == n && r < d
{
  q := 0; 
  r := n;  
  while r >= d
    invariant q * d + r == n
  {
    q := q + 1;
    r := r - d;
  }
}



method Passing()
{
  // Test case for combination {1}:
  //   PRE:  d > 0
  //   POST: q * d + r == n
  //   POST: r < d
  //   ENSURES: q * d + r == n && r < d
  {
    var n := 15;
    var d := 11;
    var q, r := Div(n, d);
    expect q == 1;
    expect r == 4;
  }

  // Test case for combination {1}/Bn=0,d=1:
  //   PRE:  d > 0
  //   POST: q * d + r == n
  //   POST: r < d
  //   ENSURES: q * d + r == n && r < d
  {
    var n := 0;
    var d := 1;
    var q, r := Div(n, d);
    expect q == 0;
    expect r == 0;
  }

  // Test case for combination {1}/Bn=0,d=2:
  //   PRE:  d > 0
  //   POST: q * d + r == n
  //   POST: r < d
  //   ENSURES: q * d + r == n && r < d
  {
    var n := 0;
    var d := 2;
    var q, r := Div(n, d);
    expect q == 0;
    expect r == 0;
  }

  // Test case for combination {1}/Bn=1,d=1:
  //   PRE:  d > 0
  //   POST: q * d + r == n
  //   POST: r < d
  //   ENSURES: q * d + r == n && r < d
  {
    var n := 1;
    var d := 1;
    var q, r := Div(n, d);
    expect q == 1;
    expect r == 0;
  }

  // Test case for combination {1}/Oq>=2:
  //   PRE:  d > 0
  //   POST: q * d + r == n
  //   POST: r < d
  //   ENSURES: q * d + r == n && r < d
  {
    var n := 16;
    var d := 1;
    var q, r := Div(n, d);
    expect q == 16;
    expect r == 0;
  }

  // Test case for combination {1}/Oq=1:
  //   PRE:  d > 0
  //   POST: q * d + r == n
  //   POST: r < d
  //   ENSURES: q * d + r == n && r < d
  {
    var n := 4;
    var d := 4;
    var q, r := Div(n, d);
    expect q == 1;
    expect r == 0;
  }

  // Test case for combination {1}/Oq=0:
  //   PRE:  d > 0
  //   POST: q * d + r == n
  //   POST: r < d
  //   ENSURES: q * d + r == n && r < d
  {
    var n := 1;
    var d := 4;
    var q, r := Div(n, d);
    expect q == 0;
    expect r == 1;
  }

  // Test case for combination {1}/Or>=2:
  //   PRE:  d > 0
  //   POST: q * d + r == n
  //   POST: r < d
  //   ENSURES: q * d + r == n && r < d
  {
    var n := 16;
    var d := 32;
    var q, r := Div(n, d);
    expect q == 0;
    expect r == 16;
  }

  // Test case for combination {1}/Or=1:
  //   PRE:  d > 0
  //   POST: q * d + r == n
  //   POST: r < d
  //   ENSURES: q * d + r == n && r < d
  {
    var n := 50;
    var d := 7;
    var q, r := Div(n, d);
    expect q == 7;
    expect r == 1;
  }

  // Test case for combination {1}/Or=0:
  //   PRE:  d > 0
  //   POST: q * d + r == n
  //   POST: r < d
  //   ENSURES: q * d + r == n && r < d
  {
    var n := 0;
    var d := 64;
    var q, r := Div(n, d);
    expect q == 0;
    expect r == 0;
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
