// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\dafny-synthesis_task_id_135.dfy
// Method: NthHexagonalNumber
// Generated: 2026-04-22 21:31:52

// dafny-synthesis_task_id_135.dfy

method NthHexagonalNumber(n: int) returns (hexNum: int)
  requires n >= 0
  ensures hexNum == n * (2 * n - 1)
  decreases n
{
  hexNum := n * (2 * n - 1);
}


method TestsForNthHexagonalNumber()
{
  // Test case for combination {1}:
  //   PRE:  n >= 0
  //   POST Q1: hexNum == n * (2 * n - 1)
  {
    var n := 10;
    var hexNum := NthHexagonalNumber(n);
    expect hexNum == 190;
  }

  // Test case for combination {1}/Bn=0:
  //   PRE:  n >= 0
  //   POST Q1: hexNum == n * (2 * n - 1)
  {
    var n := 0;
    var hexNum := NthHexagonalNumber(n);
    expect hexNum == 0;
  }

  // Test case for combination {1}/Bn=1:
  //   PRE:  n >= 0
  //   POST Q1: hexNum == n * (2 * n - 1)
  {
    var n := 1;
    var hexNum := NthHexagonalNumber(n);
    expect hexNum == 1;
  }

  // Test case for combination {1}/R4:
  //   PRE:  n >= 0
  //   POST Q1: hexNum == n * (2 * n - 1)
  {
    var n := 9;
    var hexNum := NthHexagonalNumber(n);
    expect hexNum == 153;
  }

}

method Main()
{
  TestsForNthHexagonalNumber();
  print "TestsForNthHexagonalNumber: all non-failing tests passed!\n";
}
