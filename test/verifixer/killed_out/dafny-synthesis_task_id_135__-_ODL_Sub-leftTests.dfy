// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\dafny-synthesis_task_id_135__-_ODL_Sub-left.dfy
// Method: NthHexagonalNumber
// Generated: 2026-04-22 21:42:11

// dafny-synthesis_task_id_135.dfy

method NthHexagonalNumber(n: int) returns (hexNum: int)
  requires n >= 0
  ensures hexNum == n * (2 * n - 1)
  decreases n
{
  hexNum := n * 1;
}


method TestsForNthHexagonalNumber()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}:
  //   PRE:  n >= 0
  //   POST Q1: hexNum == n * (2 * n - 1)
  {
    var n := 10;
    var hexNum := NthHexagonalNumber(n);
    // expect hexNum == 190; // got 10
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

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R4:
  //   PRE:  n >= 0
  //   POST Q1: hexNum == n * (2 * n - 1)
  {
    var n := 9;
    var hexNum := NthHexagonalNumber(n);
    // expect hexNum == 153; // got 9
  }

}

method Main()
{
  TestsForNthHexagonalNumber();
  print "TestsForNthHexagonalNumber: all non-failing tests passed!\n";
}
