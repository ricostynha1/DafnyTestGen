// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Formal-methods-of-software-development_tmp_tmppryvbyty_Bloque 1_Lab3__2107_LVR_2.dfy
// Method: multipleReturns
// Generated: 2026-04-24 16:46:06

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
    sumSerie(n - 2) + 2 * n - 1
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


method TestsFormultipleReturns()
{
  // Test case for combination {1}:
  //   PRE:  y > 0
  //   POST Q1: less < x < more
  {
    var x := -10;
    var y := 2;
    // var more, less := multipleReturns(x, y);
    // expect less < x < more;
  }

  // Test case for combination {1}/By=1:
  //   PRE:  y > 0
  //   POST Q1: less < x < more
  {
    var x := -1;
    var y := 1;
    // var more, less := multipleReturns(x, y);
    // expect less < x < more;
  }

  // Test case for combination {1}/Ox=0:
  //   PRE:  y > 0
  //   POST Q1: less < x < more
  {
    var x := 0;
    var y := 2;
    // var more, less := multipleReturns(x, y);
    // expect less < x < more;
  }

  // Test case for combination {1}/Ox>0:
  //   PRE:  y > 0
  //   POST Q1: less < x < more
  {
    var x := 10;
    var y := 10;
    // var more, less := multipleReturns(x, y);
    // expect less < x < more;
  }

  // Test case for combination {1}/Oless=0:
  //   PRE:  y > 0
  //   POST Q1: less < x < more
  {
    var x := 9;
    var y := 10;
    // var more, less := multipleReturns(x, y);
    // expect less < x < more;
  }

  // Test case for combination {1}/R6:
  //   PRE:  y > 0
  //   POST Q1: less < x < more
  {
    var x := 8;
    var y := 10;
    // var more, less := multipleReturns(x, y);
    // expect less < x < more;
  }

  // Test case for combination {1}/R7:
  //   PRE:  y > 0
  //   POST Q1: less < x < more
  {
    var x := 10;
    var y := 9;
    // var more, less := multipleReturns(x, y);
    // expect less < x < more;
  }

  // Test case for combination {1}/R8:
  //   PRE:  y > 0
  //   POST Q1: less < x < more
  {
    var x := -10;
    var y := 10;
    // var more, less := multipleReturns(x, y);
    // expect less < x < more;
  }

  // Test case for combination {1}/R9:
  //   PRE:  y > 0
  //   POST Q1: less < x < more
  {
    var x := -9;
    var y := 10;
    // var more, less := multipleReturns(x, y);
    // expect less < x < more;
  }

  // Test case for combination {1}/R10:
  //   PRE:  y > 0
  //   POST Q1: less < x < more
  {
    var x := -8;
    var y := 10;
    // var more, less := multipleReturns(x, y);
    // expect less < x < more;
  }

}

method TestsFormultipleReturns2()
{
  // Test case for combination {1}:
  //   PRE:  y > 0
  //   POST Q1: more + less == 2 * x
  {
    var x := -10;
    var y := 10;
    // var more, less := multipleReturns2(x, y);
    // expect more + less == 2 * x;
  }

  // Test case for combination {1}/By=1:
  //   PRE:  y > 0
  //   POST Q1: more + less == 2 * x
  {
    var x := 10;
    var y := 1;
    // var more, less := multipleReturns2(x, y);
    // expect more + less == 2 * x;
  }

  // Test case for combination {1}/By=2:
  //   PRE:  y > 0
  //   POST Q1: more + less == 2 * x
  {
    var x := 10;
    var y := 2;
    // var more, less := multipleReturns2(x, y);
    // expect more + less == 2 * x;
  }

  // Test case for combination {1}/Ox=0:
  //   PRE:  y > 0
  //   POST Q1: more + less == 2 * x
  {
    var x := 0;
    var y := 10;
    // var more, less := multipleReturns2(x, y);
    // expect more + less == 2 * x;
  }

  // Test case for combination {1}/Oless>0:
  //   PRE:  y > 0
  //   POST Q1: more + less == 2 * x
  {
    var x := -9;
    var y := 10;
    // var more, less := multipleReturns2(x, y);
    // expect more + less == 2 * x;
  }

  // Test case for combination {1}/Oless<0:
  //   PRE:  y > 0
  //   POST Q1: more + less == 2 * x
  {
    var x := -10;
    var y := 9;
    // var more, less := multipleReturns2(x, y);
    // expect more + less == 2 * x;
  }

  // Test case for combination {1}/R7:
  //   PRE:  y > 0
  //   POST Q1: more + less == 2 * x
  {
    var x := -8;
    var y := 10;
    // var more, less := multipleReturns2(x, y);
    // expect more + less == 2 * x;
  }

  // Test case for combination {1}/R8:
  //   PRE:  y > 0
  //   POST Q1: more + less == 2 * x
  {
    var x := -7;
    var y := 10;
    // var more, less := multipleReturns2(x, y);
    // expect more + less == 2 * x;
  }

  // Test case for combination {1}/R9:
  //   PRE:  y > 0
  //   POST Q1: more + less == 2 * x
  {
    var x := 10;
    var y := 10;
    // var more, less := multipleReturns2(x, y);
    // expect more + less == 2 * x;
  }

  // Test case for combination {1}/R10:
  //   PRE:  y > 0
  //   POST Q1: more + less == 2 * x
  {
    var x := 9;
    var y := 10;
    // var more, less := multipleReturns2(x, y);
    // expect more + less == 2 * x;
  }

}

