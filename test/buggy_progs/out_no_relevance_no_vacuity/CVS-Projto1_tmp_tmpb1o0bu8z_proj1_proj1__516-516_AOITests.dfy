// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\CVS-Projto1_tmp_tmpb1o0bu8z_proj1_proj1__516-516_AOI.dfy
// Method: query
// Generated: 2026-04-24 23:16:50

// CVS-Projto1_tmp_tmpb1o0bu8z_proj1_proj1.dfy

function sum(a: array<int>, i: int, j: int): int
  requires 0 <= i <= j <= a.Length
  reads a
  decreases j
{
  if i == j then
    0
  else
    a[j - 1] + sum(a, i, j - 1)
}

method query(a: array<int>, i: int, j: int)
    returns (s: int)
  requires 0 <= i <= j <= a.Length
  ensures s == sum(a, i, j)
  decreases a, i, j
{
  s := 0;
  var aux := i;
  while aux < j
    invariant i <= aux <= j
    invariant s == sum(a, i, aux)
    decreases j - aux
  {
    s := s + a[aux];
    aux := aux + -1;
  }
  return s;
}

lemma /*{:_inductionTrigger sum(a, i, j), sum(a, k, j)}*/ /*{:_inductionTrigger sum(a, k, j), sum(a, i, k)}*/ /*{:_induction a, i, j, k}*/ queryLemma(a: array<int>, i: int, j: int, k: int)
  requires 0 <= i <= k <= j <= a.Length
  ensures sum(a, i, k) + sum(a, k, j) == sum(a, i, j)
  decreases a, i, j, k
{
}

method queryFast(a: array<int>, c: array<int>, i: int, j: int)
    returns (r: int)
  requires is_prefix_sum_for(a, c) && 0 <= i <= j <= a.Length < c.Length
  ensures r == sum(a, i, j)
  decreases a, c, i, j
{
  r := c[j] - c[i];
  queryLemma(a, 0, j, i);
  return r;
}

predicate is_prefix_sum_for(a: array<int>, c: array<int>)
  reads c, a
  decreases {c, a}, a, c
{
  a.Length + 1 == c.Length &&
  c[0] == 0 &&
  forall j: int {:trigger sum(a, 0, j)} {:trigger c[j]} :: 
    1 <= j <= a.Length ==>
      c[j] == sum(a, 0, j)
}

method from_array<T>(a: array<T>) returns (l: List<T>)
  requires a.Length > 0
  ensures forall j: int {:trigger a[j]} :: 0 <= j < a.Length ==> mem(a[j], l)
  decreases a
{
  var i := a.Length - 1;
  l := Nil;
  while i >= 0
    invariant -1 <= i < a.Length
    invariant forall j: int {:trigger a[j]} :: i + 1 <= j < a.Length ==> mem(a[j], l)
    decreases i - 0
  {
    l := Cons(a[i], l);
    i := i - 1;
  }
  return l;
}

function mem<T(==)>(x: T, l: List<T>): bool
  decreases l
{
  match l
  case Nil() =>
    false
  case Cons(y, r) =>
    if x == y then
      true
    else
      mem(x, r)
}

datatype List<T> = Nil | Cons(head: T, tail: List<T>)


