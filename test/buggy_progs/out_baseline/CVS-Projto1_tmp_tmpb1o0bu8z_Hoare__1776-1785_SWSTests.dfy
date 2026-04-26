// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\CVS-Projto1_tmp_tmpb1o0bu8z_Hoare__1776-1785_SWS.dfy
// Method: Max
// Generated: 2026-04-24 19:33:11

// CVS-Projto1_tmp_tmpb1o0bu8z_Hoare.dfy

method Max(x: nat, y: nat) returns (r: nat)
  ensures r >= x && r >= y
  ensures r == x || r == y
  decreases x, y
{
  if x >= y {
    r := x;
  } else {
    r := y;
  }
}

method Test()
{
  var result := Max(42, 73);
  assert result == 73;
}

method m1(x: int, y: int) returns (z: int)
  requires 0 < x < y
  ensures z >= 0 && z <= y && z != x
  decreases x, y
{
  z := 0;
}

function fib(n: nat): nat
  decreases n
{
  if n == 0 then
    1
  else if n == 1 then
    1
  else
    fib(n - 1) + fib(n - 2)
}

method Fib(n: nat) returns (r: nat)
  ensures r == fib(n)
  decreases n
{
  if n == 0 {
    return 1;
  }
  r := 1;
  var next := 2;
  var i := 1;
  while i < n
    invariant 1 <= i <= n
    invariant r == fib(i)
    invariant next == fib(i + 1)
    decreases n - i
  {
    var tmp := next;
    next := next + r;
    r := tmp;
    i := i + 1;
  }
  assert r == fib(n);
  return r;
}

function add(l: List<int>): int
  decreases l
{
  match l
  case Nil() =>
    0
  case Cons(x, xs) =>
    x + add(xs)
}

method addImp(l: List<int>) returns (s: int)
  ensures s == add(l)
  decreases l
{
  var ll := l;
  s := 0;
  while ll != Nil
    invariant add(l) == s + add(ll)
    decreases ll
  {
    s := s + ll.head;
    ll := ll.tail;
  }
  assert s == add(l);
}

method MaxA(a: array<int>) returns (m: int)
  requires a.Length > 0
  ensures forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  ensures exists i: int {:trigger a[i]} :: 0 <= i < a.Length && a[i] == m
  decreases a
{
  m := a[0];
  var i := 1;
  while i < a.Length
    invariant 1 <= i <= a.Length
    invariant forall j: int {:trigger a[j]} :: 0 <= j < i ==> a[j] <= m
    invariant exists j: int {:trigger a[j]} :: 0 <= j < i && a[j] == m
    decreases a.Length - i
  {
    i := i + 1;
    if a[i] > m {
      m := a[i];
    }
  }
}

datatype List<T> = Nil | Cons(head: T, tail: List<T>)


method TestsForMax()
{
  // Test case for combination {1}:
  //   POST Q1: r == x
  //   POST Q2: r >= y
  {
    var x := 0;
    var y := 0;
    var r := Max(x, y);
    expect r == 0;
  }

  // Test case for combination {2}:
  //   POST Q1: r > x
  //   POST Q2: r == y
  {
    var x := 0;
    var y := 1;
    var r := Max(x, y);
    expect r == 1;
  }

  // Test case for combination {1}/By=1:
  //   POST Q1: r == x
  //   POST Q2: r >= y
  {
    var x := 1;
    var y := 1;
    var r := Max(x, y);
    expect r == 1;
  }

  // Test case for combination {2}/Bx=1:
  //   POST Q1: r > x
  //   POST Q2: r == y
  {
    var x := 1;
    var y := 2;
    var r := Max(x, y);
    expect r == 2;
  }

  // Test case for combination {1}/Ox>=2:
  //   POST Q1: r == x
  //   POST Q2: r >= y
  {
    var x := 2;
    var y := 0;
    var r := Max(x, y);
    expect r == 2;
  }

  // Test case for combination {1}/Oy>=2:
  //   POST Q1: r == x
  //   POST Q2: r >= y
  {
    var x := 3;
    var y := 3;
    var r := Max(x, y);
    expect r == 3;
  }

  // Test case for combination {2}/Ox>=2:
  //   POST Q1: r > x
  //   POST Q2: r == y
  {
    var x := 2;
    var y := 3;
    var r := Max(x, y);
    expect r == 3;
  }

  // Test case for combination {1}/R5:
  //   POST Q1: r == x
  //   POST Q2: r >= y
  {
    var x := 1;
    var y := 0;
    var r := Max(x, y);
    expect r == 1;
  }

  // Test case for combination {1}/R6:
  //   POST Q1: r == x
  //   POST Q2: r >= y
  {
    var x := 2;
    var y := 1;
    var r := Max(x, y);
    expect r == 2;
  }

  // Test case for combination {1}/R7:
  //   POST Q1: r == x
  //   POST Q2: r >= y
  {
    var x := 3;
    var y := 1;
    var r := Max(x, y);
    expect r == 3;
  }

}

