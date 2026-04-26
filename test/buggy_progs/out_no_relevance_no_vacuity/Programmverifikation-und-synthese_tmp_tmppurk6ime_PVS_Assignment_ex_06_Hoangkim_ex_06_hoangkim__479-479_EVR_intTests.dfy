// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Programmverifikation-und-synthese_tmp_tmppurk6ime_PVS_Assignment_ex_06_Hoangkim_ex_06_hoangkim__479-479_EVR_int.dfy
// Method: gcdI
// Generated: 2026-04-25 00:25:18

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
    var m := 10;
    var n := 10;
    var d := gcdI(m, n);
    expect d == 10;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}:
  //   PRE:  m > 0 && n > 0
  //   POST Q1: d == gcd(m, n)
  {
    var m := 10;
    var n := 2;
    var d := gcdI(m, n);
    // expect d == gcd(m, n);
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {3}:
  //   PRE:  m > 0 && n > 0
  //   POST Q1: d == gcd(m, n)
  {
    var m := 9;
    var n := 10;
    var d := gcdI(m, n);
    // expect d == gcd(m, n);
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Bm=2:
  //   PRE:  m > 0 && n > 0
  //   POST Q1: d == gcd(m, n)
  {
    var m := 2;
    var n := 1;
    var d := gcdI(m, n);
    // expect d == gcd(m, n);
  }

  // Test case for combination {3}/Bm=1:
  //   PRE:  m > 0 && n > 0
  //   POST Q1: d == gcd(m, n)
  {
    var m := 1;
    var n := 10;
    var d := gcdI(m, n);
    expect d == 1;
  }

  // Test case for combination {3}/Bm=2:
  //   PRE:  m > 0 && n > 0
  //   POST Q1: d == gcd(m, n)
  {
    var m := 2;
    var n := 10;
    var d := gcdI(m, n);
    expect d == 2;
  }

  // Test case for combination {3}/Bn=2:
  //   PRE:  m > 0 && n > 0
  //   POST Q1: d == gcd(m, n)
  {
    var m := 1;
    var n := 2;
    var d := gcdI(m, n);
    expect d == 1;
  }

  // Test case for combination {1}/R2:
  //   PRE:  m > 0 && n > 0
  //   POST Q1: d == gcd(m, n)
  {
    var m := 9;
    var n := 9;
    var d := gcdI(m, n);
    expect d == 9;
  }

  // Test case for combination {1}/R3:
  //   PRE:  m > 0 && n > 0
  //   POST Q1: d == gcd(m, n)
  {
    var m := 8;
    var n := 8;
    var d := gcdI(m, n);
    expect d == 8;
  }

  // Test case for combination {1}/R4:
  //   PRE:  m > 0 && n > 0
  //   POST Q1: d == gcd(m, n)
  {
    var m := 7;
    var n := 7;
    var d := gcdI(m, n);
    expect d == 7;
  }

}

method Main()
{
  TestsForgcdI();
  print "TestsForgcdI: all non-failing tests passed!\n";
}
