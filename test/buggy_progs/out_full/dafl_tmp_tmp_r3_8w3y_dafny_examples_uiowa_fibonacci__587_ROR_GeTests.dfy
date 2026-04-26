// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafl_tmp_tmp_r3_8w3y_dafny_examples_uiowa_fibonacci__587_ROR_Ge.dfy
// Method: ComputeFib
// Generated: 2026-04-24 09:35:44

// dafl_tmp_tmp_r3_8w3y_dafny_examples_uiowa_fibonacci.dfy

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

method ComputeFib(n: nat) returns (f: nat)
  ensures f == fib(n)
  decreases n
{
  if n == 0 {
    f := 0;
  } else {
    var i := 1;
    var f_2 := 0;
    var f_1 := 0;
    f := 1;
    while i >= n
      invariant i <= n
      invariant f_1 == fib(i - 1)
      invariant f == fib(i)
      decreases n - i
    {
      f_2 := f_1;
      f_1 := f;
      f := f_1 + f_2;
      i := i + 1;
    }
  }
}


method TestsForComputeFib()
{
  // Test case for combination {1}:
  //   POST Q1: f == fib(n)
  {
    var n := 0;
    var f := ComputeFib(n);
    expect f == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}:
  //   POST Q1: f == fib(n)
  {
    var n := 1;
    var f := ComputeFib(n);
    // expect f == fib(n);
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {3}:
  //   POST Q1: f == fib(n)
  {
    var n := 10;
    var f := ComputeFib(n);
    // expect f == 55; // got 1
  }

  // Test case for combination {3}/Bn=2:
  //   POST Q1: f == fib(n)
  {
    var n := 2;
    var f := ComputeFib(n);
    expect f == 1;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {3}/Bn=3:
  //   POST Q1: f == fib(n)
  {
    var n := 3;
    var f := ComputeFib(n);
    // expect f == 2; // got 1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {3}/R4:
  //   POST Q1: f == fib(n)
  {
    var n := 9;
    var f := ComputeFib(n);
    // expect f == 34; // got 1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {3}/R5:
  //   POST Q1: f == fib(n)
  {
    var n := 8;
    var f := ComputeFib(n);
    // expect f == 21; // got 1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {3}/R6:
  //   POST Q1: f == fib(n)
  {
    var n := 7;
    var f := ComputeFib(n);
    // expect f == 13; // got 1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {3}/R7:
  //   POST Q1: f == fib(n)
  {
    var n := 4;
    var f := ComputeFib(n);
    // expect f == 3; // got 1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {3}/R8:
  //   POST Q1: f == fib(n)
  {
    var n := 5;
    var f := ComputeFib(n);
    // expect f == 5; // got 1
  }

}

method Main()
{
  TestsForComputeFib();
  print "TestsForComputeFib: all non-failing tests passed!\n";
}
