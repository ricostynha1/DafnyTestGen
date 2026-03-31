// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_599.dfy
// Method: SumAndAverage
// Generated: 2026-03-31 21:30:10

// Calculates the sum and average of the first n natural numbers.
method SumAndAverage(n: nat) returns (sum: nat, average: real)
  requires n > 0
  ensures sum == n * (n + 1) / 2
  ensures average == sum as real / n as real
{
    sum := 0;
    for i := 1 to n + 1
      invariant sum == (i - 1) * i / 2
    {
        sum := sum + i;
    }
    average := sum as real / n as real;
}

// Test cases chcked statically.
method SumAndAverageTest(){
    // Small n
    var sum1, avg1 := SumAndAverage(10);
    assert sum1 == 55 && avg1 == 5.5;

    // Large n
    var sum4, avg4 := SumAndAverage(100000);
    assert sum4 == 5000050000 && avg4 == 50000.5;

    // Smallest n
    var sum3, avg3 := SumAndAverage(1);
    assert sum3 == 1 && avg3 == 1.0;
}


method GeneratedTests_SumAndAverage()
{
  // Test case for combination {1}:
  //   PRE:  n > 0
  //   POST: sum == n * (n + 1) / 2
  //   POST: average == sum as real / n as real
  {
    var n := 2;
    var check_sum := n * (n + 1) / 2;
    expect n > 0; // PRE-CHECK
    var sum, average := SumAndAverage(n);
    expect sum == check_sum;
    expect average == sum as real / n as real;
  }

  // Test case for combination {1}/Bn=1:
  //   PRE:  n > 0
  //   POST: sum == n * (n + 1) / 2
  //   POST: average == sum as real / n as real
  {
    var n := 1;
    var check_sum := n * (n + 1) / 2;
    expect n > 0; // PRE-CHECK
    var sum, average := SumAndAverage(n);
    expect sum == check_sum;
    expect average == sum as real / n as real;
  }

  // Test case for combination {1}/R3:
  //   PRE:  n > 0
  //   POST: sum == n * (n + 1) / 2
  //   POST: average == sum as real / n as real
  {
    var n := 4;
    var check_sum := n * (n + 1) / 2;
    expect n > 0; // PRE-CHECK
    var sum, average := SumAndAverage(n);
    expect sum == check_sum;
    expect average == sum as real / n as real;
  }

}

method Main()
{
  GeneratedTests_SumAndAverage();
  print "GeneratedTests_SumAndAverage: all tests passed!\n";
}
