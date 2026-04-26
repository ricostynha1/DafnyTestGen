// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-synthesis_task_id_86__155_AOR_Mul.dfy
// Method: CenteredHexagonalNumber
// Generated: 2026-04-24 20:09:13

// dafny-synthesis_task_id_86.dfy

method CenteredHexagonalNumber(n: nat) returns (result: nat)
  requires n >= 0
  ensures result == 3 * n * (n - 1) + 1
  decreases n
{
  result := 3 * n * (n - 1) * 1;
}


method TestsForCenteredHexagonalNumber()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}:
  //   PRE:  n >= 0
  //   POST Q1: result == 3 * n * (n - 1) + 1
  {
    var n := 1;
    var result := CenteredHexagonalNumber(n);
    // expect result == 1; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bn=0:
  //   PRE:  n >= 0
  //   POST Q1: result == 3 * n * (n - 1) + 1
  {
    var n := 0;
    var result := CenteredHexagonalNumber(n);
    // expect result == 1; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/On>=2:
  //   PRE:  n >= 0
  //   POST Q1: result == 3 * n * (n - 1) + 1
  {
    var n := 2;
    var result := CenteredHexagonalNumber(n);
    // expect result == 7; // got 6
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R4:
  //   PRE:  n >= 0
  //   POST Q1: result == 3 * n * (n - 1) + 1
  {
    var n := 3;
    var result := CenteredHexagonalNumber(n);
    // expect result == 19; // got 18
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R5:
  //   PRE:  n >= 0
  //   POST Q1: result == 3 * n * (n - 1) + 1
  {
    var n := 4;
    var result := CenteredHexagonalNumber(n);
    // expect result == 37; // got 36
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R6:
  //   PRE:  n >= 0
  //   POST Q1: result == 3 * n * (n - 1) + 1
  {
    var n := 5;
    var result := CenteredHexagonalNumber(n);
    // expect result == 61; // got 60
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R7:
  //   PRE:  n >= 0
  //   POST Q1: result == 3 * n * (n - 1) + 1
  {
    var n := 6;
    var result := CenteredHexagonalNumber(n);
    // expect result == 91; // got 90
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R8:
  //   PRE:  n >= 0
  //   POST Q1: result == 3 * n * (n - 1) + 1
  {
    var n := 7;
    var result := CenteredHexagonalNumber(n);
    // expect result == 127; // got 126
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R9:
  //   PRE:  n >= 0
  //   POST Q1: result == 3 * n * (n - 1) + 1
  {
    var n := 8;
    var result := CenteredHexagonalNumber(n);
    // expect result == 169; // got 168
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R10:
  //   PRE:  n >= 0
  //   POST Q1: result == 3 * n * (n - 1) + 1
  {
    var n := 9;
    var result := CenteredHexagonalNumber(n);
    // expect result == 217; // got 216
  }

}

method Main()
{
  TestsForCenteredHexagonalNumber();
  print "TestsForCenteredHexagonalNumber: all non-failing tests passed!\n";
}
