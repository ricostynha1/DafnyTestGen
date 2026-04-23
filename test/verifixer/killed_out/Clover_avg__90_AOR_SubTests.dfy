// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Clover_avg__90_AOR_Sub.dfy
// Method: ComputeAvg
// Generated: 2026-04-22 21:26:55

// Clover_avg.dfy

method ComputeAvg(a: int, b: int) returns (avg: int)
  ensures avg == (a + b) / 2
  decreases a, b
{
  avg := (a - b) / 2;
}


method TestsForComputeAvg()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}:
  //   POST Q1: avg == (a + b) / 2
  {
    var a := -10;
    var b := -10;
    var avg := ComputeAvg(a, b);
    // expect avg == -10; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Oa=0:
  //   POST Q1: avg == (a + b) / 2
  {
    var a := 0;
    var b := -10;
    var avg := ComputeAvg(a, b);
    // expect avg == -5; // got 5
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Oa>0:
  //   POST Q1: avg == (a + b) / 2
  {
    var a := 10;
    var b := -10;
    var avg := ComputeAvg(a, b);
    // expect avg == 0; // got 10
  }

  // Test case for combination {1}/Ob=0:
  //   POST Q1: avg == (a + b) / 2
  {
    var a := -10;
    var b := 0;
    var avg := ComputeAvg(a, b);
    expect avg == -5;
  }

}

method Main()
{
  TestsForComputeAvg();
  print "TestsForComputeAvg: all non-failing tests passed!\n";
}
