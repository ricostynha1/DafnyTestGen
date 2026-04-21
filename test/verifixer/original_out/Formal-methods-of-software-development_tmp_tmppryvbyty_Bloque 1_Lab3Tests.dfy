// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Formal-methods-of-software-development_tmp_tmppryvbyty_Bloque 1_Lab3.dfy
// Method: ComputeFact
// Generated: 2026-04-08 19:12:38

// Formal-methods-of-software-development_tmp_tmppryvbyty_Bloque 1_Lab3.dfy

method multipleReturns(x: int, y: int)
    returns (more: int, less: int)
  requires y > 0
  ensures less < x < more
  decreases x, y

method multipleReturns2(x: int, y: int)
    returns (more: int, less: int)
  requires y > 0
  ensures more + less == 2 * x
  decreases x, y

method multipleReturns3(x: int, y: int)
    returns (more: int, less: int)
  requires y > 0
  ensures more - less == 2 * y
  decreases x, y

function factorial(n: int): int
  requires n >= 0
  decreases n
{
  if n == 0 || n == 1 then
    1
  else
    n * factorial(n - 1)
}

method ComputeFact(n: int) returns (f: int)
  requires n >= 0
  ensures f == factorial(n)
  decreases n
{
  assert 0 <= n <= n && 1 * factorial(n) == factorial(n);
  f := 1;
  assert 0 <= n <= n && f * factorial(n) == factorial(n);
  var x := n;
  assert 0 <= x <= n && f * factorial(x) == factorial(n);
  while x > 0
    invariant 0 <= x <= n
    invariant f * factorial(x) == factorial(n)
    decreases x - 0
  {
    assert 0 <= x - 1 <= n && f * x * factorial(x - 1) == factorial(n);
    f := f * x;
    assert 0 <= x - 1 <= n && f * factorial(x - 1) == factorial(n);
    x := x - 1;
    assert 0 <= x <= n && f * factorial(x) == factorial(n);
  }
  assert 0 <= x <= n && f * factorial(x) == factorial(n);
}

method ComputeFact2(n: int) returns (f: int)
  requires n >= 0
  ensures f == factorial(n)
  decreases n
{
  var x := 0;
  f := 1;
  while x < n
    invariant 0 <= x <= n
    invariant f == factorial(x)
    decreases n - x
  {
    x := x + 1;
    f := f * x;
    assert 0 <= x <= n && f == factorial(x);
  }
}

method Sqare(a: int) returns (x: int)
  requires a >= 1
  ensures x == a * a
  decreases a
{
  assert 1 == 1 && 1 <= 1 <= a;
  var y := 1;
  assert y * y == 1 && 1 <= y <= a;
  x := 1;
  while y < a
    invariant 1 <= y <= a
    invariant y * y == x
    decreases a - y
  {
    assert (y + 1) * (y + 1) == x + 2 * (y + 1) - 1 && 1 <= y + 1 <= a;
    y := y + 1;
    assert y * y == x + 2 * y - 1 && 1 <= y <= a;
    x := x + 2 * y - 1;
    assert y * y == x && 1 <= y <= a;
  }
  assert y * y == x && 1 <= y <= a;
}

function sumSerie(n: int): int
  requires n >= 1
  decreases n
{
  if n == 1 then
    1
  else
    sumSerie(n - 1) + 2 * n - 1
}

lemma {:induction false} Sqare_Lemma(n: int)
  requires n >= 1
  ensures sumSerie(n) == n * n
  decreases n
{
  if n == 1 {
  } else {
    Sqare_Lemma(n - 1);
    assert sumSerie(n - 1) == (n - 1) * (n - 1);
    calc == {
      sumSerie(n);
      sumSerie(n - 1) + 2 * n - 1;
      {
        Sqare_Lemma(n - 1);
        assert sumSerie(n - 1) == (n - 1) * (n - 1);
      }
      (n - 1) * (n - 1) + 2 * n - 1;
      n * n - 2 * n + 1 + 2 * n - 1;
      n * n;
    }
    assert sumSerie(n) == n * n;
  }
}

method Sqare2(a: int) returns (x: int)
  requires a >= 1
  ensures x == a * a
  decreases a
{
  assert 1 <= 1 <= a && 1 == 1 * 1;
  var y := 1;
  assert 1 <= y <= a && 1 == y * y;
  x := 1;
  assert 1 <= y <= a && x == y * y;
  while y < a
    invariant 1 <= y <= a
    invariant x == y * y
    decreases a - y
  {
    assert 1 <= y + 1 <= a && x + 2 * (y + 1) - 1 == (y + 1) * (y + 1);
    y := y + 1;
    assert 1 <= y <= a && x + 2 * y - 1 == y * y;
    x := x + 2 * y - 1;
    assert 1 <= y <= a && x == y * y;
  }
  assert 1 <= y <= a && x == y * y;
}


