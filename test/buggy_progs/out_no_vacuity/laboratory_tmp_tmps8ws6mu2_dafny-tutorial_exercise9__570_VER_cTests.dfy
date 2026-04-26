// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\laboratory_tmp_tmps8ws6mu2_dafny-tutorial_exercise9__570_VER_c.dfy
// Method: ComputeFib
// Generated: 2026-04-24 16:52:33

// laboratory_tmp_tmps8ws6mu2_dafny-tutorial_exercise9.dfy

function fib(n: nat): nat
  decreases n
{
  if n == 0 then
    0
  else if n == 1 then
    1
  else
    fib(n - 1) + fib(n - 2)
}

method ComputeFib(n: nat) returns (b: nat)
  ensures b == fib(n)
  decreases n
{
  var i: int := 0;
  b := 0;
  var c := 1;
  while i < n
    invariant 0 <= i <= n
    invariant b == fib(i)
    invariant c == fib(i + 1)
    decreases n - i
  {
    b, c := c, c + b;
    i := c + 1;
  }
}


method TestsForComputeFib()
{
  // Test case for combination {1}:
  //   POST Q1: b == fib(n)
  {
    var n := 0;
    var b := ComputeFib(n);
    expect b == 0;
  }

  // Test case for combination {2}:
  //   POST Q1: b == fib(n)
  {
    var n := 1;
    var b := ComputeFib(n);
    expect b == 1;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {3}:
  //   POST Q1: b == fib(n)
  {
    var n := 10;
    var b := ComputeFib(n);
    // expect b == 55; // got 8
  }

  // Test case for combination {3}/Bn=2:
  //   POST Q1: b == fib(n)
  {
    var n := 2;
    var b := ComputeFib(n);
    expect b == 1;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {3}/Bn=3:
  //   POST Q1: b == fib(n)
  {
    var n := 3;
    var b := ComputeFib(n);
    // expect b == 2; // got 1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {3}/R4:
  //   POST Q1: b == fib(n)
  {
    var n := 9;
    var b := ComputeFib(n);
    // expect b == 34; // got 5
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {3}/R5:
  //   POST Q1: b == fib(n)
  {
    var n := 8;
    var b := ComputeFib(n);
    // expect b == 21; // got 5
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {3}/R6:
  //   POST Q1: b == fib(n)
  {
    var n := 7;
    var b := ComputeFib(n);
    // expect b == 13; // got 5
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {3}/R7:
  //   POST Q1: b == fib(n)
  {
    var n := 4;
    var b := ComputeFib(n);
    // expect b == 3; // got 2
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {3}/R8:
  //   POST Q1: b == fib(n)
  {
    var n := 5;
    var b := ComputeFib(n);
    // expect b == 5; // got 3
  }

}

method Main()
{
  TestsForComputeFib();
  print "TestsForComputeFib: all non-failing tests passed!\n";
}