method TestsForquery()
{
  // Test case for combination {1}:
  //   PRE:  0 <= i <= j <= a.Length
  //   POST Q1: s == sum(a, i, j)
  {
    var a := new int[2] [6, -10];
    var i := 2;
    var j := 2;
    var s := query(a, i, j);
    expect s == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}:
  //   PRE:  0 <= i <= j <= a.Length
  //   POST Q1: s == sum(a, i, j)
  {
    var a := new int[3] [-10, -1, -10];
    var i := 2;
    var j := 3;
    var s := query(a, i, j);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.query(BigInteger[] a, BigInteger i, BigInteger j) in C:\cygwin64\tmp\DafnyCBT_rvgti5axnph\runner.cs:line 6326
    // runtime error: at _module.__default.TestCase__1() in C:\cygwin64\tmp\DafnyCBT_rvgti5axnph\runner.cs:line 6457
    // expect s == sum(a, i, j);
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Bi=0:
  //   PRE:  0 <= i <= j <= a.Length
  //   POST Q1: s == sum(a, i, j)
  {
    var a := new int[2] [-1, -10];
    var i := 0;
    var j := 2;
    var s := query(a, i, j);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.query(BigInteger[] a, BigInteger i, BigInteger j) in C:\cygwin64\tmp\DafnyCBT_rvgti5axnph\runner.cs:line 6326
    // runtime error: at _module.__default.TestCase__2() in C:\cygwin64\tmp\DafnyCBT_rvgti5axnph\runner.cs:line 6499
    // expect s == sum(a, i, j);
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Bi=1:
  //   PRE:  0 <= i <= j <= a.Length
  //   POST Q1: s == sum(a, i, j)
  {
    var a := new int[2] [-1, -10];
    var i := 1;
    var j := 2;
    var s := query(a, i, j);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.query(BigInteger[] a, BigInteger i, BigInteger j) in C:\cygwin64\tmp\DafnyCBT_rvgti5axnph\runner.cs:line 6326
    // runtime error: at _module.__default.TestCase__3() in C:\cygwin64\tmp\DafnyCBT_rvgti5axnph\runner.cs:line 6541
    // expect s == sum(a, i, j);
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Bj=a_len-1:
  //   PRE:  0 <= i <= j <= a.Length
  //   POST Q1: s == sum(a, i, j)
  {
    var a := new int[5] [-9, 6, -1, 18, 22];
    var i := 3;
    var j := 4;
    var s := query(a, i, j);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.query(BigInteger[] a, BigInteger i, BigInteger j) in C:\cygwin64\tmp\DafnyCBT_rvgti5axnph\runner.cs:line 6326
    // runtime error: at _module.__default.TestCase__4() in C:\cygwin64\tmp\DafnyCBT_rvgti5axnph\runner.cs:line 6586
    // expect s == sum(a, i, j);
  }

  // Test case for combination {1}/O|a|=0:
  //   PRE:  0 <= i <= j <= a.Length
  //   POST Q1: s == sum(a, i, j)
  {
    var a := new int[0] [];
    var i := 0;
    var j := 0;
    var s := query(a, i, j);
    expect s == 0;
  }

  // Test case for combination {1}/O|a|=1:
  //   PRE:  0 <= i <= j <= a.Length
  //   POST Q1: s == sum(a, i, j)
  {
    var a := new int[1] [2];
    var i := 1;
    var j := 1;
    var s := query(a, i, j);
    expect s == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/O|a|=1:
  //   PRE:  0 <= i <= j <= a.Length
  //   POST Q1: s == sum(a, i, j)
  {
    var a := new int[1] [2];
    var i := 0;
    var j := 1;
    var s := query(a, i, j);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.query(BigInteger[] a, BigInteger i, BigInteger j) in C:\cygwin64\tmp\DafnyCBT_rvgti5axnph\runner.cs:line 6326
    // runtime error: at _module.__default.TestCase__7() in C:\cygwin64\tmp\DafnyCBT_rvgti5axnph\runner.cs:line 6708
    // expect s == sum(a, i, j);
  }

  // Test case for combination {1}/R4:
  //   PRE:  0 <= i <= j <= a.Length
  //   POST Q1: s == sum(a, i, j)
  {
    var a := new int[2] [-10, 6];
    var i := 2;
    var j := 2;
    var s := query(a, i, j);
    expect s == 0;
  }

  // Test case for combination {1}/R5:
  //   PRE:  0 <= i <= j <= a.Length
  //   POST Q1: s == sum(a, i, j)
  {
    var a := new int[2] [-9, 10];
    var i := 2;
    var j := 2;
    var s := query(a, i, j);
    expect s == 0;
  }

}

method TestsForqueryFast()
{
  // Test case for combination {1}/O|a|=0:
  //   PRE:  is_prefix_sum_for(a, c) && 0 <= i <= j <= a.Length < c.Length
  //   POST Q1: r == sum(a, i, j)
  {
    var a := new int[0] [];
    var c := new int[1] [0];
    var i := 0;
    var j := 0;
    expect is_prefix_sum_for(a, c) && 0 <= i <= j <= a.Length < c.Length; // PRE-CHECK
    var r := queryFast(a, c, i, j);
    expect r == 0;
  }

}

method Main()
{
  TestsForquery();
  print "TestsForquery: all non-failing tests passed!\n";
  TestsForqueryFast();
  print "TestsForqueryFast: all non-failing tests passed!\n";
}
