// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\dafny-synthesis_task_id_267.dfy
// Method: SumOfSquaresOfFirstNOddNumbers
// Generated: 2026-04-05 23:38:45

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
    i := i + 2;
  }
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  n >= 0
  //   POST: sum == n * (2 * n - 1) * (2 * n + 1) / 3
  {
    var n := 0;
    var sum := SumOfSquaresOfFirstNOddNumbers(n);
    expect sum == 0;
  }

  // Test case for combination {1}/Bn=1:
  //   PRE:  n >= 0
  //   POST: sum == n * (2 * n - 1) * (2 * n + 1) / 3
  {
    var n := 1;
    var sum := SumOfSquaresOfFirstNOddNumbers(n);
    expect sum == 1;
  }

  // Test case for combination {1}/R3:
  //   PRE:  n >= 0
  //   POST: sum == n * (2 * n - 1) * (2 * n + 1) / 3
  {
    var n := 4;
    var sum := SumOfSquaresOfFirstNOddNumbers(n);
    expect sum == 84;
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