method TestsFormultipleReturns3()
{
  // Test case for combination {1}:
  //   PRE:  y > 0
  //   POST Q1: more - less == 2 * y
  {
    var x := -10;
    var y := 10;
    // var more, less := multipleReturns3(x, y);
    // expect more - less == 2 * y;
  }

  // Test case for combination {1}/By=1:
  //   PRE:  y > 0
  //   POST Q1: more - less == 2 * y
  {
    var x := 10;
    var y := 1;
    // var more, less := multipleReturns3(x, y);
    // expect more - less == 2 * y;
  }

  // Test case for combination {1}/By=2:
  //   PRE:  y > 0
  //   POST Q1: more - less == 2 * y
  {
    var x := 10;
    var y := 2;
    // var more, less := multipleReturns3(x, y);
    // expect more - less == 2 * y;
  }

  // Test case for combination {1}/Ox=0:
  //   PRE:  y > 0
  //   POST Q1: more - less == 2 * y
  {
    var x := 0;
    var y := 10;
    // var more, less := multipleReturns3(x, y);
    // expect more - less == 2 * y;
  }

  // Test case for combination {1}/Omore=0:
  //   PRE:  y > 0
  //   POST Q1: more - less == 2 * y
  {
    var x := 2;
    var y := 9;
    // var more, less := multipleReturns3(x, y);
    // expect more - less == 2 * y;
  }

  // Test case for combination {1}/Omore<0:
  //   PRE:  y > 0
  //   POST Q1: more - less == 2 * y
  {
    var x := 10;
    var y := 10;
    // var more, less := multipleReturns3(x, y);
    // expect more - less == 2 * y;
  }

  // Test case for combination {1}/Oless>0:
  //   PRE:  y > 0
  //   POST Q1: more - less == 2 * y
  {
    var x := 10;
    var y := 9;
    // var more, less := multipleReturns3(x, y);
    // expect more - less == 2 * y;
  }

  // Test case for combination {1}/R8:
  //   PRE:  y > 0
  //   POST Q1: more - less == 2 * y
  {
    var x := -9;
    var y := 10;
    // var more, less := multipleReturns3(x, y);
    // expect more - less == 2 * y;
  }

  // Test case for combination {1}/R9:
  //   PRE:  y > 0
  //   POST Q1: more - less == 2 * y
  {
    var x := -8;
    var y := 10;
    // var more, less := multipleReturns3(x, y);
    // expect more - less == 2 * y;
  }

  // Test case for combination {1}/R10:
  //   PRE:  y > 0
  //   POST Q1: more - less == 2 * y
  {
    var x := 9;
    var y := 10;
    // var more, less := multipleReturns3(x, y);
    // expect more - less == 2 * y;
  }

}

