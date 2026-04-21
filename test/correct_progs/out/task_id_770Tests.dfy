// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_770.dfy
// Method: SumOfFourthPowerOfOddNumbers
// Generated: 2026-04-21 22:56:44

// Returns the sum of the fourth power of the first n odd numbers.
method SumOfFourthPowerOfOddNumbers(n: nat) returns (sum: nat)
    ensures sum == n * (2 * n + 1) * (24 * n * n * n - 12 * n * n  - 14 * n + 7) / 15
{
    sum := 0;
    var i := 1;
    for k := 0 to n
        invariant i == 2 * k + 1
        invariant sum == k * (2 * k + 1) * (24 * k * k * k - 12 * k * k  - 14 * k + 7) / 15
    {
        sum := sum + i * i * i * i;
        i := i + 2;
    }
}

// Test cases checked statically.
method SumOfFourthPowerOfOddNumbersTest(){
    var out4 := SumOfFourthPowerOfOddNumbers(0);
    assert out4 == 0;

    var out5 := SumOfFourthPowerOfOddNumbers(1);
    assert out5 == 1;

    var out1 := SumOfFourthPowerOfOddNumbers(2);
    assert out1 == 82;

    var out2 := SumOfFourthPowerOfOddNumbers(3);
    assert out2 == 707;
}

method TestsForSumOfFourthPowerOfOddNumbers()
{
  // Test case for combination {1}:
  //   POST Q1: sum == n * (2 * n + 1) * (24 * n * n * n - 12 * n * n - 14 * n + 7) / 15
  {
    var n := 10;
    var sum := SumOfFourthPowerOfOddNumbers(n);
    expect sum == 317338;
  }

  // Test case for combination {1}/Bn=0:
  //   POST Q1: sum == n * (2 * n + 1) * (24 * n * n * n - 12 * n * n - 14 * n + 7) / 15
  {
    var n := 0;
    var sum := SumOfFourthPowerOfOddNumbers(n);
    expect sum == 0;
  }

  // Test case for combination {1}/Bn=1:
  //   POST Q1: sum == n * (2 * n + 1) * (24 * n * n * n - 12 * n * n - 14 * n + 7) / 15
  {
    var n := 1;
    var sum := SumOfFourthPowerOfOddNumbers(n);
    expect sum == 1;
  }

  // Test case for combination {1}/R4:
  //   POST Q1: sum == n * (2 * n + 1) * (24 * n * n * n - 12 * n * n - 14 * n + 7) / 15
  {
    var n := 9;
    var sum := SumOfFourthPowerOfOddNumbers(n);
    expect sum == 187017;
  }

}

method Main()
{
  TestsForSumOfFourthPowerOfOddNumbers();
  print "TestsForSumOfFourthPowerOfOddNumbers: all non-failing tests passed!\n";
}
