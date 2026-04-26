// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_555.dfy
// Method: DifferenceSumCubesAndSumNumbers
// Generated: 2026-04-23 20:40:12

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
  //   POST Q1: diff == n * n * (n + 1) * (n + 1) / 4 - n * (n + 1) / 2
  {
    var n := 10;
    var diff := DifferenceSumCubesAndSumNumbers(n);
    expect diff == 2970;
  }

  // Test case for combination {1}/Bn=0:
  //   POST Q1: diff == n * n * (n + 1) * (n + 1) / 4 - n * (n + 1) / 2
  {
    var n := 0;
    var diff := DifferenceSumCubesAndSumNumbers(n);
    expect diff == 0;
  }

  // Test case for combination {1}/Bn=1:
  //   POST Q1: diff == n * n * (n + 1) * (n + 1) / 4 - n * (n + 1) / 2
  {
    var n := 1;
    var diff := DifferenceSumCubesAndSumNumbers(n);
    expect diff == 0;
  }

  // Test case for combination {1}/R4:
  //   POST Q1: diff == n * n * (n + 1) * (n + 1) / 4 - n * (n + 1) / 2
  {
    var n := 9;
    var diff := DifferenceSumCubesAndSumNumbers(n);
    expect diff == 1980;
  }

  // Test case for combination {1}/R5:
  //   POST Q1: diff == n * n * (n + 1) * (n + 1) / 4 - n * (n + 1) / 2
  {
    var n := 8;
    var diff := DifferenceSumCubesAndSumNumbers(n);
    expect diff == 1260;
  }

  // Test case for combination {1}/R6:
  //   POST Q1: diff == n * n * (n + 1) * (n + 1) / 4 - n * (n + 1) / 2
  {
    var n := 7;
    var diff := DifferenceSumCubesAndSumNumbers(n);
    expect diff == 756;
  }

  // Test case for combination {1}/R7:
  //   POST Q1: diff == n * n * (n + 1) * (n + 1) / 4 - n * (n + 1) / 2
  {
    var n := 6;
    var diff := DifferenceSumCubesAndSumNumbers(n);
    expect diff == 420;
  }

  // Test case for combination {1}/R8:
  //   POST Q1: diff == n * n * (n + 1) * (n + 1) / 4 - n * (n + 1) / 2
  {
    var n := 5;
    var diff := DifferenceSumCubesAndSumNumbers(n);
    expect diff == 210;
  }

  // Test case for combination {1}/R9:
  //   POST Q1: diff == n * n * (n + 1) * (n + 1) / 4 - n * (n + 1) / 2
  {
    var n := 4;
    var diff := DifferenceSumCubesAndSumNumbers(n);
    expect diff == 90;
  }

  // Test case for combination {1}/R10:
  //   POST Q1: diff == n * n * (n + 1) * (n + 1) / 4 - n * (n + 1) / 2
  {
    var n := 3;
    var diff := DifferenceSumCubesAndSumNumbers(n);
    expect diff == 30;
  }

}

method TestsForSumCubes()
{
  // Test case for combination {1}:
  //   POST Q1: s == n * n * (n + 1) * (n + 1) / 4
  {
    var n := 10;
    var s := SumCubes(n);
    expect s == 3025;
  }

  // Test case for combination {1}/Bn=0:
  //   POST Q1: s == n * n * (n + 1) * (n + 1) / 4
  {
    var n := 0;
    var s := SumCubes(n);
    expect s == 0;
  }

  // Test case for combination {1}/Bn=1:
  //   POST Q1: s == n * n * (n + 1) * (n + 1) / 4
  {
    var n := 1;
    var s := SumCubes(n);
    expect s == 1;
  }

  // Test case for combination {1}/R4:
  //   POST Q1: s == n * n * (n + 1) * (n + 1) / 4
  {
    var n := 9;
    var s := SumCubes(n);
    expect s == 2025;
  }

  // Test case for combination {1}/R5:
  //   POST Q1: s == n * n * (n + 1) * (n + 1) / 4
  {
    var n := 8;
    var s := SumCubes(n);
    expect s == 1296;
  }

  // Test case for combination {1}/R6:
  //   POST Q1: s == n * n * (n + 1) * (n + 1) / 4
  {
    var n := 7;
    var s := SumCubes(n);
    expect s == 784;
  }

  // Test case for combination {1}/R7:
  //   POST Q1: s == n * n * (n + 1) * (n + 1) / 4
  {
    var n := 6;
    var s := SumCubes(n);
    expect s == 441;
  }

  // Test case for combination {1}/R8:
  //   POST Q1: s == n * n * (n + 1) * (n + 1) / 4
  {
    var n := 5;
    var s := SumCubes(n);
    expect s == 225;
  }

  // Test case for combination {1}/R9:
  //   POST Q1: s == n * n * (n + 1) * (n + 1) / 4
  {
    var n := 4;
    var s := SumCubes(n);
    expect s == 100;
  }

  // Test case for combination {1}/R10:
  //   POST Q1: s == n * n * (n + 1) * (n + 1) / 4
  {
    var n := 3;
    var s := SumCubes(n);
    expect s == 36;
  }

}

method TestsForSumNumbers()
{
  // Test case for combination {1}:
  //   POST Q1: s == n * (n + 1) / 2
  {
    var n := 10;
    var s := SumNumbers(n);
    expect s == 55;
  }

  // Test case for combination {1}/Bn=0:
  //   POST Q1: s == n * (n + 1) / 2
  {
    var n := 0;
    var s := SumNumbers(n);
    expect s == 0;
  }

  // Test case for combination {1}/Bn=1:
  //   POST Q1: s == n * (n + 1) / 2
  {
    var n := 1;
    var s := SumNumbers(n);
    expect s == 1;
  }

  // Test case for combination {1}/R4:
  //   POST Q1: s == n * (n + 1) / 2
  {
    var n := 2;
    var s := SumNumbers(n);
    expect s == 3;
  }

  // Test case for combination {1}/R5:
  //   POST Q1: s == n * (n + 1) / 2
  {
    var n := 4;
    var s := SumNumbers(n);
    expect s == 10;
  }

  // Test case for combination {1}/R6:
  //   POST Q1: s == n * (n + 1) / 2
  {
    var n := 6;
    var s := SumNumbers(n);
    expect s == 21;
  }

  // Test case for combination {1}/R7:
  //   POST Q1: s == n * (n + 1) / 2
  {
    var n := 8;
    var s := SumNumbers(n);
    expect s == 36;
  }

  // Test case for combination {1}/R8:
  //   POST Q1: s == n * (n + 1) / 2
  {
    var n := 9;
    var s := SumNumbers(n);
    expect s == 45;
  }

  // Test case for combination {1}/R9:
  //   POST Q1: s == n * (n + 1) / 2
  {
    var n := 7;
    var s := SumNumbers(n);
    expect s == 28;
  }

  // Test case for combination {1}/R10:
  //   POST Q1: s == n * (n + 1) / 2
  {
    var n := 5;
    var s := SumNumbers(n);
    expect s == 15;
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
