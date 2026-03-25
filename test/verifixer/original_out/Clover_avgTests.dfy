// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Clover_avg.dfy
// Method: ComputeAvg
// Generated: 2026-03-25 22:36:21

// Clover_avg.dfy

method ComputeAvg(a: int, b: int) returns (avg: int)
  ensures avg == (a + b) / 2
  decreases a, b
{
  avg := (a + b) / 2;
}


method Passing()
{
  // Test case for combination {1}:
  //   POST: avg == (a + b) / 2
  {
    var a := 0;
    var b := 0;
    var avg := ComputeAvg(a, b);
    expect avg == 0;
  }

  // Test case for combination {1}:
  //   POST: avg == (a + b) / 2
  {
    var a := 1;
    var b := 0;
    var avg := ComputeAvg(a, b);
    expect avg == 0;
  }

  // Test case for combination {1}/Ba=0,b=1:
  //   POST: avg == (a + b) / 2
  {
    var a := 0;
    var b := 1;
    var avg := ComputeAvg(a, b);
    expect avg == 0;
  }

  // Test case for combination {1}/Ba=1,b=1:
  //   POST: avg == (a + b) / 2
  {
    var a := 1;
    var b := 1;
    var avg := ComputeAvg(a, b);
    expect avg == 1;
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
