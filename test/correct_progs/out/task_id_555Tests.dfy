// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_555.dfy
// Method: DifferenceSumCubesAndSumNumbers
// Generated: 2026-04-20 14:59:27

// Returns the difference between the sum of the cubes and the
// sum of the first n positive natural numbers.
method DifferenceSumCubesAndSumNumbers(n: nat) returns (diff: int)
  ensures diff == (n * n * (n + 1) * (n + 1)) / 4 - (n * (n + 1)) / 2
{
  var sumCubes := SumCubes(n);
  var sumNumbers := SumNumbers(n);
  return sumCubes as int - sumNumbers as int; //added 'as int' to convert nat to int
}

// Computes  the sum of the cubes of the first n positive natural numbers.
method SumCubes(n: nat) returns (s: nat)
  ensures s == (n * n * (n + 1) * (n + 1)) / 4
{
  s := 0;
  var i := 0;
  while i < n
    invariant 0 <= i <= n
    invariant s == i * i * (i + 1) * (i + 1) / 4
  {
    i := i + 1;
    s := s + i * i * i;
  }
}

// Computes the sum of the first n positive natural numbers.
method SumNumbers(n: nat) returns (s: nat)
  ensures s == (n * (n + 1)) / 2
{
  s := 0;
  var i : nat := 0;
  while i < n
    invariant 0 <= i <= n
    invariant s == i * (i + 1) / 2
  {
    i := i + 1;
    s := s + i;
  }
}

// Test cases checked statically.
method DifferenceSumCubesAndSumNumbersTest(){
  var res4 := DifferenceSumCubesAndSumNumbers(0);
  assert res4 == 0;

  var res5 := DifferenceSumCubesAndSumNumbers(1);
  assert res5 == 0;

  var res6 := DifferenceSumCubesAndSumNumbers(2);
  assert res6 == 6; // (1+8) - (1+2)

  var res1:= DifferenceSumCubesAndSumNumbers(3);
  assert res1==30;
}

method TestsForDifferenceSumCubesAndSumNumbers()
{
  // Test case for combination {1}:
  //   POST: diff == n * n * (n + 1) * (n + 1) / 4 - n * (n + 1) / 2
  //   ENSURES: diff == n * n * (n + 1) * (n + 1) / 4 - n * (n + 1) / 2
  {
    var n := 10;
    var diff := DifferenceSumCubesAndSumNumbers(n);
    expect diff == 2970;
  }

  // Test case for combination {1}/Bn=0:
  //   POST: diff == n * n * (n + 1) * (n + 1) / 4 - n * (n + 1) / 2
  //   ENSURES: diff == n * n * (n + 1) * (n + 1) / 4 - n * (n + 1) / 2
  {
    var n := 0;
    var diff := DifferenceSumCubesAndSumNumbers(n);
    expect diff == 0;
  }

  // Test case for combination {1}/Bn=1:
  //   POST: diff == n * n * (n + 1) * (n + 1) / 4 - n * (n + 1) / 2
  //   ENSURES: diff == n * n * (n + 1) * (n + 1) / 4 - n * (n + 1) / 2
  {
    var n := 1;
    var diff := DifferenceSumCubesAndSumNumbers(n);
    expect diff == 0;
  }

  // Test case for combination {1}/R4:
  //   POST: diff == n * n * (n + 1) * (n + 1) / 4 - n * (n + 1) / 2
  //   ENSURES: diff == n * n * (n + 1) * (n + 1) / 4 - n * (n + 1) / 2
  {
    var n := 9;
    var diff := DifferenceSumCubesAndSumNumbers(n);
    expect diff == 1980;
  }

}

method TestsForSumCubes()
{
  // Test case for combination {1}:
  //   POST: s == n * n * (n + 1) * (n + 1) / 4
  //   ENSURES: s == n * n * (n + 1) * (n + 1) / 4
  {
    var n := 4;
    var s := SumCubes(n);
    expect s == 100;
  }

  // Test case for combination {1}/Bn=0:
  //   POST: s == n * n * (n + 1) * (n + 1) / 4
  //   ENSURES: s == n * n * (n + 1) * (n + 1) / 4
  {
    var n := 0;
    var s := SumCubes(n);
    expect s == 0;
  }

  // Test case for combination {1}/Bn=1:
  //   POST: s == n * n * (n + 1) * (n + 1) / 4
  //   ENSURES: s == n * n * (n + 1) * (n + 1) / 4
  {
    var n := 1;
    var s := SumCubes(n);
    expect s == 1;
  }

  // Test case for combination {1}/R4:
  //   POST: s == n * n * (n + 1) * (n + 1) / 4
  //   ENSURES: s == n * n * (n + 1) * (n + 1) / 4
  {
    var n := 9;
    var s := SumCubes(n);
    expect s == 2025;
  }

}

method TestsForSumNumbers()
{
  // Test case for combination {1}:
  //   POST: s == n * (n + 1) / 2
  //   ENSURES: s == n * (n + 1) / 2
  {
    var n := 10;
    var s := SumNumbers(n);
    expect s == 55;
  }

  // Test case for combination {1}/Bn=0:
  //   POST: s == n * (n + 1) / 2
  //   ENSURES: s == n * (n + 1) / 2
  {
    var n := 0;
    var s := SumNumbers(n);
    expect s == 0;
  }

  // Test case for combination {1}/Bn=1:
  //   POST: s == n * (n + 1) / 2
  //   ENSURES: s == n * (n + 1) / 2
  {
    var n := 1;
    var s := SumNumbers(n);
    expect s == 1;
  }

  // Test case for combination {1}/R4:
  //   POST: s == n * (n + 1) / 2
  //   ENSURES: s == n * (n + 1) / 2
  {
    var n := 2;
    var s := SumNumbers(n);
    expect s == 3;
  }

}

method Main()
{
  TestsForDifferenceSumCubesAndSumNumbers();
  print "TestsForDifferenceSumCubesAndSumNumbers: all non-failing tests passed!\n";
  TestsForSumCubes();
  print "TestsForSumCubes: all non-failing tests passed!\n";
  TestsForSumNumbers();
  print "TestsForSumNumbers: all non-failing tests passed!\n";
}
