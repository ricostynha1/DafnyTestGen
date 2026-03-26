// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Programmverifikation-und-synthese_tmp_tmppurk6ime_PVS_Assignment_ex_06_Hoangkim_ex_06_hoangkim.dfy
// Method: gcdI
// Generated: 2026-03-26 14:59:45

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
      d := d - x;
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


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  m > 0 && n > 0
  //   POST: d == gcd(m, n)
  {
    var m := 1;
    var n := 1;
    var d := gcdI(m, n);
    expect d == gcd(m, n);
  }

  // Test case for combination {1}:
  //   PRE:  m > 0 && n > 0
  //   POST: d == gcd(m, n)
  {
    var m := 2;
    var n := 2;
    var d := gcdI(m, n);
    expect d == gcd(m, n);
  }

  // Test case for combination {1}/Bm=1,n=2:
  //   PRE:  m > 0 && n > 0
  //   POST: d == gcd(m, n)
  {
    var m := 1;
    var n := 2;
    var d := gcdI(m, n);
    expect d == gcd(m, n);
  }

  // Test case for combination {1}/Bm=2,n=1:
  //   PRE:  m > 0 && n > 0
  //   POST: d == gcd(m, n)
  {
    var m := 2;
    var n := 1;
    var d := gcdI(m, n);
    expect d == gcd(m, n);
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
