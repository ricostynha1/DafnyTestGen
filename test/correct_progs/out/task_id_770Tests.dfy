// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_770.dfy
// Method: SumOfFourthPowerOfOddNumbers
// Generated: 2026-03-24 11:22:16

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

method GeneratedTests_SumOfFourthPowerOfOddNumbers()
{
  // Test case for combination {1}:
  //   POST: sum == n * (2 * n + 1) * (24 * n * n * n - 12 * n * n - 14 * n + 7) / 15
  {
    var n := 0;
    var sum := SumOfFourthPowerOfOddNumbers(n);
    expect sum == 0;
  }

  // Test case for combination {1}/Bn=1:
  //   POST: sum == n * (2 * n + 1) * (24 * n * n * n - 12 * n * n - 14 * n + 7) / 15
  {
    var n := 1;
    var sum := SumOfFourthPowerOfOddNumbers(n);
    expect sum == 1;
  }

  // Test case for combination {1}/R3:
  //   POST: sum == n * (2 * n + 1) * (24 * n * n * n - 12 * n * n - 14 * n + 7) / 15
  {
    var n := 45;
    var sum := SumOfFourthPowerOfOddNumbers(n);
    expect sum == 590247021;
  }

}

method Main()
{
  GeneratedTests_SumOfFourthPowerOfOddNumbers();
  print "GeneratedTests_SumOfFourthPowerOfOddNumbers: all tests passed!\n";
}