method GeneratedTests_ComputeFact()
{
  // Test case for combination {1}:
  //   PRE:  n >= 0
  //   POST: f == factorial(n)
  //   ENSURES: f == factorial(n)
  {
    var n := 0;
    var f := ComputeFact(n);
    expect f == 1;
  }

  // Test case for combination {2}:
  //   PRE:  n >= 0
  //   POST: f == factorial(n)
  //   ENSURES: f == factorial(n)
  {
    var n := 2;
    var f := ComputeFact(n);
    expect f == factorial(n);
  }

  // Test case for combination {1}/Bn=1:
  //   PRE:  n >= 0
  //   POST: f == factorial(n)
  //   ENSURES: f == factorial(n)
  {
    var n := 1;
    var f := ComputeFact(n);
    expect f == 1;
  }

  // Test case for combination {2}/Of<0:
  //   PRE:  n >= 0
  //   POST: f == factorial(n)
  //   ENSURES: f == factorial(n)
  {
    var n := 3;
    var f := ComputeFact(n);
    expect f == factorial(n);
  }

  // Test case for combination {2}/Of=0:
  //   PRE:  n >= 0
  //   POST: f == factorial(n)
  //   ENSURES: f == factorial(n)
  {
    var n := 4;
    var f := ComputeFact(n);
    expect f == 0;
  }

}

method GeneratedTests_ComputeFact2()
{
  // Test case for combination {1}:
  //   PRE:  n >= 0
  //   POST: f == factorial(n)
  //   ENSURES: f == factorial(n)
  {
    var n := 0;
    var f := ComputeFact2(n);
    expect f == 1;
  }

  // Test case for combination {2}:
  //   PRE:  n >= 0
  //   POST: f == factorial(n)
  //   ENSURES: f == factorial(n)
  {
    var n := 2;
    var f := ComputeFact2(n);
    expect f == factorial(n);
  }

  // Test case for combination {1}/Bn=1:
  //   PRE:  n >= 0
  //   POST: f == factorial(n)
  //   ENSURES: f == factorial(n)
  {
    var n := 1;
    var f := ComputeFact2(n);
    expect f == 1;
  }

  // Test case for combination {2}/Of<0:
  //   PRE:  n >= 0
  //   POST: f == factorial(n)
  //   ENSURES: f == factorial(n)
  {
    var n := 3;
    var f := ComputeFact2(n);
    expect f == factorial(n);
  }

  // Test case for combination {2}/Of=0:
  //   PRE:  n >= 0
  //   POST: f == factorial(n)
  //   ENSURES: f == factorial(n)
  {
    var n := 4;
    var f := ComputeFact2(n);
    expect f == 0;
  }

}

method GeneratedTests_Sqare()
{
  // Test case for combination {1}:
  //   PRE:  a >= 1
  //   POST: x == a * a
  //   ENSURES: x == a * a
  {
    var a := 1;
    var x := Sqare(a);
    expect x == 1;
  }

  // Test case for combination {1}/Ba=2:
  //   PRE:  a >= 1
  //   POST: x == a * a
  //   ENSURES: x == a * a
  {
    var a := 2;
    var x := Sqare(a);
    expect x == 4;
  }

  // Test case for combination {1}/Ox>0:
  //   PRE:  a >= 1
  //   POST: x == a * a
  //   ENSURES: x == a * a
  {
    var a := 3;
    var x := Sqare(a);
    expect x == 9;
  }

}

method GeneratedTests_Sqare2()
{
  // Test case for combination {1}:
  //   PRE:  a >= 1
  //   POST: x == a * a
  //   ENSURES: x == a * a
  {
    var a := 1;
    var x := Sqare2(a);
    expect x == 1;
  }

  // Test case for combination {1}/Ba=2:
  //   PRE:  a >= 1
  //   POST: x == a * a
  //   ENSURES: x == a * a
  {
    var a := 2;
    var x := Sqare2(a);
    expect x == 4;
  }

  // Test case for combination {1}/Ox>0:
  //   PRE:  a >= 1
  //   POST: x == a * a
  //   ENSURES: x == a * a
  {
    var a := 3;
    var x := Sqare2(a);
    expect x == 9;
  }

}

method Main()
{
  GeneratedTests_ComputeFact();
  print "GeneratedTests_ComputeFact: all tests passed!\n";
  GeneratedTests_ComputeFact2();
  print "GeneratedTests_ComputeFact2: all tests passed!\n";
  GeneratedTests_Sqare();
  print "GeneratedTests_Sqare: all tests passed!\n";
  GeneratedTests_Sqare2();
  print "GeneratedTests_Sqare2: all tests passed!\n";
}
