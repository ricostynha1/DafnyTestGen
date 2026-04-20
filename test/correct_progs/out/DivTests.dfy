// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\Div.dfy
// Method: Div
// Generated: 2026-04-20 22:06:18

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
  //   POST: q * d + r == n
  //   POST: r < d
  //   ENSURES: q * d + r == n && r < d
  {
    var n := 4;
    var d := 2;
    var q, r := Div(n, d);
    expect q == 2;
    expect r == 0;
  }

  // Test case for combination {1}/Bd=1:
  //   PRE:  d > 0
  //   POST: q * d + r == n
  //   POST: r < d
  //   ENSURES: q * d + r == n && r < d
  {
    var n := 10;
    var d := 1;
    var q, r := Div(n, d);
    expect q == 10;
    expect r == 0;
  }

  // Test case for combination {1}/Bq=0:
  //   PRE:  d > 0
  //   POST: q * d + r == n
  //   POST: r < d
  //   ENSURES: q * d + r == n && r < d
  {
    var n := 9;
    var d := 10;
    var q, r := Div(n, d);
    expect q == 0;
    expect r == 9;
  }

  // Test case for combination {1}/Bq=1:
  //   PRE:  d > 0
  //   POST: q * d + r == n
  //   POST: r < d
  //   ENSURES: q * d + r == n && r < d
  {
    var n := 10;
    var d := 10;
    var q, r := Div(n, d);
    expect q == 1;
    expect r == 0;
  }

}

method Main()
{
  TestsForDiv();
  print "TestsForDiv: all non-failing tests passed!\n";
}
