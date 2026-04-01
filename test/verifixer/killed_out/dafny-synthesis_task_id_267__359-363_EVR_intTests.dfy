// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\dafny-synthesis_task_id_267__359-363_EVR_int.dfy
// Method: SumOfSquaresOfFirstNOddNumbers
// Generated: 2026-04-01 22:30:05

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


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  n >= 0
  //   POST: sum == n * (2 * n - 1) * (2 * n + 1) / 3
  {
    var n := 0;
    expect n >= 0; // PRE-CHECK
    var sum := SumOfSquaresOfFirstNOddNumbers(n);
    expect sum == 0;
  }

  // Test case for combination {1}/Bn=1:
  //   PRE:  n >= 0
  //   POST: sum == n * (2 * n - 1) * (2 * n + 1) / 3
  {
    var n := 1;
    expect n >= 0; // PRE-CHECK
    var sum := SumOfSquaresOfFirstNOddNumbers(n);
    expect sum == 1;
  }

}

method Failing()
{
  // Test case for combination {1}/R3:
  //   PRE:  n >= 0
  //   POST: sum == n * (2 * n - 1) * (2 * n + 1) / 3
  {
    var n := 4;
    // expect n >= 0; // PRE-CHECK
    var sum := SumOfSquaresOfFirstNOddNumbers(n);
    // expect sum == 84;
  }

}

method Main()
{
  Passing();
  Failing();
}
