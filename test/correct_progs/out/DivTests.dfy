// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\Div.dfy
// Method: Div
// Generated: 2026-04-23 20:23:36

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



method TestsForDiv()
{
  // Test case for combination {1}/Rel:
  //   PRE:  d > 0
  //   POST Q1: q * d + r == n
  //   POST Q2: r < d
  {
    var n := 5;
    var d := 2;
    var q, r := Div(n, d);
    expect q == 2;
    expect r == 1;
  }

  // Test case for combination {1}/Bd=1:
  //   PRE:  d > 0
  //   POST Q1: q * d + r == n
  //   POST Q2: r < d
  {
    var n := 10;
    var d := 1;
    var q, r := Div(n, d);
    expect q == 10;
    expect r == 0;
  }

  // Test case for combination {1}/Bq=0:
  //   PRE:  d > 0
  //   POST Q1: q * d + r == n
  //   POST Q2: r < d
  {
    var n := 9;
    var d := 10;
    var q, r := Div(n, d);
    expect q == 0;
    expect r == 9;
  }

  // Test case for combination {1}/Bq=1:
  //   PRE:  d > 0
  //   POST Q1: q * d + r == n
  //   POST Q2: r < d
  {
    var n := 10;
    var d := 10;
    var q, r := Div(n, d);
    expect q == 1;
    expect r == 0;
  }

  // Test case for combination {1}/On=0:
  //   PRE:  d > 0
  //   POST Q1: q * d + r == n
  //   POST Q2: r < d
  {
    var n := 0;
    var d := 10;
    var q, r := Div(n, d);
    expect q == 0;
    expect r == 0;
  }

  // Test case for combination {1}/On=1:
  //   PRE:  d > 0
  //   POST Q1: q * d + r == n
  //   POST Q2: r < d
  {
    var n := 1;
    var d := 10;
    var q, r := Div(n, d);
    expect q == 0;
    expect r == 1;
  }

  // Test case for combination {1}/R6:
  //   PRE:  d > 0
  //   POST Q1: q * d + r == n
  //   POST Q2: r < d
  {
    var n := 8;
    var d := 10;
    var q, r := Div(n, d);
    expect q == 0;
    expect r == 8;
  }

  // Test case for combination {1}/R7:
  //   PRE:  d > 0
  //   POST Q1: q * d + r == n
  //   POST Q2: r < d
  {
    var n := 7;
    var d := 10;
    var q, r := Div(n, d);
    expect q == 0;
    expect r == 7;
  }

  // Test case for combination {1}/R8:
  //   PRE:  d > 0
  //   POST Q1: q * d + r == n
  //   POST Q2: r < d
  {
    var n := 6;
    var d := 10;
    var q, r := Div(n, d);
    expect q == 0;
    expect r == 6;
  }

  // Test case for combination {1}/R9:
  //   PRE:  d > 0
  //   POST Q1: q * d + r == n
  //   POST Q2: r < d
  {
    var n := 5;
    var d := 10;
    var q, r := Div(n, d);
    expect q == 0;
    expect r == 5;
  }

}

method Main()
{
  TestsForDiv();
  print "TestsForDiv: all non-failing tests passed!\n";
}
