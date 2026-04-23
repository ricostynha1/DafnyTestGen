// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\dafny-synthesis_task_id_267__359-363_EVR_int.dfy
// Method: SumOfSquaresOfFirstNOddNumbers
// Generated: 2026-04-22 21:42:23

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

}

method Main()
{
  TestsForSumOfSquaresOfFirstNOddNumbers();
  print "TestsForSumOfSquaresOfFirstNOddNumbers: all non-failing tests passed!\n";
}
