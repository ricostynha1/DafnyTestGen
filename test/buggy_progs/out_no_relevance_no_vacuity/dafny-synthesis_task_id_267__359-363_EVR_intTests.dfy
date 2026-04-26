// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-synthesis_task_id_267__359-363_EVR_int.dfy
// Method: SumOfSquaresOfFirstNOddNumbers
// Generated: 2026-04-24 23:49:51

// dafny-synthesis_task_id_267.dfy

method SumOfSquaresOfFirstNOddNumbers(n: int) returns (sum: int)
  requires n >= 0
  ensures sum == n * (2 * n - 1) * (2 * n + 1) / 3
  decreases n
{
  sum := 0;
  var i := 1;
  for k: int := 0 to n
    invariant 0 <= k <= n
    invariant sum == k * (2 * k - 1) * (2 * k + 1) / 3
    invariant i == 2 * k + 1
  {
    sum := sum + i * i;
    i := 0;
  }
}


method TestsForSumOfSquaresOfFirstNOddNumbers()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}:
  //   PRE:  n >= 0
  //   POST Q1: sum == n * (2 * n - 1) * (2 * n + 1) / 3
  {
    var n := 10;
    var sum := SumOfSquaresOfFirstNOddNumbers(n);
    // expect sum == 1330; // got 1
  }

  // Test case for combination {1}/Bn=0:
  //   PRE:  n >= 0
  //   POST Q1: sum == n * (2 * n - 1) * (2 * n + 1) / 3
  {
    var n := 0;
    var sum := SumOfSquaresOfFirstNOddNumbers(n);
    expect sum == 0;
  }

  // Test case for combination {1}/Bn=1:
  //   PRE:  n >= 0
  //   POST Q1: sum == n * (2 * n - 1) * (2 * n + 1) / 3
  {
    var n := 1;
    var sum := SumOfSquaresOfFirstNOddNumbers(n);
    expect sum == 1;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R4:
  //   PRE:  n >= 0
  //   POST Q1: sum == n * (2 * n - 1) * (2 * n + 1) / 3
  {
    var n := 9;
    var sum := SumOfSquaresOfFirstNOddNumbers(n);
    // expect sum == 969; // got 1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R5:
  //   PRE:  n >= 0
  //   POST Q1: sum == n * (2 * n - 1) * (2 * n + 1) / 3
  {
    var n := 8;
    var sum := SumOfSquaresOfFirstNOddNumbers(n);
    // expect sum == 680; // got 1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R6:
  //   PRE:  n >= 0
  //   POST Q1: sum == n * (2 * n - 1) * (2 * n + 1) / 3
  {
    var n := 7;
    var sum := SumOfSquaresOfFirstNOddNumbers(n);
    // expect sum == 455; // got 1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R7:
  //   PRE:  n >= 0
  //   POST Q1: sum == n * (2 * n - 1) * (2 * n + 1) / 3
  {
    var n := 6;
    var sum := SumOfSquaresOfFirstNOddNumbers(n);
    // expect sum == 286; // got 1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R8:
  //   PRE:  n >= 0
  //   POST Q1: sum == n * (2 * n - 1) * (2 * n + 1) / 3
  {
    var n := 5;
    var sum := SumOfSquaresOfFirstNOddNumbers(n);
    // expect sum == 165; // got 1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R9:
  //   PRE:  n >= 0
  //   POST Q1: sum == n * (2 * n - 1) * (2 * n + 1) / 3
  {
    var n := 4;
    var sum := SumOfSquaresOfFirstNOddNumbers(n);
    // expect sum == 84; // got 1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R10:
  //   PRE:  n >= 0
  //   POST Q1: sum == n * (2 * n - 1) * (2 * n + 1) / 3
  {
    var n := 3;
    var sum := SumOfSquaresOfFirstNOddNumbers(n);
    // expect sum == 35; // got 1
  }

}

method Main()
{
  TestsForSumOfSquaresOfFirstNOddNumbers();
  print "TestsForSumOfSquaresOfFirstNOddNumbers: all non-failing tests passed!\n";
}