method TestsForComputeFact()
{
  // Test case for combination {1}:
  //   PRE:  n >= 0
  //   POST Q1: f == factorial(n)
  {
    var n := 0;
    var f := ComputeFact(n);
    expect f == factorial(n);
  }

  // Test case for combination {2}:
  //   PRE:  n >= 0
  //   POST Q1: f == factorial(n)
  {
    var n := 1;
    var f := ComputeFact(n);
    expect f == factorial(n);
  }

  // Test case for combination {3}:
  //   PRE:  n >= 0
  //   POST Q1: f == factorial(n)
  {
    var n := 10;
    var f := ComputeFact(n);
    expect f == factorial(n);
  }

  // Test case for combination {3}/Bn=2:
  //   PRE:  n >= 0
  //   POST Q1: f == factorial(n)
  {
    var n := 2;
    var f := ComputeFact(n);
    expect f == factorial(n);
  }

  // Test case for combination {3}/Bn=3:
  //   PRE:  n >= 0
  //   POST Q1: f == factorial(n)
  {
    var n := 3;
    var f := ComputeFact(n);
    expect f == factorial(n);
  }

  // Test case for combination {3}/R4:
  //   PRE:  n >= 0
  //   POST Q1: f == factorial(n)
  {
    var n := 9;
    var f := ComputeFact(n);
    expect f == factorial(n);
  }

  // Test case for combination {3}/R5:
  //   PRE:  n >= 0
  //   POST Q1: f == factorial(n)
  {
    var n := 8;
    var f := ComputeFact(n);
    expect f == factorial(n);
  }

  // Test case for combination {3}/R6:
  //   PRE:  n >= 0
  //   POST Q1: f == factorial(n)
  {
    var n := 7;
    var f := ComputeFact(n);
    expect f == factorial(n);
  }

  // Test case for combination {3}/R7:
  //   PRE:  n >= 0
  //   POST Q1: f == factorial(n)
  {
    var n := 6;
    var f := ComputeFact(n);
    expect f == factorial(n);
  }

  // Test case for combination {3}/R8:
  //   PRE:  n >= 0
  //   POST Q1: f == factorial(n)
  {
    var n := 5;
    var f := ComputeFact(n);
    expect f == factorial(n);
  }

}

method TestsForComputeFact2()
{
  // Test case for combination {1}:
  //   PRE:  n >= 0
  //   POST Q1: f == factorial(n)
  {
    var n := 0;
    var f := ComputeFact2(n);
    expect f == factorial(n);
  }

  // Test case for combination {2}:
  //   PRE:  n >= 0
  //   POST Q1: f == factorial(n)
  {
    var n := 1;
    var f := ComputeFact2(n);
    expect f == factorial(n);
  }

  // Test case for combination {3}:
  //   PRE:  n >= 0
  //   POST Q1: f == factorial(n)
  {
    var n := 10;
    var f := ComputeFact2(n);
    expect f == factorial(n);
  }

  // Test case for combination {3}/Bn=2:
  //   PRE:  n >= 0
  //   POST Q1: f == factorial(n)
  {
    var n := 2;
    var f := ComputeFact2(n);
    expect f == factorial(n);
  }

  // Test case for combination {3}/Bn=3:
  //   PRE:  n >= 0
  //   POST Q1: f == factorial(n)
  {
    var n := 3;
    var f := ComputeFact2(n);
    expect f == factorial(n);
  }

  // Test case for combination {3}/R4:
  //   PRE:  n >= 0
  //   POST Q1: f == factorial(n)
  {
    var n := 9;
    var f := ComputeFact2(n);
    expect f == factorial(n);
  }

  // Test case for combination {3}/R5:
  //   PRE:  n >= 0
  //   POST Q1: f == factorial(n)
  {
    var n := 8;
    var f := ComputeFact2(n);
    expect f == factorial(n);
  }

  // Test case for combination {3}/R6:
  //   PRE:  n >= 0
  //   POST Q1: f == factorial(n)
  {
    var n := 7;
    var f := ComputeFact2(n);
    expect f == factorial(n);
  }

  // Test case for combination {3}/R7:
  //   PRE:  n >= 0
  //   POST Q1: f == factorial(n)
  {
    var n := 6;
    var f := ComputeFact2(n);
    expect f == factorial(n);
  }

  // Test case for combination {3}/R8:
  //   PRE:  n >= 0
  //   POST Q1: f == factorial(n)
  {
    var n := 5;
    var f := ComputeFact2(n);
    expect f == factorial(n);
  }

}

