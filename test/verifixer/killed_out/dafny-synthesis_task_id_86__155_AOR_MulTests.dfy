// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\dafny-synthesis_task_id_86__155_AOR_Mul.dfy
// Method: CenteredHexagonalNumber
// Generated: 2026-04-22 21:45:17

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
    var n := 10;
    var result := CenteredHexagonalNumber(n);
    // expect result == 271; // got 270
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
  // Test case for combination {1}/Bn=1:
  //   PRE:  n >= 0
  //   POST Q1: result == 3 * n * (n - 1) + 1
  {
    var n := 1;
    var result := CenteredHexagonalNumber(n);
    // expect result == 1; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R4:
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
