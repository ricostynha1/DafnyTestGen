// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-synthesis_task_id_135__-_ODL_Sub-left.dfy
// Method: NthHexagonalNumber
// Generated: 2026-04-24 20:01:11

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
  // Test case for combination {1}:
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
  // Test case for combination {1}/R3:
  //   PRE:  n >= 0
  //   POST Q1: hexNum == n * (2 * n - 1)
  {
    var n := 3;
    var hexNum := NthHexagonalNumber(n);
    // expect hexNum == 15; // got 3
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R4:
  //   PRE:  n >= 0
  //   POST Q1: hexNum == n * (2 * n - 1)
  {
    var n := 2;
    var hexNum := NthHexagonalNumber(n);
    // expect hexNum == 6; // got 2
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R5:
  //   PRE:  n >= 0
  //   POST Q1: hexNum == n * (2 * n - 1)
  {
    var n := 8;
    var hexNum := NthHexagonalNumber(n);
    // expect hexNum == 120; // got 8
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R6:
  //   PRE:  n >= 0
  //   POST Q1: hexNum == n * (2 * n - 1)
  {
    var n := 10;
    var hexNum := NthHexagonalNumber(n);
    // expect hexNum == 190; // got 10
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R7:
  //   PRE:  n >= 0
  //   POST Q1: hexNum == n * (2 * n - 1)
  {
    var n := 4;
    var hexNum := NthHexagonalNumber(n);
    // expect hexNum == 28; // got 4
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R8:
  //   PRE:  n >= 0
  //   POST Q1: hexNum == n * (2 * n - 1)
  {
    var n := 6;
    var hexNum := NthHexagonalNumber(n);
    // expect hexNum == 66; // got 6
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R9:
  //   PRE:  n >= 0
  //   POST Q1: hexNum == n * (2 * n - 1)
  {
    var n := 5;
    var hexNum := NthHexagonalNumber(n);
    // expect hexNum == 45; // got 5
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R10:
  //   PRE:  n >= 0
  //   POST Q1: hexNum == n * (2 * n - 1)
  {
    var n := 7;
    var hexNum := NthHexagonalNumber(n);
    // expect hexNum == 91; // got 7
  }

}

method Main()
{
  TestsForNthHexagonalNumber();
  print "TestsForNthHexagonalNumber: all non-failing tests passed!\n";
}
