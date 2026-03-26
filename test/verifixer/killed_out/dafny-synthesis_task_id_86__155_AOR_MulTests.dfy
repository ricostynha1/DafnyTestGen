// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\dafny-synthesis_task_id_86__155_AOR_Mul.dfy
// Method: CenteredHexagonalNumber
// Generated: 2026-03-26 15:01:48

// dafny-synthesis_task_id_86.dfy

method CenteredHexagonalNumber(n: nat) returns (result: nat)
  requires n >= 0
  ensures result == 3 * n * (n - 1) + 1
  decreases n
{
  result := 3 * n * (n - 1) * 1;
}


method Passing()
{
  // (no passing tests)
}

method Failing()
{
  // Test case for combination {1}:
  //   PRE:  n >= 0
  //   POST: result == 3 * n * (n - 1) + 1
  {
    var n := 0;
    var result := CenteredHexagonalNumber(n);
    // expect result == 1;
  }

  // Test case for combination {1}:
  //   PRE:  n >= 0
  //   POST: result == 3 * n * (n - 1) + 1
  {
    var n := 1;
    var result := CenteredHexagonalNumber(n);
    // expect result == 1;
  }

  // Test case for combination {1}/R3:
  //   PRE:  n >= 0
  //   POST: result == 3 * n * (n - 1) + 1
  {
    var n := 2;
    var result := CenteredHexagonalNumber(n);
    // expect result == 7;
  }

}

method Main()
{
  Passing();
  Failing();
}