method TestsForm1()
{
  // Test case for combination {1}:
  //   PRE:  0 < x < y
  //   POST Q1: z >= 0
  //   POST Q2: z <= y
  //   POST Q3: z != x
  {
    var x := 1;
    var y := 2;
    var z := m1(x, y);
    expect z == 0 || z == 2;
    expect z == 0; // observed from implementation
  }

  // Test case for combination {1}/Bx=2:
  //   PRE:  0 < x < y
  //   POST Q1: z >= 0
  //   POST Q2: z <= y
  //   POST Q3: z != x
  {
    var x := 2;
    var y := 3;
    var z := m1(x, y);
    expect z == 0 || z == 1 || z == 3;
    expect z == 0; // observed from implementation
  }

  // Test case for combination {1}/Bz=1:
  //   PRE:  0 < x < y
  //   POST Q1: z >= 0
  //   POST Q2: z <= y
  //   POST Q3: z != x
  {
    var x := 3;
    var y := 4;
    var z := m1(x, y);
    expect z == 1 || z == 0 || z == 4 || z == 2;
    expect z == 0; // observed from implementation
  }

  // Test case for combination {1}/Bz=y:
  //   PRE:  0 < x < y
  //   POST Q1: z >= 0 && z <= y && z != x
  {
    var x := 4;
    var y := 5;
    var z := m1(x, y);
    expect z >= 0 && z <= y && z != x;
    expect z == 0; // observed from implementation
  }

  // Test case for combination {1}/Bz=y-1:
  //   PRE:  0 < x < y
  //   POST Q1: z >= 0
  //   POST Q2: z <= y
  //   POST Q3: z != x
  {
    var x := 1;
    var y := 3;
    var z := m1(x, y);
    expect z == 2 || z == 0 || z == 3;
    expect z == 0; // observed from implementation
  }

  // Test case for combination {1}/R6:
  //   PRE:  0 < x < y
  //   POST Q1: z >= 0 && z <= y && z != x
  {
    var x := 3;
    var y := 5;
    var z := m1(x, y);
    expect z >= 0 && z <= y && z != x;
    expect z == 0; // observed from implementation
  }

  // Test case for combination {1}/R7:
  //   PRE:  0 < x < y
  //   POST Q1: z >= 0 && z <= y && z != x
  {
    var x := 3;
    var y := 6;
    var z := m1(x, y);
    expect z >= 0 && z <= y && z != x;
    expect z == 0; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   PRE:  0 < x < y
  //   POST Q1: z >= 0
  //   POST Q2: z <= y
  //   POST Q3: z != x
  {
    var x := 2;
    var y := 4;
    var z := m1(x, y);
    expect z == 0 || z == 4 || z == 1 || z == 3;
    expect z == 0; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   PRE:  0 < x < y
  //   POST Q1: z >= 0 && z <= y && z != x
  {
    var x := 2;
    var y := 5;
    var z := m1(x, y);
    expect z >= 0 && z <= y && z != x;
    expect z == 0; // observed from implementation
  }

  // Test case for combination {1}/R10:
  //   PRE:  0 < x < y
  //   POST Q1: z >= 0 && z <= y && z != x
  {
    var x := 2;
    var y := 6;
    var z := m1(x, y);
    expect z >= 0 && z <= y && z != x;
    expect z == 0; // observed from implementation
  }

}

method TestsForFib()
{
  // Test case for combination {1}:
  //   POST Q1: r == fib(n)
  {
    var n := 0;
    var r := Fib(n);
    expect r == 1;
  }

  // Test case for combination {2}:
  //   POST Q1: r == fib(n)
  {
    var n := 1;
    var r := Fib(n);
    expect r == 1;
  }

  // Test case for combination {3}:
  //   POST Q1: r == fib(n)
  {
    var n := 2;
    var r := Fib(n);
    expect r == 2;
  }

  // Test case for combination {3}/Bn=3:
  //   POST Q1: r == fib(n)
  {
    var n := 3;
    var r := Fib(n);
    expect r == 3;
  }

  // Test case for combination {3}/R3:
  //   POST Q1: r == fib(n)
  {
    var n := 4;
    var r := Fib(n);
    expect r == 5;
  }

  // Test case for combination {3}/R4:
  //   POST Q1: r == fib(n)
  {
    var n := 5;
    var r := Fib(n);
    expect r == 8;
  }

  // Test case for combination {3}/R5:
  //   POST Q1: r == fib(n)
  {
    var n := 6;
    var r := Fib(n);
    expect r == 13;
  }

  // Test case for combination {3}/R6:
  //   POST Q1: r == fib(n)
  {
    var n := 7;
    var r := Fib(n);
    expect r == 21;
  }

  // Test case for combination {3}/R7:
  //   POST Q1: r == fib(n)
  {
    var n := 8;
    var r := Fib(n);
    expect r == 34;
  }

  // Test case for combination {3}/R8:
  //   POST Q1: r == fib(n)
  {
    var n := 9;
    var r := Fib(n);
    expect r == 55;
  }

}

method TestsForMaxA()
{
  // Test case for combination {1}:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  //   POST Q2: 0 <= (a.Length - 1)
  //   POST Q3: a[0] == m
  {
    var a := new int[1] [175];
    var m := MaxA(a);
    expect m == 175;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  //   POST Q2: exists i :: 1 <= i < (a.Length - 1) && a[i] == m
  {
    var a := new int[3] [-175, 0, -400];
    var m := MaxA(a);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.MaxA(BigInteger[] a) in C:\cygwin64\tmp\DafnyCBT_g2datp0e54c\runner.cs:line 6595
    // runtime error: at _module.__default.TestCase__31() in C:\cygwin64\tmp\DafnyCBT_g2datp0e54c\runner.cs:line 7535
    // expect m == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|a|>=2:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  //   POST Q2: 0 <= (a.Length - 1)
  //   POST Q3: a[0] == m
  {
    var a := new int[2] [400, -175];
    var m := MaxA(a);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.MaxA(BigInteger[] a) in C:\cygwin64\tmp\DafnyCBT_g2datp0e54c\runner.cs:line 6595
    // runtime error: at _module.__default.TestCase__32() in C:\cygwin64\tmp\DafnyCBT_g2datp0e54c\runner.cs:line 7564
    // expect m == 400;
  }

  // Test case for combination {1}/Om=0:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  //   POST Q2: 0 <= (a.Length - 1)
  //   POST Q3: a[0] == m
  {
    var a := new int[1] [0];
    var m := MaxA(a);
    expect m == 0;
  }

  // Test case for combination {1}/Om<0:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  //   POST Q2: 0 <= (a.Length - 1)
  //   POST Q3: a[0] == m
  {
    var a := new int[1] [-1];
    var m := MaxA(a);
    expect m == -1;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Om>0:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  //   POST Q2: exists i :: 1 <= i < (a.Length - 1) && a[i] == m
  {
    var a := new int[4] [-175, 401, -401, -17869];
    var m := MaxA(a);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.MaxA(BigInteger[] a) in C:\cygwin64\tmp\DafnyCBT_g2datp0e54c\runner.cs:line 6595
    // runtime error: at _module.__default.TestCase__35() in C:\cygwin64\tmp\DafnyCBT_g2datp0e54c\runner.cs:line 7651
    // expect m == 401;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Om<0:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  //   POST Q2: exists i :: 1 <= i < (a.Length - 1) && a[i] == m
  {
    var a := new int[3] [-226, -226, -401];
    var m := MaxA(a);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.MaxA(BigInteger[] a) in C:\cygwin64\tmp\DafnyCBT_g2datp0e54c\runner.cs:line 6595
    // runtime error: at _module.__default.TestCase__36() in C:\cygwin64\tmp\DafnyCBT_g2datp0e54c\runner.cs:line 7681
    // expect m == -226;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {3}/O|a|>=2:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  //   POST Q2: 0 <= (a.Length - 1)
  //   POST Q3: a[(a.Length - 1)] == m
  {
    var a := new int[2] [-175, 0];
    var m := MaxA(a);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.MaxA(BigInteger[] a) in C:\cygwin64\tmp\DafnyCBT_g2datp0e54c\runner.cs:line 6595
    // runtime error: at _module.__default.TestCase__37() in C:\cygwin64\tmp\DafnyCBT_g2datp0e54c\runner.cs:line 7710
    // expect m == 0;
  }

  // Test case for combination {1}/R5:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  //   POST Q2: 0 <= (a.Length - 1)
  //   POST Q3: a[0] == m
  {
    var a := new int[1] [-2];
    var m := MaxA(a);
    expect m == -2;
  }

  // Test case for combination {1}/R6:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  //   POST Q2: 0 <= (a.Length - 1)
  //   POST Q3: a[0] == m
  {
    var a := new int[1] [-3];
    var m := MaxA(a);
    expect m == -3;
  }

}

method Main()
{
  TestsForMax();
  print "TestsForMax: all non-failing tests passed!\n";
  TestsForm1();
  print "TestsForm1: all non-failing tests passed!\n";
  TestsForFib();
  print "TestsForFib: all non-failing tests passed!\n";
  TestsForMaxA();
  print "TestsForMaxA: all non-failing tests passed!\n";
}