method TestsForSqare()
{
  // Test case for combination {1}:
  //   PRE:  a >= 1
  //   POST Q1: x == a * a
  {
    var a := 10;
    var x := Sqare(a);
    expect x == 100;
  }

  // Test case for combination {1}/Ba=1:
  //   PRE:  a >= 1
  //   POST Q1: x == a * a
  {
    var a := 1;
    var x := Sqare(a);
    expect x == 1;
  }

  // Test case for combination {1}/Ba=2:
  //   PRE:  a >= 1
  //   POST Q1: x == a * a
  {
    var a := 2;
    var x := Sqare(a);
    expect x == 4;
  }

  // Test case for combination {1}/R4:
  //   PRE:  a >= 1
  //   POST Q1: x == a * a
  {
    var a := 9;
    var x := Sqare(a);
    expect x == 81;
  }

  // Test case for combination {1}/R5:
  //   PRE:  a >= 1
  //   POST Q1: x == a * a
  {
    var a := 8;
    var x := Sqare(a);
    expect x == 64;
  }

  // Test case for combination {1}/R6:
  //   PRE:  a >= 1
  //   POST Q1: x == a * a
  {
    var a := 7;
    var x := Sqare(a);
    expect x == 49;
  }

  // Test case for combination {1}/R7:
  //   PRE:  a >= 1
  //   POST Q1: x == a * a
  {
    var a := 6;
    var x := Sqare(a);
    expect x == 36;
  }

  // Test case for combination {1}/R8:
  //   PRE:  a >= 1
  //   POST Q1: x == a * a
  {
    var a := 5;
    var x := Sqare(a);
    expect x == 25;
  }

  // Test case for combination {1}/R9:
  //   PRE:  a >= 1
  //   POST Q1: x == a * a
  {
    var a := 4;
    var x := Sqare(a);
    expect x == 16;
  }

  // Test case for combination {1}/R10:
  //   PRE:  a >= 1
  //   POST Q1: x == a * a
  {
    var a := 3;
    var x := Sqare(a);
    expect x == 9;
  }

}

method TestsForSqare2()
{
  // Test case for combination {1}:
  //   PRE:  a >= 1
  //   POST Q1: x == a * a
  {
    var a := 10;
    var x := Sqare2(a);
    expect x == 100;
  }

  // Test case for combination {1}/Ba=1:
  //   PRE:  a >= 1
  //   POST Q1: x == a * a
  {
    var a := 1;
    var x := Sqare2(a);
    expect x == 1;
  }

  // Test case for combination {1}/Ba=2:
  //   PRE:  a >= 1
  //   POST Q1: x == a * a
  {
    var a := 2;
    var x := Sqare2(a);
    expect x == 4;
  }

  // Test case for combination {1}/R4:
  //   PRE:  a >= 1
  //   POST Q1: x == a * a
  {
    var a := 9;
    var x := Sqare2(a);
    expect x == 81;
  }

  // Test case for combination {1}/R5:
  //   PRE:  a >= 1
  //   POST Q1: x == a * a
  {
    var a := 8;
    var x := Sqare2(a);
    expect x == 64;
  }

  // Test case for combination {1}/R6:
  //   PRE:  a >= 1
  //   POST Q1: x == a * a
  {
    var a := 7;
    var x := Sqare2(a);
    expect x == 49;
  }

  // Test case for combination {1}/R7:
  //   PRE:  a >= 1
  //   POST Q1: x == a * a
  {
    var a := 6;
    var x := Sqare2(a);
    expect x == 36;
  }

  // Test case for combination {1}/R8:
  //   PRE:  a >= 1
  //   POST Q1: x == a * a
  {
    var a := 5;
    var x := Sqare2(a);
    expect x == 25;
  }

  // Test case for combination {1}/R9:
  //   PRE:  a >= 1
  //   POST Q1: x == a * a
  {
    var a := 4;
    var x := Sqare2(a);
    expect x == 16;
  }

  // Test case for combination {1}/R10:
  //   PRE:  a >= 1
  //   POST Q1: x == a * a
  {
    var a := 3;
    var x := Sqare2(a);
    expect x == 9;
  }

}

method Main()
{
  TestsFormultipleReturns();
  print "TestsFormultipleReturns: all tests passed!\n";
  TestsFormultipleReturns2();
  print "TestsFormultipleReturns2: all tests passed!\n";
  TestsFormultipleReturns3();
  print "TestsFormultipleReturns3: all tests passed!\n";
  TestsForComputeFact();
  print "TestsForComputeFact: all tests passed!\n";
  TestsForComputeFact2();
  print "TestsForComputeFact2: all tests passed!\n";
  TestsForSqare();
  print "TestsForSqare: all tests passed!\n";
  TestsForSqare2();
  print "TestsForSqare2: all tests passed!\n";
}
