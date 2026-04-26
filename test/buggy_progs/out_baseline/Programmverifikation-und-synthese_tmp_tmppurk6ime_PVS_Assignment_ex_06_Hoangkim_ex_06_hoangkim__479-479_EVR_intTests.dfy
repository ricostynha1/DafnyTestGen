// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Programmverifikation-und-synthese_tmp_tmppurk6ime_PVS_Assignment_ex_06_Hoangkim_ex_06_hoangkim__479-479_EVR_int.dfy
// Method: gcdI
// Generated: 2026-04-24 20:30:55

// Programmverifikation-und-synthese_tmp_tmppurk6ime_PVS_Assignment_ex_06_Hoangkim_ex_06_hoangkim.dfy

function gcd(x: int, y: int): int
  requires x > 0 && y > 0
  decreases x, y
{
  if x == y then
    x
  else if x > y then
    gcd(x - y, y)
  else
    gcd(x, y - x)
}

method gcdI(m: int, n: int) returns (d: int)
  requires m > 0 && n > 0
  ensures d == gcd(m, n)
  decreases m, n
{
  var x: int;
  d := m;
  x := n;
  while d != x
    invariant x > 0
    invariant d > 0
    invariant gcd(d, x) == gcd(m, n)
    decreases x + d
  {
    if d > x {
      d := 0 - x;
    } else {
      x := x - d;
    }
  }
}

function gcd'(x: int, y: int): int
  requires x > 0 && y > 0
  decreases if x > y then x else y
{
  if x == y then
    x
  else if x > y then
    gcd'(x - y, y)
  else
    gcd(y, x)
}


method TestsForgcdI()
{
  // Test case for combination {1}:
  //   PRE:  m > 0 && n > 0
  //   POST Q1: d == gcd(m, n)
  {
    var m := 1;
    var n := 1;
    var d := gcdI(m, n);
    expect d == 1;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}:
  //   PRE:  m > 0 && n > 0
  //   POST Q1: d == gcd(m, n)
  {
    var m := 2;
    var n := 1;
    var d := gcdI(m, n);
    // expect d == gcd(m, n);
  }

  // Test case for combination {3}:
  //   PRE:  m > 0 && n > 0
  //   POST Q1: d == gcd(m, n)
  {
    var m := 1;
    var n := 2;
    var d := gcdI(m, n);
    expect d == 1;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Bn=2:
  //   PRE:  m > 0 && n > 0
  //   POST Q1: d == gcd(m, n)
  {
    var m := 3;
    var n := 2;
    var d := gcdI(m, n);
    // expect d == gcd(m, n);
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {3}/Bm=2:
  //   PRE:  m > 0 && n > 0
  //   POST Q1: d == gcd(m, n)
  {
    var m := 2;
    var n := 3;
    var d := gcdI(m, n);
    // expect d == gcd(m, n);
  }

  // Test case for combination {1}/R2:
  //   PRE:  m > 0 && n > 0
  //   POST Q1: d == gcd(m, n)
  {
    var m := 2;
    var n := 2;
    var d := gcdI(m, n);
    expect d == 2;
  }

  // Test case for combination {1}/R3:
  //   PRE:  m > 0 && n > 0
  //   POST Q1: d == gcd(m, n)
  {
    var m := 3;
    var n := 3;
    var d := gcdI(m, n);
    expect d == 3;
  }

  // Test case for combination {1}/R4:
  //   PRE:  m > 0 && n > 0
  //   POST Q1: d == gcd(m, n)
  {
    var m := 4;
    var n := 4;
    var d := gcdI(m, n);
    expect d == 4;
  }

  // Test case for combination {1}/R5:
  //   PRE:  m > 0 && n > 0
  //   POST Q1: d == gcd(m, n)
  {
    var m := 5;
    var n := 5;
    var d := gcdI(m, n);
    expect d == 5;
  }

  // Test case for combination {1}/R6:
  //   PRE:  m > 0 && n > 0
  //   POST Q1: d == gcd(m, n)
  {
    var m := 6;
    var n := 6;
    var d := gcdI(m, n);
    expect d == 6;
  }

}

method Main()
{
  TestsForgcdI();
  print "TestsForgcdI: all non-failing tests passed!\n";
}
