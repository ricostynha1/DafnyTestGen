// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\dafny-synthesis_task_id_135.dfy
// Method: NthHexagonalNumber
// Generated: 2026-03-25 22:38:24

// dafny-synthesis_task_id_135.dfy

method NthHexagonalNumber(n: int) returns (hexNum: int)
  requires n >= 0
  ensures hexNum == n * (2 * n - 1)
  decreases n
{
  hexNum := n * (2 * n - 1);
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  n >= 0
  //   POST: hexNum == n * (2 * n - 1)
  {
    var n := 0;
    var hexNum := NthHexagonalNumber(n);
    expect hexNum == 0;
  }

  // Test case for combination {1}:
  //   PRE:  n >= 0
  //   POST: hexNum == n * (2 * n - 1)
  {
    var n := 1;
    var hexNum := NthHexagonalNumber(n);
    expect hexNum == 1;
  }

  // Test case for combination {1}/R3:
  //   PRE:  n >= 0
  //   POST: hexNum == n * (2 * n - 1)
  {
    var n := 4;
    var hexNum := NthHexagonalNumber(n);
    expect hexNum == 28;
  }

}

method Failing()
{
  // (no failing tests)
}

method Main()
{
  Passing();
  Failing();
}
